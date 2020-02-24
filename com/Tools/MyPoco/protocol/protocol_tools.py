# _*_coding:utf-8 _*_
#!/usr/bin/python3
#Reference:********************************
# encoding: utf-8
#@Time: 2020/02/20  17:16
#@Author: 洞洞
#@File:
#@Function:
#@Method:
#Reference:********************************
from protocol_file import cs_pb2, cg_pb2, out_base_pb2
import re

from foundation.information import Information
import xlrd
import packdata
import sendrecvpub
class ProtocolTools:
    def __init__(self,game_name):

        self.info = Information()
        # 通过游戏名字获取表格路径
        excel_path = self.info.get_config("ProtocolExcelPath", game_name)
        self.excel = xlrd.open_workbook(excel_path)
        # 协议文件路径，需要将后端给的协议文件从proto类型改为txt
        self.protocol_file_path = self.info.get_config("ProtocolFilePath", game_name)


    def get_arg_list(self,protocol_name):
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
        C2Sname = self.info.get_config("ProtocolFilePath", "C2Sname") + protocol_name
        S2Cname = self.info.get_config("ProtocolFilePath", "S2Cname") + protocol_name
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
    def make_def(self,socket,protocol_name,keys_list_dic):
        """
        :param socket: socket链接
        :param protocol_name:
        :param keys_list_dic:
        :return:
        """
        obj_name = "cg_pb2."+protocol_name+"()"
        #创建对象
        protocol_obj = eval(obj_name)
        # 获取参数列表，循环赋值
        keys_list = self.get_arg_list(protocol_name)
        for i in range(len(keys_list)):
            value = keys_list_dic[keys_list[i]]
            if value =="Ture"or"False":
                setattr(protocol_obj,keys_list[i],eval(value))
            else:
                setattr(protocol_obj, keys_list[i], value)
        send_cmd,recv_cmd=self.get_id_protocol(protocol_name)
        protocol_obj = protocol_obj.SerializeToString()
        uid = self.info.get_config("ProtocolArgs","uid")
        sid = self.info.get_config("ProtocolArgs","sid")
        protocol_obj_attr = {'name': protocol_name, 'protocol': 'protobuf-ss', 'send_cmd': send_cmd,
                                    'recv_cmd': recv_cmd, 'uid': uid, 'sid': sid}
        senddata = packdata.pack_data(protocol_obj, protocol_obj_attr)
        flag, data = sendrecvpub.send_receive(socket, senddata, protocol_obj_attr, 36) # todo 数字什么意思
        return flag, data

    def make_def_kv(self,socket,protocol_name,keys_list_dic,protocol_name_kv):
        """
        :param socket: socket链接
        :param protocol_name:
        :param keys_list_dic:
        :return:
        """
        #创建对象
        obj_name = "cg_pb2." + protocol_name + "()"
        # 创建对象
        protocol_obj = eval(obj_name)
        KV = out_base_pb2.KV()
        keys_list_kv = self.get_arg_list(protocol_name_kv)
        for i in range(len(keys_list_kv)):
            value = keys_list_dic[keys_list_kv[i]]
            if value =="Ture"or"False":
                setattr(protocol_obj,keys_list_kv[i],eval(value))
            else:
                setattr(protocol_obj, keys_list_kv[i], value)
        protocol_obj.info.MergeFrom(KV)
        # 获取参数列表，循环赋值
        keys_list = self.get_arg_list(protocol_name)
        for i in range(len(keys_list)):
            value = keys_list_dic[keys_list[i]]
            if value =="Ture"or"False":
                setattr(protocol_obj,keys_list[i],eval(value))
            else:
                setattr(protocol_obj, keys_list[i], value)
        send_cmd,recv_cmd=self.get_id_protocol(protocol_name)
        protocol_obj = protocol_obj.SerializeToString()
        uid = self.info.get_config("ProtocolArgs","uid")
        sid = self.info.get_config("ProtocolArgs","sid")
        protocol_obj_attr = {'name': protocol_name, 'protocol': 'protobuf-ss', 'send_cmd': send_cmd,
                                    'recv_cmd': recv_cmd, 'uid': uid, 'sid': sid}
        senddata = packdata.pack_data(protocol_obj, protocol_obj_attr)
        flag, data = sendrecvpub.send_receive(socket, senddata, protocol_obj_attr, 24)# todo 数字什么意思
        return flag, data