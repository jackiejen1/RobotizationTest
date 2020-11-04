#!/usr/bin/python
# -*- coding: utf-8 -*-
# author:liaozhj
# datetime:2018/11/21 10:56
# software: PyCharm

from locust import TaskSequence, Locust, seq_task
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
    @seq_task(2)
    def shopping(self):
        flag, data = MSG_C2S_Shop_Shopping(self)
        # S2C_Shop_Shopping = cs_pb2.S2C_Shop_Shopping()
        # S2C_Shop_Shopping.ParseFromString(data)
        # print(S2C_Shop_Shopping)

    # 招募
    @seq_task(3)
    def recruit_recruit(self):
        flag, data = MSG_C2S_Recruit_Recruit(self)
        # S2C_Recruit_Recruit = cs_pb2.S2C_Recruit_Recruit()
        # S2C_Recruit_Recruit.ParseFromString(data)
        # print(S2C_Recruit_Recruit)

    # 取背包数据
    @seq_task(4)
    def Flush(self):
        flag, data = MSG_C2S_Flush(self)
        # S2C_Flush = cs_pb2.S2C_Flush()
        # S2C_Flush.ParseFromString(data)
        # print(S2C_Flush)

    # 武器升级
    @seq_task(5)
    def Upgrade(self):
        flag, data = MSG_C2S_Knight_Upgrade(self)
        # S2C_Knight_Upgrade = cs_pb2.S2C_Knight_Upgrade()
        # S2C_Knight_Upgrade.ParseFromString(data)
        # print(S2C_Knight_Upgrade)

    # 获取副本数据
    @seq_task(6)
    def getchapterlist(self):
        flag, data = MSG_C2S_Dungeon_GetChapterList(self)
        # S2C_Dungeon_GetChapterList = cs_pb2.S2C_Dungeon_GetChapterList()
        # S2C_Dungeon_GetChapterList.ParseFromString(data)
        # print(S2C_Dungeon_GetChapterList)

    # 副本战斗
    @seq_task(7)
    def Dungeon_ChallengeStageBegin(self):
        flag, data = MSG_C2S_Dungeon_ChallengeStageBegin(self)
        # S2C_Dungeon_ChallengeStageBegin = cs_pb2.S2C_Dungeon_ChallengeStageBegin()
        # S2C_Dungeon_ChallengeStageBegin.ParseFromString(data)
        # print(S2C_Dungeon_ChallengeStageBegin)

    # 获取排行榜
    @seq_task(8)
    def getrank(self):
        flag, data = MSG_C2S_GetCommonRankList(self)
        # S2C_GetCommonRankList = cs_pb2.S2C_GetCommonRankList()
        # S2C_GetCommonRankList.ParseFromString(data)
        # print(S2C_GetCommonRankList)

    # 名人堂
    @seq_task(9)
    def famerank(self):
        flag, data = MSG_C2S_HallOfFame_Rank(self)
        # S2C_HallOfFame_Rank = cs_pb2.S2C_HallOfFame_Rank()
        # S2C_HallOfFame_Rank.ParseFromString(data)
        # print(S2C_HallOfFame_Rank)

    @seq_task(99)
    def over(self):
        print("over")
        raise StopLocust("task over")


class WorkLocust(Locust):
    task_set = WorkTaskSet
    min_wait = 1000
    max_wait = 2000

    def __init__(self):
        super(WorkLocust, self).__init__()
        host = "10.3.128.5"
        port = 12089
        self.client = create_connection((host, port))


if __name__ == '__main__':
    work = WorkLocust()
    work.run()
