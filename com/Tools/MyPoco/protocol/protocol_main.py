# _*_coding:utf-8 _*_
# !/usr/bin/python3
# Reference:********************************
# encoding: utf-8
# @Time:
# @Author: 洞洞
# @File:
# @Function:
# @Method:
# Reference:********************************

from socket import create_connection
from MyPoco.protocol_file import cs_pb2, cg_pb2, out_base_pb2
from MyPoco.protocol.login_game import LoginGame
from MyPoco.protocol.protocol_tools import ProtocolTools
from MyPoco.foundation.information import Information


class ProtocolMain:
    def __init__(self, game_name):
        self.pt = ProtocolTools(game_name)
        self.info = Information()
        host =
        port =
        host = "10.3.128.5"
        port = 16865
        self.socket = create_connection((host, port))

    def Login(self):
        lg = LoginGame(self.socket)
        flag, data = lg.MSG_C2G_Login(self)
        G2C_Login = cg_pb2.G2C_Login()
        G2C_Login.ParseFromString(data)
        print(G2C_Login)
        print(G2C_Login.uid, G2C_Login.sid)
        # self.uid = G2C_Login.uid
        # self.sid = G2C_Login.sid
        self.info.set_config("ProtocolArgs","uid",G2C_Login.uid)
        self.info.set_config("ProtocolArgs","sid",G2C_Login.sid)
        # 如果ret等于3则需要创角协议
        print(G2C_Login.ret)
        if G2C_Login.ret == 3:
            flag, data = lg.MSG_C2G_Create()

    def set_protocol(self, protocol_name):
        """
        传入
        :param socket:socket对象
        :param protocol_name:协议名
        :return:协议参数集 [{},{},{}]
        """
        self.protocol_name = protocol_name
        return self.pt.get_args_list(protocol_name)  # 可能有报错

    def send_protocol(self, arg_dic):
        """
        在脚本中遍历协议参数集，然后单独讲参数集合传入，单独分析结果
        :param arg_dic: {} 参数集
        :return: 返回值
        """
        flag, data = self.pt.make_def(self.socket, self.protocol_name, arg_dic)
        return flag, data
