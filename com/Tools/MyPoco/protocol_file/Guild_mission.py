#!/usr/bin/python
# -*- coding: utf-8 -*-
# author:zhangbs
# datetime:2019/06/04 19:56
# software: PyCharm

from locust import TaskSequence, Locust, seq_task, task
from locust.exception import StopLocust
from protocol_file.func import *
from protocol_file.rclient import getuserid
from socket import create_connection


class WorkTaskSet(TaskSequence):
    def __init__(self, parent):
        super(WorkTaskSet, self).__init__(parent)
        self.username = getuserid()

    # 登录
    @seq_task(1)
    def Login(self):
        flag, data = MSG_C2G_Login(self)

        G2C_Login = cg_pb2.G2C_Login()
        G2C_Login.ParseFromString(data)
        # print(G2C_Login)
        # print(G2C_Login.uid, G2C_Login.sid)
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

    # 创建军团
    @seq_task(2)
    def Guild_Create(self):
        flag, data = MSG_C2S_Guild_Create(self)
        # S2C_Guild_Create = cs_pb2.S2C_Guild_Create()
        # S2C_Guild_Create.ParseFromString(data)
        # print("S2C_Guild_Create=====>", S2C_Guild_Create)

    # 军团贡献任务
    @seq_task(3)
    def GuildWorship(self):
        flag, data = MSG_C2S_GuildWorship_FinishMission(self)
        # S2C_GuildStatue_DoCast = cs_pb2.S2C_GuildStatue_DoCast()
        # S2C_GuildStatue_DoCast.ParseFromString(data)
        # print("S2C_GuildStatue_DoCast=====>",S2C_GuildStatue_DoCast)

    # 军团贡献任务
    @task(1000)
    @seq_task(4)
    def GuildStatue(self):
        flag, data = MSG_C2S_GuildStatue_DoCast(self)
        # S2C_GuildWorship_FinishMission = cs_pb2.S2C_GuildWorship_FinishMission()
        # S2C_GuildWorship_FinishMission.ParseFromString(data)
        # print("S2C_GuildWorship_FinishMission=====>", S2C_GuildWorship_FinishMission)

    @seq_task(99)
    def over(self):
        print("over")
        raise StopLocust("task over")


class WorkLocust(Locust):
    task_set = WorkTaskSet
    min_wait = 50
    max_wait = 50

    def __init__(self):
        super(WorkLocust, self).__init__()
        host = "10.3.128.5"
        # port = 12089
        port = 16865
        self.client = create_connection((host, port))


if __name__ == '__main__':
    work = WorkLocust()
    work.run()
