# _*_coding:utf-8 _*_
#!/usr/bin/python3
#Reference:********************************
# encoding: utf-8
#@Time: 2020/2/28  18:04
#@Author: 洞洞
#@File: protocol_test.py
#@Function:
#@Method:
#Reference:********************************
import json
import random
import socket
import time
import uuid

import six
from poco.utils.simplerpc.transport.tcp.protocol import SimpleProtocolFilter

DEFAULT_TIMEOUT = 0.8
DEFAULT_SIZE = 4096


class Client(object):

    """safe and exact recv & send"""


    def __init__(self, address, on_connect=None, on_close=None):
        """address is (host, port) tuple"""
        self.address = address
        self.on_connect = on_connect
        self.on_close = on_close
        self.sock = None
        self.buf = b""
        self.prot = SimpleProtocolFilter()

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
            trunk = self.recv(min(size-len(self.buf), DEFAULT_SIZE))
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

if __name__ == '__main__':
    ip =  15004

    c = Client(('127.0.0.1', ip))
    b = {"method": "Dump", "params": [True], "jsonrpc": "2.0", "id": ""}
    # s = json.loads(b)
    # print(s)
    b["id"] = six.text_type(uuid.uuid4())
    b = json.dumps(b)
    c.connect()
    msg_bytes = c.prot.pack(b)
    c.send(msg_bytes)
    ret1 = b""
    print(time.time())
    while True:
        try:
            ret =  c.recv()
            # print(ret)
        except Exception:
            print(time.time())
            break
        # ret = c.prot.unpack(ret)
        # s = ret[1]
        # ret = str(ret, encoding="utf-8")
        ret1 = ret1+ret
    ret = c.prot.unpack(ret1)
    s = ret[1]
    # s = str(s,encoding="utf-8")
    print(s)
    s = str(s, encoding="utf-8")
    print(time.time())
    print(s)

