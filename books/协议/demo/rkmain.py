#!/usr/bin/python
# -*- coding: utf-8 -*-
# author:liahu
# datetime:2019/9/11 10:56
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

    def judge(self, flag):
        if not flag:
            self.over()

    # 登录
    @seq_task(1)
    def Login(self):
        flag, data = MSG_C2G_Login(self)
        self.judge(flag)
        G2C_Login = cg_pb2.G2C_Login()
        G2C_Login.ParseFromString(data)
        print(G2C_Login)
        print(G2C_Login.uid, G2C_Login.sid)
        self.uid = G2C_Login.uid
        self.sid = G2C_Login.sid
        print(G2C_Login.ret)
        # 如果ret等于3则需要创角协议
        if G2C_Login.ret == 3:
            flag, data = MSG_C2G_Create(self)
            self.judge(flag)
            # G2C_Create = cg_pb2.G2C_Create()
            # G2C_Create.ParseFromString(data)
            # print(G2C_Create)
        else:
            pass



    #攻城掠地-城池抢夺获取排行榜
    @seq_task(2)
    @task(10000)
    def C2S_StormCity_GetRanklist(self):
        #print("5555555555555555555555555")
        flag, data = MSG_C2S_StormCity_GetRanklist(self)
        self.judge(flag)
        S2C_StormCity_GetRanklist = cs_pb2.S2C_StormCity_GetRanklist()
        S2C_StormCity_GetRanklist.ParseFromString(data)
        print(S2C_StormCity_GetRanklist)

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
        port = 16865
        self.client = create_connection((host, port))


if __name__ == '__main__':
    work = WorkLocust()
    work.run()
