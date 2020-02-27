#!/usr/bin/python
# -*- coding: utf-8 -*-
# author:liaozhj
# datetime:2018/11/21 10:56
# software: PyCharm


from protocol_file.func import *
from socket import create_connection


class WorkTaskSet():

    # 登录
    def Run(self):
        # self.username = getuserid()
        self.username ="123458"
        host = "10.0.98.135"
        port = 57522
        #创建连接
        self.client = create_connection((host, port))
        flag, data = MSG_C2G_Login(self)
        G2C_Login = cg_pb2.G2C_Login()
        G2C_Login.ParseFromString(data)
        print(G2C_Login)
        print(G2C_Login.uid, G2C_Login.sid)
        self.uid = G2C_Login.uid
        self.sid = G2C_Login.sid
        # 如果ret等于3则需要创角协议
        if G2C_Login.ret == 3:
            flag, data = MSG_C2G_Create(self)
            # G2C_Create = cg_pb2.G2C_Create()
            # G2C_Create.ParseFromString(data)
            # print(G2C_Create)
        else:
            pass
        # 商店
        flag, data = MSG_C2S_Shop_Shopping(self)

        # 招募
        flag, data = MSG_C2S_Recruit_Recruit(self)

        # 取背包数据
        flag, data = MSG_C2S_Flush(self)

        # 武器升级
        flag, data = MSG_C2S_Knight_Upgrade(self)

        # 获取副本数据
        flag, data = MSG_C2S_Dungeon_GetChapterList(self)



if __name__ == '__main__':

    work = WorkTaskSet()
    work.Run()
