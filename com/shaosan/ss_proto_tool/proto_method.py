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
import os
import socket
import time
from MyPoco.foundation.MyException import *
from MyPoco.protocol.make_resource_body import MakeResourceBody
from proto import cs_pb2
import hashlib, json, base64
# from google.protobuf.json_format import MessageToJson
from gm.gm_method import GmMethod
from ss_proto_tool.protocol_tools import pack_data, send_receive
import requests


class ProtocolFunction:
    def __init__(self, server_name, username, ui_path=None):
        """
        用于协议测试使用，创建账号的协议方法单独实现
        开局指定测试哪个游戏的哪条协议
        通过server_name获取对应服务器的IP、端口和服务器ID。设置连接后直接启动登陆协议
        :param game_name:游戏名
        :param server_name: 区服名
        :param protocol_name: 协议名，默认空，只走登录
        :param username: 账号
        """
        self.login_two = False
        self.socket = None
        self.mri = MakeResourceBody("少三", ui_path)
        # self.username = "_" + username
        self.username = username
        self.server_name = server_name
        # 开始连接
        if "1" in server_name:
            self.server_id =2013440004
        elif "2" in server_name:
            self.server_id =2013440003
        elif "3" in server_name:
            self.server_id =2013440005
        elif "4" in server_name:
            self.server_id =2013440006
        elif "5" in server_name:
            self.server_id =2013440007
        elif "6" in server_name:
            self.server_id =2013440008
        self.host ="g1.n.qa.uuzuonline.net"
        self.port =38422
        try:
            self.socket = socket.create_connection((self.host, self.port))
        except Exception:
            raise GmException("服务器可能在维护")
        self.uid = 0
        self.sever_time = 0
        self.gm = GmMethod("少三")

    def Login(self):
        """
        登录协议
        :param version: 版本号
        :return:
        """
        C2S_Login = cs_pb2.C2S_Login()
        v = {}
        v["account_system_id"] = "1"
        v["osdk_game_id"] = "94"
        v["user_id"] = self.username
        v["time"] = time.time()
        v["osdk_user_id"] = "1" + self.username
        v["extend"] = "1|1|1"
        v["channel_id"] = "1"
        key = "I71m5iENcyMG2KnUrX6Uzu0zL7GzH8MY"
        string = "account_system_id=1&channel_id=1&extend=1|1|1&osdk_game_id=94&osdk_user_id=1" + self.username + "&time=123&user_id=" + self.username+key
        m1 = hashlib.md5()
        m1.update(string.encode())
        sign = m1.hexdigest()
        v["sign"] = sign
        token = json.dumps(v)
        token = bytes(token, encoding="utf8")
        token = base64.b64encode(token)
        C2S_Login.token =token
        C2S_Login.sid = self.server_id
        C2S_Login.channel_id ="1"
        C2S_Login.device_id ='''{"moblie":"","device":"","ad":"{\"device_name\":\"iPhone 6s\",\"bundle_id\":\"com.uuzu.nznh\",\"idfv\":\"7A64A21C-C624-4FB4-A36D-A850FFE206A4\",\"os_version\":\"iOS10.0.2\",\"operator\":\"chinaMobile\",\"language\":\"zh-Hans-CN\",\"device_type\":\"iPhone 6s\",\"network\":\"WiFi\",\"idfa\":\"0951FD47-788E-4042-B491-7E73C2711EDA\"}"}'''
        # C2S_Login.version = version
        C2G_Login = C2S_Login.SerializeToString()
        C2G_Login_attr = {'name': "C2S_Login", 'protocol': 'protobuf-ss', 'send_cmd': 10002, 'recv_cmd': 10003,
                          'uid': 0, 'sid': 0}
        senddata = pack_data(C2G_Login, C2G_Login_attr)
        Login_flag, Login_data = send_receive(self.socket, senddata, C2G_Login_attr, 16)
        S2C_Login = cs_pb2.S2C_Login()
        S2C_Login.ParseFromString(Login_data)
        print(S2C_Login)
        if S2C_Login.ret==1:
            print("账号登录成功,账号为" + str(self.username), S2C_Login)
        self.uid = S2C_Login.uid
        self.sid = S2C_Login.sid
        if self.uid != 0:
            add_msg_in_log("role_id:" + str(self.uid))
        if S2C_Login.ret == 5:
            raise GmException("重复登录,创建角色失败" + str(self.username))
        elif S2C_Login.ret == 3:
            print("新账号，开始创建角色")
            C2G_Create = cs_pb2.C2S_Create()
            C2G_Create.name = str(self.username)[1:]
            C2G_Create.type = 1
            C2G_Create = C2G_Create.SerializeToString()
            C2G_Create_attr = {'name': "C2G_Create", 'protocol': 'protobuf-ss', 'send_cmd': 10004, 'recv_cmd': 10005,
                               'uid': self.uid, 'sid': self.sid}
            senddata = pack_data(C2G_Create, C2G_Create_attr)
            flag, data = send_receive(self.socket, senddata, C2G_Create_attr, 16)
            G2C_Create = cs_pb2.S2C_Create()
            G2C_Create.ParseFromString(data)
            if G2C_Create.ret == 1:
                msg = "角色创建成功，账号：" + self.username + "，区服id：" + str(
                    self.server_id) + "，角色名：" + self.username[1:] + "，UID：" + str(G2C_Create.uid)
                print(msg)
                add_msg_in_log(msg)
                self.uid = G2C_Create.uid
            else:
                raise GmException(str(G2C_Create.uid) + "创建角色失败" + str(G2C_Create.ret))
        elif S2C_Login.ret == 2:
            raise GameServerStopException("服务器维护中,创建账号失败")
        self.gm.set_account_information(self.username, self.server_name, self.username[1:])
        return self.gm

