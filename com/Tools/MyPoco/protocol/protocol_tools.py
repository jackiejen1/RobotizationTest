# _*_coding:utf-8 _*_
# !/usr/bin/python3
# Reference:********************************
# encoding: utf-8
# @Time: 2020/02/20  17:16
# @Author: 洞洞
# @File:
# @Function:
# @Method:
# Reference:********************************
from MyPoco.airtestide_lack_packages import xlrd
from MyPoco.protocol_file import cs_pb2, cg_pb2, out_base_pb2
import re
from MyPoco.foundation.information import Information
import struct
import time
from socket import error
def protobuf_protocol(data, api_attr):
    """
    消息体拼接函数，根据项目组装包头
    :param data: pb协议对象，消息体
    :param api_attr:
    :return:
    """
    msg_data_str = data
    pack_length = len(msg_data_str) + 32#32 是包头长度
    cmd = api_attr['send_cmd']#发包协议ID号
    uid = api_attr['uid']
    sid = api_attr['sid']
    cid = 0
    head_data = struct.pack(">IIQQQ", pack_length, cmd, uid, sid, cid)#把包头需要的信息转成bytes
    #IIQQQ表示根据什么规则去把python的类型转换成c的类型
    #>大端小端，内存对其？设备位数？
    msg_data_str = head_data + msg_data_str#把包头和包体拼接
    return msg_data_str

# 全部协议打包函数字典
all_protocol = {
    'protobuf-ss': protobuf_protocol,
}

# 给外部调用的函数
# def pack_varint(val):
#     total = b''
#     if val < 0:
#         val = (1 << 32) + val
#     while val >= 0x80:
#         bits = val & 0x7F
#         val >>= 7
#         total += struct.pack('B', (0x80 | bits))
#     bits = val & 0x7F
#     total += struct.pack('B', bits)
#     return total

# 给外部调用的主函数
def pack_data(data, api_attr=None):
    """
    打包函数，数据bytes化
    :param data: pb协议对象，消息体
    :param api_attr: 用来打包的参数字典
    :return:
    """
    msg_data_str = b''
    protocol = api_attr['protocol']
    if protocol in all_protocol.keys():
        data = all_protocol[protocol](data, api_attr)#打包函数，all_protocol[protocol]是个函数
        return data
    else:
        print("not found protocol process")
        return msg_data_str

def _recv_data(s, api_attr, buffersize, limittime):
    # 不同的游戏可以自行修改此接收数据的处理方法，以实现不同的游戏规则
    """
        接收socket上的数据，使用了超时设置
        :param s: 接收数据使用的socket
        :param api_attr: 接口属性字典
        :param buffersize: 数据包头大小
        :param limitime: 接收超时时长
        :return: 接收标志与接收到的数据，出错时返回的数据为 b'error'
        """
    recvcmd = api_attr['recv_cmd']#确定需要接收的协议ID
    recvdata_dic = {}
    then_len = 0
    print("当前接收接口:--{} cmd: {}".format(api_attr['name'], recvcmd))
    rst = int(time.time())
    s.settimeout(limittime)  # 设置超时时间
    while True:#这里是一直接收数据的，只要有消息，就一直接收
        try:
            ct = int(time.time())
            #规定时间内没有收到想要的包就退出
            if ct - rst > limittime:
                recvtime = time.time()
                recvdata = b'error'
                print("等了很久都没有等到想要的")
                return recvdata, recvtime
            rev_data = s.recv(buffersize)#第一次接收数据，只获取消息头，消息头包含数据体的长度和协议编号
            if len(rev_data) == 0:
                print(str(api_attr['uid'])+":error,消息头长度为0")
                raise Exception("消息头长度为0")
                # data = b'error'
                # recv_time = time.time()
                # return data, recv_time
            if len(rev_data) < buffersize:#服务端拆包发送，第一条不是完整数据，包头长度会不够
                rev_data =rev_data + s.recv(buffersize-len(rev_data))
            head_data = struct.unpack('>IIQQQ', rev_data)#把消息头解包
            #通过消息头数据，计算出消息体的长度
            data_len = head_data[0] - 32
            tmpdata = s.recv(data_len)#接收后续的消息体
            while (len(tmpdata) < data_len):#一次没收完，就继续收
                tmpdata += s.recv(data_len - len(tmpdata))
            #收完完整的一条后进行校验
            recvtime = time.time()
            if isinstance(recvcmd,list):
                #需要多条返回协议的处理
                if head_data[1] in recvcmd:
                    for rec in recvcmd:
                        if head_data[1] == rec:  # 这里对返回数据进行校验，只返回要求协议ID的数据
                            recvtime = time.time()
                            recvdata = tmpdata
                            if str(rec) not in recvdata_dic.keys():
                                then_len = then_len + 1
                            recvdata_dic[str(rec)] = recvdata
                    if then_len == len(recvcmd):
                        return recvdata_dic,recvtime
            else:
                if head_data[1] == recvcmd:#这里对返回数据进行校验，只返回要求协议ID的数据
                    recvtime = time.time()
                    recvdata = tmpdata
                    return recvdata, recvtime
            #如果不是指定的协议，就继续接收下一条协议内容
        except Exception as e:
            print("socket接收数据时发生错误")
            print("error,具体错误 {}".format(e))
            print("战斗协议的话可能是无需战斗造成的")
            recvtime = time.time()
            recvdata = b'error'
            return recvdata, recvtime

def recv_data(sock, api_attr, headsize, norecv=False, limitime=30):
    """
    接收socket数据，用来单独调用接收多条指定的协议回包
    :param sock: 使用的socket
    :param socketdata: 要发送的数据，已经pack好的数据
    :param api_attr: 属性参数字典
    :param headsize: 数据包大小
    :param norecv: 是否需要接收返回，不需要接收返回时，发送完数据后就直接返回，发送的标志和 b'norecv'
    :param limitime: 发送与接收timeout时长
    :return: 发送或者接收标志 ，接收到的数据或者 b'norecv' b'error'
    """
    workname = api_attr['name']
    print("当前发送接口:--{}".format(workname))
    flag = True
    if not flag:
        return flag, b'error'
    else:
        print("send data success")
    if norecv:
        return flag, b'norecv'
    receive_data, recv_time = _recv_data(sock, api_attr, headsize, limitime)
    if receive_data != b'error':
        flag = True
    else:
        flag = False
    return flag, receive_data

def send_receive(sock, socketdata, api_attr, headsize, norecv=False, limitime=40):
    """
    发送并接收socket数据，并返回给调用函数
    :param sock: 使用的socket
    :param socketdata: 要发送的数据，已经pack好的数据
    :param api_attr: 属性参数字典
    :param headsize: 数据包大小
    :param norecv: 是否需要接收返回，不需要接收返回时，发送完数据后就直接返回，发送的标志和 b'norecv'
    :param limitime: 发送与接收timeout时长
    :return: 发送或者接收标志 ，接收到的数据或者 b'norecv' b'error'
    """
    workname = api_attr['name']
    print("当前发送接口:--{}".format(workname))
    flag = True
    try:
        sock.send(socketdata) #发送数据
    except error:
        flag = False
    if not flag:
        return flag, b'error'
    else:
        print("send data success")
    if norecv:#是否需要接受数据，默认接收
        return flag, b'norecv'
    receive_data, recv_time = _recv_data(sock, api_attr, headsize, limitime)#开始接收数据
    if receive_data != b'error':
        flag = True
    else:
        flag = False
    return flag, receive_data

class ProtocolTools:
    def __init__(self, game_name,ui_path = None):
        self.info = Information()
        self.game_name = self.info.get_config(game_name, "app_name")
        # 通过游戏名字获取表格路径
        excel_path = self.info.get_config(game_name, "resource_excelpath")
        if ui_path!=None:
            obj_path = ui_path+excel_path
        else:
            obj_path = self.info.get_config("设置", "my_poco_path") + excel_path
        self.excel = xlrd.open_workbook(obj_path)
        # 协议文件路径，需要将后端给的协议文件从proto类型改为txt
        self.protocol_file_path = self.info.get_config(game_name, "protocolfilepath")

    def get_arg_list(self, protocol_name):
        """
        根据传入的协议名查找对应协议的参数列表
        :param name: 协议名称，用例中的名字
        :return :[agename1,agename2...]
        """
        # 根据协议名获取其参数列表,第三个表格
        table = self.excel.sheets()[2]
        col = table.col_values(0)  # 这个0参数也要变，根据协议名字那一列的索引 todo
        if protocol_name in col:
            row = table.row_values(col.index(protocol_name))
        else:
            print("名字为" + protocol_name + "的协议不存在")
            raise Exception
        keys_list = row[3]  # 参数位置 todo 具体减几看表格
        keys_list = keys_list.split("\n")
        return keys_list

    def get_args_list(self, protocol_name):
        """
        根据传入的协议名字，查询协议所需要的参数列表
        :param protocol_name: 协议名字
        :return:list[{},{}]  协议用例的所有参数组合dic
        """
        # 根据协议名获取其参数列表,第三个表格
        table = self.excel.sheets()[2]
        col = table.col_values(0)  # 这个0参数也要变，根据协议名字那一列的索引 todo
        if protocol_name in col:
            row = table.row_values(col.index(protocol_name))
        else:
            print("名字为" + protocol_name + "的协议不存在")
            raise Exception
        num = 0  # 参数启始位置 todo 具体减几看表格
        arglist_len = len(row) - num
        argdiclist = []
        for i in range(arglist_len):
            key = row[i + num]
            keyk = {}
            keysval = key.split(",")
            for keyv in keysval:
                kl = keyv.split("=")
                if kl[1].isdigit():
                    keyk[kl[0]] = int(kl[1])
                else:
                    keyk[kl[0]] = kl[1]
            argdiclist.append(keyk)
        return argdiclist

    def get_id_protocol(self, protocol_name):
        """
        根据传入的协议名查找对应的协议ID
        :param name: 协议名称，和配置文件ProtocolFilePath中连起来是完整的协议名
        :return C2SID: 客户端发包协议ID
        :return S2CID: 客户端收包协议ID
        """
        C2Sname = self.info.get_config(self.game_name, "C2Sname") + protocol_name
        S2Cname = self.info.get_config(self.game_name, "S2Cname") + protocol_name
        C2SID = None
        S2CID = None
        with open(self.protocol_file_path, 'r+', encoding="utf-8") as fw:
            filelist = fw.readlines()
        for f in filelist:
            f.strip("\\n")
            if C2Sname in f:
                C2SID = re.findall(" = ([\s\S]*);", f)
            if S2Cname in f:
                S2CID = re.findall(" = ([\s\S]*);", f)
        return C2SID, S2CID

    def make_def(self, socket, protocol_name, keys_list_dic):
        """
        :param socket: socket链接
        :param protocol_name:
        :param keys_list_dic:
        :return:
        """
        obj_name = "cg_pb2." + protocol_name + "()"
        # 创建对象
        protocol_obj = eval(obj_name)
        # 获取参数列表，循环赋值
        keys_list = self.get_arg_list(protocol_name)
        for i in range(len(keys_list)):
            value = keys_list_dic[keys_list[i]]
            if value == "Ture" or "False":
                setattr(protocol_obj, keys_list[i], eval(value))
            else:
                setattr(protocol_obj, keys_list[i], value)
        send_cmd, recv_cmd = self.get_id_protocol(protocol_name)
        protocol_obj = protocol_obj.SerializeToString()
        uid = self.info.get_config(self.game_name, "uid")
        sid = self.info.get_config(self.game_name, "sid")
        protocol_obj_attr = {'name': protocol_name, 'protocol': 'protobuf-ss', 'send_cmd': send_cmd,
                             'recv_cmd': recv_cmd, 'uid': int(float(uid)), 'sid': int(float(sid))}
        senddata = pack_data(protocol_obj, protocol_obj_attr)
        flag, data = send_receive(socket, senddata, protocol_obj_attr, 36)  # 消息头长度，需要和后端程序一一确认
        return flag, data

    def make_def_kv(self, socket, protocol_name, keys_list_dic, protocol_name_kv):
        """
        :param socket: socket链接
        :param protocol_name:
        :param keys_list_dic:
        :return:
        """
        # 创建对象
        obj_name = "cg_pb2." + protocol_name + "()"
        # 创建对象
        protocol_obj = eval(obj_name)
        KV = out_base_pb2.KV()
        keys_list_kv = self.get_arg_list(protocol_name_kv)
        for i in range(len(keys_list_kv)):
            value = keys_list_dic[keys_list_kv[i]]
            if value == "Ture" or "False":
                setattr(protocol_obj, keys_list_kv[i], eval(value))
            else:
                setattr(protocol_obj, keys_list_kv[i], value)
        protocol_obj.info.MergeFrom(KV)
        # 获取参数列表，循环赋值
        keys_list = self.get_arg_list(protocol_name)
        for i in range(len(keys_list)):
            value = keys_list_dic[keys_list[i]]
            if value == "Ture" or "False":
                setattr(protocol_obj, keys_list[i], eval(value))
            else:
                setattr(protocol_obj, keys_list[i], value)
        send_cmd, recv_cmd = self.get_id_protocol(protocol_name)
        protocol_obj = protocol_obj.SerializeToString()
        uid = self.info.get_config(self.game_name, "uid")
        sid = self.info.get_config(self.game_name, "sid")
        protocol_obj_attr = {'name': protocol_name, 'protocol': 'protobuf-ss', 'send_cmd': send_cmd,
                             'recv_cmd': recv_cmd, 'uid': int(float(uid)), 'sid': int(float(sid))}
        senddata = pack_data(protocol_obj, protocol_obj_attr)
        flag, data = send_receive(socket, senddata, protocol_obj_attr, 24)  # 消息头长度，需要和后端程序一一确认
        return flag, data
