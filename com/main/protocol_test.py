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
#!/usr/bin/python
# -*- coding: utf-8 -*-
# author:liaozhj
# datetime:2018/11/21 10:56
# software: PyCharm
from MyPoco.protocol_file import cg_pb2, cs_pb2
from MyPoco.protocol_file.func import *
from MyPoco.protocol_file.rclient import getuserid
from socket import create_connection


class WorkTaskSet():

    # 登录
    def Run(self):
        # self.username = getuserid()
        #账号
        self.username="asdfva6546"
        host = "10.3.128.5"
        port = 16865
        self.client = create_connection((host, port))
        flag, data = MSG_C2G_Login(self)
        G2C_Login = cg_pb2.G2C_Login()
        G2C_Login.ParseFromString(data)
        print(G2C_Login)
        print(G2C_Login.uid,G2C_Login.sid)
        self.uid = G2C_Login.uid
        self.sid = G2C_Login.sid
        # 如果ret等于3则需要创角协议
        print(G2C_Login.ret)
        if G2C_Login.ret == 3:
            flag, data = MSG_C2G_Create(self)
            # G2C_Create = cg_pb2.G2C_Create()
            # G2C_Create.ParseFromString(data)
            # print(G2C_Create)
        else:
            pass
        # # 商店
        # flag, data = MSG_C2S_Shop_Shopping(self)
        #
        # # 招募
        # flag, data = MSG_C2S_Recruit_Recruit(self)

        #
        # 取背包数据
        flag, data = MSG_C2S_Flush(self)
        C2S_Flush = cs_pb2.C2S_Flush()
        C2S_Flush.ParseFromString(data)
        print(C2S_Flush)

        #
        # # 武器升级
        # flag, data = MSG_C2S_Knight_Upgrade(self)
        #
        # # 获取副本数据
        # flag, data = MSG_C2S_Dungeon_GetChapterList(self)



if __name__ == '__main__':

    work = WorkTaskSet()
    work.Run()
