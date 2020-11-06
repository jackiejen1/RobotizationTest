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
import random
import socket
import time

import math

from MyPoco.foundation.MyException import *
from MyPoco.protocol.make_resource_body import MakeResourceBody
from ss_proto import cs_pb2_ss
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
        C2S_Login = cs_pb2_ss.C2S_Login()
        v = {}
        v["account_system_id"] = "1"
        v["extend"] = "2|94|2013"
        v["osdk_game_id"] = "196377207"
        v["osdk_user_id"] = "1_" + self.username
        new_time = time.time()
        v["time"] = new_time
        v["user_id"] = self.username
        # v["channel_id"] = "1"
        # key = "I71m5iENcyMG2KnUrX6Uzu0zL7GzH8MY"
        key="ngamesuifengsb123"
        string = "account_system_id=1&extend=2|94|2013&osdk_game_id=196377207&osdk_user_id=1_" + self.username + "&time="+str(int(new_time))+"&user_id=" + self.username + key
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
        C2S_Login.device_id ='''{\"SdkParam\":\"{\\\"bundle_id\\\":\\\"com.youzu.android.snsgz\\\",\\\"device_name\\\":\\\"Netease\\\",\\\"device_type\\\":\\\"MuMu\\\",\\\"idfa\\\":\\\"990000000056368\\\",\\\"idfv\\\":\\\"0\\\",\\\"language\\\":\\\"zh\\\",\\\"network\\\":\\\"WIFI\\\",\\\"operator\\\":\\\"other\\\",\\\"os_version\\\":\\\"6.0.1\\\"}\",\"PackageVersion\":60500,\"DeviceId\":\"990000000056368_19bb0b987f9b3fe0_0\"}'''
        # C2S_Login.version = 60677
        C2G_Login = C2S_Login.SerializeToString()
        C2G_Login_attr = {'name': "C2S_Login", 'protocol': 'protobuf-ss', 'send_cmd': 10002, 'recv_cmd': 10003,
                          'uid': 0, 'sid': 0}
        senddata = pack_data(C2G_Login, C2G_Login_attr)
        Login_flag, Login_data = send_receive(self.socket, senddata, C2G_Login_attr, 16)
        S2C_Login = cs_pb2_ss.S2C_Login()
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
            rold_name = str(self.username[1:])
            C2S_Create = cs_pb2_ss.C2S_Create()
            m1 = hashlib.md5()
            createId = math.floor(random.random()*20000)+1
            createReason = createId
            m1.update((S2C_Login.login_reason+str(createReason)+rold_name+"ss").encode())
            si = m1.hexdigest()
            name = str(createReason)+"|"+si+"|"+rold_name
            C2S_Create.name = name
            C2S_Create.type = 1
            C2S_Create = C2S_Create.SerializeToString()
            C2S_Create_attr = {'name': "C2S_Create", 'protocol': 'protobuf-ss', 'send_cmd': 10004, 'recv_cmd': 10005,
                               'uid': self.uid, 'sid': self.sid}
            senddata = pack_data(C2S_Create, C2S_Create_attr)
            flag, data = send_receive(self.socket, senddata, C2S_Create_attr, 16)
            S2C_Create = cs_pb2_ss.S2C_Create()
            S2C_Create.ParseFromString(data)
            if S2C_Create.ret == 1:
                msg = "角色创建成功，账号：" + self.username + "，区服id：" + str(
                    self.server_id) + "，角色名：" + self.username[1:] + "，UID：" + str(S2C_Create.uid)
                print(msg)
                add_msg_in_log(msg)
                self.uid = S2C_Create.uid
            else:
                raise GmException(str(S2C_Create.uid) + "创建角色失败" + str(S2C_Create.ret))
        elif S2C_Login.ret == 2:
            raise GameServerStopException("服务器维护中,创建账号失败")
        self.gm.set_account_information(self.username, self.server_name, self.username[1:])
        return self.gm

