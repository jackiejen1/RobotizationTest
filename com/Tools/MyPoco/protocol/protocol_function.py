# _*_coding:utf-8 _*_
# !/usr/bin/python3
# Reference:********************************
# encoding: utf-8
# @Time:
# @Author: 洞洞
# @File:
# @Function:开局指定测试哪个游戏的哪条协议，每个脚本只测试一条协议
# @Method:
# Reference:********************************
import json
from socket import create_connection
from MyPoco.foundation.MyException import *
from MyPoco.foundation.MyException import GameServerStopException
from MyPoco.protocol_file import cs_pb2, cg_pb2, out_base_pb2
from MyPoco.protocol.login_game import LoginGame
from MyPoco.protocol.protocol_tools import ProtocolTools
from MyPoco.foundation.information import Information

class ProtocolFunction:
    def __init__(self, game_name,server_name,protocol_name,username):
        """
        用于协议测试使用，创建账号的协议方法单独实现
        开局指定测试哪个游戏的哪条协议
        通过server_name获取对应服务器的IP、端口和服务器ID。设置连接后直接启动登陆协议
        :param game_name:游戏名
        :param server_name: 区服名
        :param protocol_name: 协议名，默认空，只走登录
        :param username: 账号
        """
        self.game_name=game_name
        self.info = Information()
        self.pt = ProtocolTools(game_name)
        # self.username = self.info.get_config(self.game_name,"new_game_account1")
        self.username = username
        self.protocol_name = protocol_name
        # self.protocol_ages_list= self.pt.get_args_list(protocol_name)  #  todo 可能有报错
        #开始连接
        server_name = server_name+"_server_ages"
        socket_ages_dic = json.loads(self.info.get_config(game_name,server_name))
        self.host =socket_ages_dic["host"]   # host = "10.3.128.5"
        self.port =int(socket_ages_dic["port"])  # port = 16865
        self.server_id = int(socket_ages_dic["server_id"])
        self.socket = create_connection((self.host, self.port))
        # 启动登陆
        self.uid=0
        self.Login()#可以考虑单独启动
    def get_role_id(self):
        if self.uid ==0:
            self.socket = create_connection((self.host, self.port))
            return self.Login()
        else:
            return self.uid

    def Login(self):
        lg = LoginGame(self.socket,self.server_id,self.game_name,self.username)
        flag, data = lg.MSG_C2G_Login()
        G2C_Login = cg_pb2.G2C_Login()
        G2C_Login.ParseFromString(data)
        print(G2C_Login)
        print("账号登录成功")
        # self.info.set_config("com.youzu.test.qa","uid",str(G2C_Login.uid))
        # self.info.set_config("com.youzu.test.qa","sid",str(G2C_Login.sid))
        # 如果ret等于3则需要创角协议
        self.uid = G2C_Login.uid
        print(self.uid)
        if G2C_Login.ret == 3:
            print("新账号，开始创建角色")
            flag_Create, data_Create = lg.MSG_C2G_Create(G2C_Login.uid,G2C_Login.sid)
            G2C_Create = cg_pb2.C2G_Create()
            G2C_Create.ParseFromString(data_Create)
            print(G2C_Create)
        elif G2C_Login.ret == 2:
            raise GameServerStopException("服务器维护中,创建账号失败")
        return self.uid

    def send_protocol(self, arg_dic):
        """
        传入参数组，发送协议，并获取返回值
        :param arg_dic: {} 参数集
        :return: 返回值
        """
        flag, data = self.pt.make_def(self.socket, self.protocol_name, arg_dic)
        return flag, data