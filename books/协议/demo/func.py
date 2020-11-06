#!/usr/bin/python
# -*- coding: utf-8 -*-
# author:liaozhj
# datetime:2018/11/21 11:26
# software: PyCharm

from MyPoco.protocol_file_ss2 import cs_pb2, out_base_pb2
from MyPoco.protocol.protocol_file_ss2 import cg_pb2
from MyPoco.protocol.packdata import pack_data
from MyPoco.protocol.sendrecvpub import send_receive, recv_data
import hashlib, json, base64
# from locust.exception import StopLocust
import random

# 登录
def MSG_C2G_Login(t):
    v={}
    v["account_system_id"] = "1_"
    #v["osdk_game_id"] = "196377847"
    v["osdk_game_id"] = "196377847"
    v["user_id"] = t.username
    v["time"] = "123"
    v["osdk_user_id"] = "1_" + t.username
    v["extend"] = "1|1|1"
    v["channel_id"] = "1"
    key = "EXNhCfHaunHNzMG80qyjcOBUuXAnVeTU"
    print("t.username---------->",t.username)
    string = "account_system_id=1_&channel_id=1&extend=1|1|1&osdk_game_id=196377847&osdk_user_id=1_"+t.username+"&time=123&user_id="+t.username + key
    m1 = hashlib.md5()
    m1.update(string.encode())
    sign = m1.hexdigest()
    v["sign"]=sign
    token = json.dumps(v)
    token = bytes(token, encoding="utf8")
    token = base64.b64encode(token)

    C2G_Login = cg_pb2.C2G_Login()
    C2G_Login.token = token
    C2G_Login.server_id = 1652440005#1
    C2G_Login.version = 0
    C2G_Login.sequence_id = 0
    C2G_Login = C2G_Login.SerializeToString()
    C2G_Login_attr = {'name': "C2G_Login", 'protocol': 'protobuf-ss', 'send_cmd': 10002, 'recv_cmd': 10003, 'uid': 0,
                      'sid': 0}
    senddata = pack_data(C2G_Login, C2G_Login_attr)
    flag, data = send_receive(t.client, senddata, C2G_Login_attr, 32)
    return flag, data



# 创建角色
def MSG_C2G_Create(t):
    C2G_Create = cg_pb2.C2G_Create()
    C2G_Create.name = str(t.username)
    C2G_Create.type = 210000
    print(t.sid)
    C2G_Create.server_id = 1652440005
    C2G_Create = C2G_Create.SerializeToString()
    C2G_Create_attr = {'name': "C2G_Create", 'protocol': 'protobuf-ss', 'send_cmd': 10004, 'recv_cmd': 10005,
                       'uid': t.uid, 'sid': t.sid}
    senddata = pack_data(C2G_Create, C2G_Create_attr)
    flag, data = send_receive(t.client, senddata, C2G_Create_attr, 32)
    return flag, data


# 商店
def MSG_C2S_Shop_Shopping(t):
    C2S_Shop_Shopping = cs_pb2.C2S_Shop_Shopping()
    KV = out_base_pb2.KV()
    KV.id = 101
    KV.num = 1
    C2S_Shop_Shopping.info.MergeFrom(KV)
    C2S_Shop_Shopping = C2S_Shop_Shopping.SerializeToString()
    C2S_Shop_Shopping_attr = {'name': "C2S_Shop_Shopping", 'protocol': 'protobuf-ss', 'send_cmd': 10422,
                              'recv_cmd': 10423,
                              'uid': t.uid, 'sid': t.sid}
    senddata = pack_data(C2S_Shop_Shopping, C2S_Shop_Shopping_attr)
    flag, data = send_receive(t.client, senddata, C2S_Shop_Shopping_attr, 24)
    return flag, data


# 招募
def MSG_C2S_Recruit_Recruit(t):
    C2S_Recruit_Recruit = cs_pb2.C2S_Recruit_Recruit()
    C2S_Recruit_Recruit.recruit_type = 2
    C2S_Recruit_Recruit.consume_type = 0
    C2S_Recruit_Recruit.num = 1
    C2S_Recruit_Recruit = C2S_Recruit_Recruit.SerializeToString()
    C2S_Recruit_Recruit_attr = {'name': "C2S_Recruit_Recruit", 'protocol': 'protobuf-ss', 'send_cmd': 10452,
                                'recv_cmd': 10453, 'uid': t.uid, 'sid': t.sid}
    senddata = pack_data(C2S_Recruit_Recruit, C2S_Recruit_Recruit_attr)
    flag, data = send_receive(t.client, senddata, C2S_Recruit_Recruit_attr, 24)
    return flag, data


# 取背包数据
def MSG_C2S_Flush(t):
    C2S_Flush = cs_pb2.C2S_Flush()
    C2S_Flush.knight = True
    C2S_Flush = C2S_Flush.SerializeToString()
    C2S_Flush_attr = {'name': "C2S_Flush", 'protocol': 'protobuf-ss', 'send_cmd': 10100,
                      'recv_cmd': 10101, 'uid': t.uid, 'sid': t.sid}
    senddata = pack_data(C2S_Flush, C2S_Flush_attr)
    flag, data = send_receive(t.client, senddata, C2S_Flush_attr, 24)
    return flag, data


# 武器升级
def MSG_C2S_Knight_Upgrade(t):
    C2S_Knight_Upgrade = cs_pb2.C2S_Knight_Upgrade()
    C2S_Knight_Upgrade.id = 400130
    C2S_Knight_Upgrade.item_id = 7
    C2S_Knight_Upgrade.item_num = 1
    C2S_Knight_Upgrade = C2S_Knight_Upgrade.SerializeToString()
    C2S_Knight_Upgrade_attr = {'name': "C2S_Knight_Upgrade", 'protocol': 'protobuf-ss', 'send_cmd': 10250,
                               'recv_cmd': 10251, 'uid': t.uid, 'sid': t.sid}
    senddata = pack_data(C2S_Knight_Upgrade, C2S_Knight_Upgrade_attr)
    flag, data = send_receive(t.client, senddata, C2S_Knight_Upgrade_attr, 24)
    return flag, data


# 取副本数据
def MSG_C2S_Dungeon_GetChapterList(t):
    C2S_Dungeon_GetChapterList = cs_pb2.C2S_Dungeon_GetChapterList()
    C2S_Dungeon_GetChapterList = C2S_Dungeon_GetChapterList.SerializeToString()
    C2S_Dungeon_GetChapterList_attr = {'name': "C2S_Dungeon_GetChapterList", 'protocol': 'protobuf-ss',
                                       'send_cmd': 10400, 'recv_cmd': 10401, 'uid': t.uid, 'sid': t.sid}
    senddata = pack_data(C2S_Dungeon_GetChapterList, C2S_Dungeon_GetChapterList_attr)
    flag, data = send_receive(t.client, senddata, C2S_Dungeon_GetChapterList_attr, 24)
    return flag, data


# 副本战斗
def MSG_C2S_Dungeon_ChallengeStageBegin(t):
    C2S_Dungeon_ChallengeStageBegin = cs_pb2.C2S_Dungeon_ChallengeStageBegin()
    C2S_Dungeon_ChallengeStageBegin.id = 10000
    C2S_Dungeon_ChallengeStageBegin = C2S_Dungeon_ChallengeStageBegin.SerializeToString()
    C2S_Dungeon_ChallengeStageBegin_attr = {'name': "C2S_Dungeon_ChallengeStageBegin", 'protocol': 'protobuf-ss',
                                            'send_cmd': 10402, 'recv_cmd': 10403, 'uid': t.uid, 'sid': t.sid}
    senddata = pack_data(C2S_Dungeon_ChallengeStageBegin, C2S_Dungeon_ChallengeStageBegin_attr)
    flag, data = send_receive(t.client, senddata, C2S_Dungeon_ChallengeStageBegin_attr, 24)
    return flag, data


# 获取排行榜
def MSG_C2S_GetCommonRankList(t):
    C2S_GetCommonRankList = cs_pb2.C2S_GetCommonRankList()
    C2S_GetCommonRankList.id = 1
    C2S_GetCommonRankList.size = 10
    C2S_GetCommonRankList = C2S_GetCommonRankList.SerializeToString()
    C2S_GetCommonRankList_attr = {'name': "C2S_GetCommonRankList", 'protocol': 'protobuf-ss',
                                  'send_cmd': 10170, 'recv_cmd': 10171, 'uid': t.uid, 'sid': t.sid}
    senddata = pack_data(C2S_GetCommonRankList, C2S_GetCommonRankList_attr)
    flag, data = send_receive(t.client, senddata, C2S_GetCommonRankList_attr, 24)
    return flag, data


# 获取名人堂
def MSG_C2S_HallOfFame_Rank(t):
    C2S_HallOfFame_Rank = cs_pb2.C2S_HallOfFame_Rank()
    C2S_HallOfFame_Rank.type = 1
    C2S_HallOfFame_Rank = C2S_HallOfFame_Rank.SerializeToString()
    C2S_HallOfFame_Rank_attr = {'name': "C2S_HallOfFame_Rank", 'protocol': 'protobuf-ss',
                                'send_cmd': 11425, 'recv_cmd': 11426, 'uid': t.uid, 'sid': t.sid}
    senddata = pack_data(C2S_HallOfFame_Rank, C2S_HallOfFame_Rank_attr)
    flag, data = send_receive(t.client, senddata, C2S_HallOfFame_Rank_attr, 24)
    return flag, data


# 创建军团
def MSG_C2S_Guild_Create(t):
    C2S_Guild_Create = cs_pb2.C2S_Guild_Create()
    C2S_Guild_Create.name = t.username
    C2S_Guild_Create.icon = 2
    C2S_Guild_Create.confirm = True
    C2S_Guild_Create.level =4

    C2S_Guild_Create = C2S_Guild_Create.SerializeToString()
    C2S_Guild_Create_attr = {'name': "C2S_Guild_Create", 'protocol': 'protobuf-ss', 'send_cmd': 11006, 'recv_cmd': 11007, 'uid': t.uid, 'sid': t.sid}
    senddata = pack_data(C2S_Guild_Create, C2S_Guild_Create_attr)
    flag, data = send_receive(t.client, senddata, C2S_Guild_Create_attr, 32)
    return flag, data

# 军团贡献任务
def MSG_C2S_GuildWorship_FinishMission(t):
    C2S_GuildWorship_FinishMission = cs_pb2.C2S_GuildWorship_FinishMission()
    C2S_GuildWorship_FinishMission.id = 1

    C2S_GuildWorship_FinishMission = C2S_GuildWorship_FinishMission.SerializeToString()
    C2S_GuildWorship_FinishMission_attr = {'name': "C2S_GuildWorship_FinishMission", 'protocol': 'protobuf-ss', 'send_cmd': 11062, 'recv_cmd': 11063, 'uid': t.uid, 'sid': t.sid}
    senddata = pack_data(C2S_GuildWorship_FinishMission, C2S_GuildWorship_FinishMission_attr)
    flag, data = send_receive(t.client, senddata, C2S_GuildWorship_FinishMission_attr, 32)
    return flag, data


# 军团贡献任务
def MSG_C2S_GuildStatue_DoCast(t):
    C2S_GuildStatue_DoCast = cs_pb2.C2S_GuildStatue_DoCast()
    C2S_GuildStatue_DoCast.type = 1
    C2S_GuildStatue_DoCast.value = 3
    C2S_GuildStatue_DoCast.stone = 5

    C2S_GuildStatue_DoCast = C2S_GuildStatue_DoCast.SerializeToString()
    C2S_GuildStatue_DoCast_attr = {'name': "C2S_GuildStatue_DoCast", 'protocol': 'protobuf-ss', 'send_cmd': 12152, 'recv_cmd': 12153, 'uid': t.uid, 'sid': t.sid}
    senddata = pack_data(C2S_GuildStatue_DoCast, C2S_GuildStatue_DoCast_attr)
    flag, data = send_receive(t.client, senddata, C2S_GuildStatue_DoCast_attr, 32)
    return flag, data


#攻城掠地-城主抢夺信息
def MSG_C2S_StormCity_Info(t):
    C2S_StormCity_Info = cs_pb2.C2S_StormCity_Info()
    C2S_StormCity_Info.city = random.randint(1001, 1003)
    t.city = C2S_StormCity_Info.city

    C2S_StormCity_Info = C2S_StormCity_Info.SerializeToString()
    C2S_StormCity_Info_attr = {'name': "C2S_StormCity_Info", 'protocol': 'protobuf-ss', 'send_cmd': 12400,
                                   'recv_cmd': 12401, 'uid': t.uid, 'sid': t.sid}
    senddata = pack_data(C2S_StormCity_Info, C2S_StormCity_Info_attr)
    flag, data = send_receive(t.client, senddata, C2S_StormCity_Info_attr, 32)
    return flag, data

#攻城掠地-城池抢夺挑战
def  MSG_C2S_StormCity_ChallengeBegin(t):
    C2S_StormCity_ChallengeBegin = cs_pb2.C2S_StormCity_ChallengeBegin()
    C2S_StormCity_ChallengeBegin.city = t.city
    if hasattr(t, "battle_rank") != True:
        print("no battle_rank")
        raise StopLocust("no battle_rank")
    C2S_StormCity_ChallengeBegin.rank = t.battle_rank
    print("liahu10402", t.city, t.battle_rank)


    C2S_StormCity_ChallengeBegin = C2S_StormCity_ChallengeBegin.SerializeToString()
    C2S_StormCity_ChallengeBegin_attr = {'name': "C2S_StormCity_ChallengeBegin", 'protocol': 'protobuf-ss', 'send_cmd': 12402,
                                   'recv_cmd': 12404, 'uid': t.uid, 'sid': t.sid}
    senddata = pack_data(C2S_StormCity_ChallengeBegin, C2S_StormCity_ChallengeBegin_attr)
    flag, data = send_receive(t.client, senddata, C2S_StormCity_ChallengeBegin_attr, 32)
    return flag, data

#攻城掠地-城池抢夺挑战 在接受一个协议 12403
def MSG_C2S_StormCity_ChallengeBegin_Bar(t):
    C2S_StormCity_ChallengeBegin = {'name': "C2S_StormCity_ChallengeBeginBar", 'protocol': 'protobuf-ss', 'send_cmd': 12402,
                                     'recv_cmd': 12403, 'uid': t.uid, 'sid': t.sid}

    flag, data = recv_data(t.client, C2S_StormCity_ChallengeBegin, 32)
    return flag, data

#攻城掠地-城池抢夺官职奖励:
def  MSG_C2S_StormCity_GetLordAward(t):
    C2S_StormCity_GetLordAward = cs_pb2.C2S_StormCity_GetLordAward()

    C2S_StormCity_GetLordAward = C2S_StormCity_GetLordAward.SerializeToString()
    C2S_StormCity_GetLordAward_attr = {'name': "C2S_StormCity_GetLordAward", 'protocol': 'protobuf-ss', 'send_cmd': 12405,
                                     'recv_cmd': 12406, 'uid': t.uid, 'sid': t.sid}
    senddata = pack_data(C2S_StormCity_GetLordAward, C2S_StormCity_GetLordAward_attr)
    flag, data = send_receive(t.client, senddata, C2S_StormCity_GetLordAward_attr, 32)
    return flag, data

#攻城掠地-城池抢夺获取排行榜
def MSG_C2S_StormCity_GetRanklist(t):
    C2S_StormCity_GetRanklist = cs_pb2.C2S_StormCity_GetRanklist()
    C2S_StormCity_GetRanklist.city = random.randint(1001, 1003)
    C2S_StormCity_GetRanklist.index = random.randint(1, 4)
    C2S_StormCity_GetRanklist.rank_tp = random.randint(1, 2)

    C2S_StormCity_GetRanklist = C2S_StormCity_GetRanklist.SerializeToString()
    C2S_StormCity_GetRanklist_attr = {'name': "C2S_StormCity_GetRanklist", 'protocol': 'protobuf-ss',
                                       'send_cmd': 12407,
                                       'recv_cmd': 12408, 'uid': t.uid, 'sid': t.sid}
    senddata = pack_data(C2S_StormCity_GetRanklist, C2S_StormCity_GetRanklist_attr)
    flag, data = send_receive(t.client, senddata, C2S_StormCity_GetRanklist_attr, 32)
    return flag, data
