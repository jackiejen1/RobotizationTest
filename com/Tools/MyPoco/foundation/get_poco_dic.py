# _*_coding:utf-8 _*_
#!/usr/bin/python3
#Reference:********************************
# encoding: utf-8
#@Time: 2020/3/25  10:39
#@Author: 洞洞
#@File: get_poco_dic.py
#@Function:
#@Method:
#Reference:********************************
import json
import socket
import uuid
from airtest.core.helper import device_platform
import six
from poco.utils.simplerpc.transport.tcp.protocol import SimpleProtocolFilter
from airtest.core.api import connect_device, device as current_device
DEFAULT_TIMEOUT = 1
DEFAULT_SIZE = 4096

class GetPocoDic(object):
    """safe and exact recv & send"""
    def __init__(self, phone_name="", on_connect=None, on_close=None):
        """address is (host, port) tuple"""
        self.phone_name = phone_name
        self.connect_phone()
        self.address = (self.ip, self.port)
        self.on_connect = on_connect
        self.on_close = on_close
        self.sock = None
        self.buf = b""
        self.prot = SimpleProtocolFilter()
    def connect_phone(self):
        self.port = 15004
        device = None or current_device()
        if not device:
            device = connect_device("Android:///" + self.phone_name)
        platform_name = device_platform(device)
        if platform_name == 'Android':
            # always forward for android device to avoid network unreachable
            local_port, _ = device.adb.setup_forward('tcp:{}'.format(self.port))
            self.ip = device.adb.host or 'localhost'
            self.port = local_port
        elif platform_name == 'IOS':
            # ip = device.get_ip_address()
            # use iproxy first
            self.ip = 'localhost'
            local_port, _ = device.instruct_helper.setup_proxy(self.port)
            self.port = local_port
        else:
            try:
                self.ip = device.get_ip_address()
            except AttributeError:
                try:
                    self.ip = socket.gethostbyname(socket.gethostname())
                except socket.gaierror:
                    # 某些特殊情况下会出现这个error，无法正确获取本机ip地址
                    self.ip = 'localhost'

    def connect(self):
        # create a new socket every time
        self.sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        self.sock.settimeout(DEFAULT_TIMEOUT)
        self.sock.connect(self.address)
        self._handle_connect()

    def send(self, msg):
        totalsent = 0
        while totalsent < len(msg):
            sent = self.sock.send(msg)
            if sent == 0:
                self._handle_close()
                raise socket.error("socket connection broken")
            totalsent += sent

    def recv(self, size=DEFAULT_SIZE):
        trunk = self.sock.recv(size)
        if trunk == b"":
            self._handle_close()
            raise socket.error("socket connection broken")
        return trunk

    def recv_all(self, size):
        while len(self.buf) < size:
            trunk = self.recv(min(size - len(self.buf), DEFAULT_SIZE))
            self.buf += trunk
        ret, self.buf = self.buf[:size], self.buf[size:]
        return ret

    def settimeout(self, timeout):
        self.sock.settimeout(timeout)

    def recv_nonblocking(self, size):
        self.sock.settimeout(0)
        try:
            ret = self.recv(size)
        except socket.error as e:
            # 10035 no data when nonblocking
            if e.args[0] == 10035:  # errno.EWOULDBLOCK: errno is not always right
                ret = None
            # 10053 connection abort by client
            # 10054 connection reset by peer
            elif e.args[0] in [10053, 10054]:  # errno.ECONNABORTED:
                raise
            else:
                raise
        return ret

    def close(self):
        self.sock.shutdown(socket.SHUT_RDWR)
        self.sock.close()
        self._handle_close()

    def _handle_connect(self):
        if callable(self.on_connect):
            self.on_connect()

    def _handle_close(self):
        if callable(self.on_close):
            self.on_close()

    def get_ui_tree(self, dic, new_poco_dic):  # 用于新poco规则
        """
        遍历节点，生成字典{name:payload}
        :param dic: 根节点字典
        :param new_poco_dic: 生成的字典，贯穿整个UI树
        :return: new_poco_dic
        """
        dics = dic
        keys = dic.keys()
        if 'node' in keys:  # 第一次进来
            dics = dic['node']
            keys = dics.keys()
        if "name" in dics.keys():
            this_name = dics['name']
            new_poco_dic[this_name] = dics['payload']
        if "text" in dics['payload'].keys():
            # 获取text内容
            this_text = dics['payload']['text']
            if this_text != "":
                # text作为key
                # 名字、text都在元素列表里面
                new_poco_dic[this_text] = dics['payload']
        if 'children' in keys:
            childs_list = dics['children']
            for i in range(len(childs_list)):
                childs_dic = childs_list[i]
                new_poco_dic = self.get_ui_tree(childs_dic, new_poco_dic)

        return new_poco_dic

    def get_poco_dic(self):
        b = {"method": "Dump", "params": [True], "jsonrpc": "2.0", "id": ""}
        b["id"] = six.text_type(uuid.uuid4())
        b = json.dumps(b)
        self.connect()
        msg_bytes = self.prot.pack(b)
        self.send(msg_bytes)
        ret1 = b""
        while True:
            try:
                ret = self.recv()
            except Exception:
                break
            ret1 = ret1 + ret
        ret = self.prot.unpack(ret1)
        s = ret[1]
        s = str(s, encoding="utf-8")
        s = json.loads(s)
        d = self.get_ui_tree(s["result"], {})
        self.close()
        return d