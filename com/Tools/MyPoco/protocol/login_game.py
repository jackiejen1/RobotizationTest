# _*_coding:utf-8 _*_
# !/usr/bin/python3
# Reference:********************************
# encoding: utf-8
# @Time: 2020/2/28  18:24
# @Author: 洞洞
# @File: proto_send.py
# @Function:
# @Method:
# Reference:********************************
import time

from MyPoco.protocol_file import cs_pb2, cg_pb2, bs_pb2, out_base_pb2
from MyPoco.protocol.protocol_tools import pack_data, send_receive
import hashlib, json, base64
# from locust.exception import StopLocust
from MyPoco.foundation.information import Information
from MyPoco.foundation.MyException import *


class LoginGame:
    def __init__(self, socket, server_id, username):
        self.info = Information()
        self.username = username
        self.socket = socket
        self.server_id = server_id

    def MSG_C2G_Login(self, region):
        v = {}
        v["account_system_id"] = "1_"
        v["osdk_game_id"] = "196377847"
        v["user_id"] = self.username
        v["time"] = "123"
        v["osdk_user_id"] = "1_" + self.username
        v["extend"] = "1|1|1"
        v["channel_id"] = "1"
        if region == "国内":
            key = "EXNhCfHaunHNzMG80qyjcOBUuXAnVeTU"
        elif region == "韩国":
            key = "adrv5272WobiAMaPVOHapmXrr8eYsWWZ"
        elif region == "日本":
            key = "zgoLCOk7o7TwRPkjY9bWBW3TZnFJvJ3k"
        elif region == "新马":
            key = "Zj10zrXxlWC7xKuX66TjsNvepQKIFfzR"
        elif region == "台湾":
            key = "Wjiqv6sjw4NIFhKY7i598bO1AWjru2en"
        else:
            raise ProtocolException("版本信息输入错误，登录信息设置失败")
        string = "account_system_id=1_&channel_id=1&extend=1|1|1&osdk_game_id=196377847&osdk_user_id=1_" + self.username + "&time=123&user_id=" + self.username + key
        m1 = hashlib.md5()
        m1.update(string.encode())
        sign = m1.hexdigest()
        v["sign"] = sign
        token = json.dumps(v)
        token = bytes(token, encoding="utf8")
        token = base64.b64encode(token)
        C2G_Login = cg_pb2.C2G_Login()
        C2G_Login.token = token
        C2G_Login.server_id = self.server_id
        C2G_Login.version = 0
        C2G_Login.sequence_id = 0
        C2G_Login = C2G_Login.SerializeToString()
        C2G_Login_attr = {'name': "C2G_Login", 'protocol': 'protobuf-ss', 'send_cmd': 10002, 'recv_cmd': 10003,
                          'uid': 0, 'sid': 0}
        senddata = pack_data(C2G_Login, C2G_Login_attr)
        flag, data = send_receive(self.socket, senddata, C2G_Login_attr, 32)
        return flag, data

    # 创建角色
    def MSG_C2G_Create(self, uid, sid):
        C2G_Create = cg_pb2.C2G_Create()
        username = str(self.username)
        C2G_Create.name = username
        C2G_Create.type = 210000
        C2G_Create.server_id = self.server_id
        C2G_Create = C2G_Create.SerializeToString()
        C2G_Create_attr = {'name': "C2G_Create", 'protocol': 'protobuf-ss', 'send_cmd': 10004, 'recv_cmd': 10005,
                           'uid': uid, 'sid': sid}
        senddata = pack_data(C2G_Create, C2G_Create_attr)
        flag, data = send_receive(self.socket, senddata, C2G_Create_attr, 32)
        return flag, data

    def MSG_C2S_SyncTime(self, uid, sid):
        """
        获取服务器时间
        :param uid:
        :param sid:
        :return:
        """
        C2S_SyncTime = cs_pb2.C2S_SyncTime()  # 创建发送协议对象
        C2S_SyncTime.client_time = int(time.time())  # 参数赋值
        C2S_SyncTime = C2S_SyncTime.SerializeToString()  # 序列化
        C2S_SyncTime_attr = {'name': "C2S_SyncTime", 'protocol': 'protobuf-ss', 'send_cmd': 10145, 'recv_cmd': 10146,
                             'uid': uid, 'sid': sid}
        senddata = pack_data(C2S_SyncTime, C2S_SyncTime_attr)  # 装包，需要学习
        flag, data = send_receive(self.socket, senddata, C2S_SyncTime_attr, 32)  # 发送协议
        return flag, data

    def MSG_C2S_Flush(self, uid, sid, recv_cmd_id):
        """
        获取角色所有信息
        :param uid:
        :param sid:
        :param recv_cmd_id:
        :return:
        """

        C2S_Flush = cs_pb2.C2S_Flush()  # 创建发送协议对象
        C2S_Flush.user = True
        C2S_Flush.red_point = True
        C2S_Flush.knight = True
        C2S_Flush.fragment = True
        C2S_Flush.item = True
        C2S_Flush.resource = True
        C2S_Flush.formation = True
        C2S_Flush.unite_token = True
        C2S_Flush.advance_equipment = True
        C2S_Flush.equipment = True
        C2S_Flush.treasure = True
        C2S_Flush.dress = True
        C2S_Flush.red_packet = True
        C2S_Flush.random_player = True  # 随机玩家
        C2S_Flush.biography_item = True  # 名将传道具
        C2S_Flush.skin = True
        C2S_Flush.privilege = True  # 特权
        C2S_Flush.artifact = True  # 神兵
        C2S_Flush.card = True  # 化身卡
        C2S_Flush.cardcompos = True  # 化身組合
        C2S_Flush.wing = True  # 翅膀
        C2S_Flush.wing_refines = True  # 翅膀精炼
        C2S_Flush.pet = True  # 宠物
        C2S_Flush.pet_equipment = True  # 宠物装备
        C2S_Flush.kSoul = True  # 将灵
        C2S_Flush = C2S_Flush.SerializeToString()  # 序列化
        # ID10101的协议可以不接收，不是实际需要的内容
        C2S_Flush_attr = {'name': "C2S_Flush", 'protocol': 'protobuf-ss', 'send_cmd': 10100,
                          'recv_cmd': int(recv_cmd_id), 'uid': uid, 'sid': sid}
        senddata = pack_data(C2S_Flush, C2S_Flush_attr)  # 装包，需要学习
        flag, data = send_receive(self.socket, senddata, C2S_Flush_attr, 32)  # 发送协议
        return flag, data

    def MSG_C2S_Formation_ChangeFormation(self, tp, pos, id, uid, sid):
        """
        上阵协议
        :param tp: 上阵类型，武将1，装备3，宝物4
        :param pos: 位置
        :param id: 唯一ID
        :param uid:
        :param sid:
        :return:
        """
        C2S_Formation_ChangeFormation = cs_pb2.C2S_Formation_ChangeFormation()
        C2S_Formation_ChangeFormation.tp = tp
        C2S_Formation_ChangeFormation.pos = pos
        C2S_Formation_ChangeFormation.id = id
        C2S_Formation_ChangeFormation = C2S_Formation_ChangeFormation.SerializeToString()
        C2S_Formation_ChangeFormation_attr = {'name': "C2S_Formation_ChangeFormation", 'protocol': 'protobuf-ss',
                                              'send_cmd': 10162, 'recv_cmd': 10163, 'uid': uid, 'sid': sid}
        senddata = pack_data(C2S_Formation_ChangeFormation, C2S_Formation_ChangeFormation_attr)  # 装包，需要学习
        flag, data = send_receive(self.socket, senddata, C2S_Formation_ChangeFormation_attr, 32)  # 发送协议
        return flag, data

    def MSG_C2S_Friend_AddFriend(self, name, uid, sid):
        """
        添加好友
        :param name: 好友名字
        :param uid:
        :param sid:
        :return:
        """
        C2S_Friend_AddFriend = cs_pb2.C2S_Friend_AddFriend()
        C2S_Friend_AddFriend.name = name
        C2S_Friend_AddFriend = C2S_Friend_AddFriend.SerializeToString()
        C2S_Friend_AddFriend_attr = {'name': "C2S_Friend_AddFriend", 'protocol': 'protobuf-ss',
                                     'send_cmd': 10908, 'recv_cmd': 10909, 'uid': uid, 'sid': sid}
        senddata = pack_data(C2S_Friend_AddFriend, C2S_Friend_AddFriend_attr)  # 装包，需要学习
        flag, data = send_receive(self.socket, senddata, C2S_Friend_AddFriend_attr, 32)  # 发送协议
        return flag, data

    def MSG_C2S_Sell(self, type_into, consume_into, uid, sid):
        """
        出售
        :param consume_into: 唯一ID
        :param uid:
        :param sid:
        :return:
        """
        C2S_Sell = cs_pb2.C2S_Sell()

        consume = C2S_Sell.consumes.add()
        consume.type = type_into
        consume.value = consume_into
        consume.size = 1
        C2S_Sell = C2S_Sell.SerializeToString()
        C2S_Sell_attr = {'name': "C2S_Sell", 'protocol': 'protobuf-ss',
                         'send_cmd': 10147, 'recv_cmd': 10148, 'uid': uid, 'sid': sid}
        senddata = pack_data(C2S_Sell, C2S_Sell_attr)  # 装包，需要学习
        flag, data = send_receive(self.socket, senddata, C2S_Sell_attr, 32)  # 发送协议
        return flag, data

    def MSG_C2S_Dungeon_ChallengeStageBegin(self, id, uid, sid):
        """
        发起副本战斗
        :param id:
        :param uid:
        :param sid:
        :return:
        """
        C2S_Dungeon_ChallengeStageBegin = cs_pb2.C2S_Dungeon_ChallengeStageBegin()
        C2S_Dungeon_ChallengeStageBegin.id = id
        C2S_Dungeon_ChallengeStageBegin = C2S_Dungeon_ChallengeStageBegin.SerializeToString()
        C2S_Dungeon_ChallengeStageBegin_attr = {'name': "C2S_Dungeon_ChallengeStageBegin", 'protocol': 'protobuf-ss',
                                                'send_cmd': 10402, 'recv_cmd': [10403, 20000], 'uid': uid, 'sid': sid}
        senddata = pack_data(C2S_Dungeon_ChallengeStageBegin, C2S_Dungeon_ChallengeStageBegin_attr)  # 装包，需要学习
        flag, data = send_receive(self.socket, senddata, C2S_Dungeon_ChallengeStageBegin_attr, 32)  # 发送协议
        return flag, data

    def MSG_C2S_Biography_ExecuteMission(self, id, type_num, uid, sid):
        """
        发起名将传战斗
        :param id:
        :param uid:
        :param sid:
        :return:
        """
        if type_num == 2:
            recv_cmd = 10703
        else:
            recv_cmd = [10703, 20000]
        C2S_Biography_ExecuteMission = cs_pb2.C2S_Biography_ExecuteMission()
        C2S_Biography_ExecuteMission.id = id
        C2S_Biography_ExecuteMission = C2S_Biography_ExecuteMission.SerializeToString()
        C2S_Biography_ExecuteMission_attr = {'name': "C2S_Biography_ExecuteMission", 'protocol': 'protobuf-ss',
                                             'send_cmd': 10702, 'recv_cmd': recv_cmd, 'uid': uid, 'sid': sid}
        senddata = pack_data(C2S_Biography_ExecuteMission, C2S_Biography_ExecuteMission_attr)  # 装包，需要学习
        flag, data = send_receive(self.socket, senddata, C2S_Biography_ExecuteMission_attr, 32)  # 发送协议
        return flag, data

    def MSG_C2S_Storm_ChallengeBegin(self, storm_id_into, cell_id_into, uid, sid):
        """
        发起攻城掠地战斗
        :param storm_id_into: int 章节id
        :param cell_id_into:int 小怪id
        :param uid:
        :param sid:
        :return:
        """
        C2S_Storm_ChallengeBegin = cs_pb2.C2S_Storm_ChallengeBegin()
        C2S_Storm_ChallengeBegin.storm_id = storm_id_into
        C2S_Storm_ChallengeBegin.cell_id = cell_id_into
        C2S_Storm_ChallengeBegin = C2S_Storm_ChallengeBegin.SerializeToString()
        C2S_Storm_ChallengeBegin_attr = {'name': "C2S_Storm_ChallengeBegin", 'protocol': 'protobuf-ss',
                                         'send_cmd': 12304, 'recv_cmd': [12305, 20000], 'uid': uid, 'sid': sid}
        senddata = pack_data(C2S_Storm_ChallengeBegin, C2S_Storm_ChallengeBegin_attr)  # 装包，需要学习
        flag, data = send_receive(self.socket, senddata, C2S_Storm_ChallengeBegin_attr, 32)  # 发送协议
        return flag, data

    def MSG_C2S_EliteDungeon_BeginChallenge(self, stage_id_into, diff_type_into, uid, sid):
        """
        发起炼狱副本战斗
        :param storm_id_into: int 章节id
        :param cell_id_into:int 小怪id
        :param uid:
        :param sid:
        :return:
        """
        C2S_EliteDungeon_BeginChallenge = cs_pb2.C2S_EliteDungeon_BeginChallenge()
        C2S_EliteDungeon_BeginChallenge.stage_id = stage_id_into
        C2S_EliteDungeon_BeginChallenge.diff_type = diff_type_into
        C2S_EliteDungeon_BeginChallenge = C2S_EliteDungeon_BeginChallenge.SerializeToString()
        C2S_EliteDungeon_BeginChallenge_attr = {'name': "C2S_EliteDungeon_BeginChallenge", 'protocol': 'protobuf-ss',
                                                'send_cmd': 14154, 'recv_cmd': 14155, 'uid': uid, 'sid': sid}
        senddata = pack_data(C2S_EliteDungeon_BeginChallenge, C2S_EliteDungeon_BeginChallenge_attr)  # 装包，需要学习
        flag, data = send_receive(self.socket, senddata, C2S_EliteDungeon_BeginChallenge_attr, 32)  # 发送协议
        return flag, data

    def MSG_C2S_Rebel_AttackBegin(self, id_into, uid, sid):
        """
        讨伐巨兽战斗
        :param storm_id_into: int 龙炮、熊车id
        :param uid:
        :param sid:
        :return:
        """
        C2S_Rebel_AttackBegin = cs_pb2.C2S_Rebel_AttackBegin()
        C2S_Rebel_AttackBegin.uid = uid
        C2S_Rebel_AttackBegin.id = id_into
        C2S_Rebel_AttackBegin.attack_type = 1
        C2S_Rebel_AttackBegin = C2S_Rebel_AttackBegin.SerializeToString()
        C2S_Rebel_AttackBegin_attr = {'name': "C2S_Rebel_AttackBegin", 'protocol': 'protobuf-ss',
                                      'send_cmd': 11152, 'recv_cmd': 11153, 'uid': uid, 'sid': sid}
        senddata = pack_data(C2S_Rebel_AttackBegin, C2S_Rebel_AttackBegin_attr)  # 装包，需要学习
        flag, data = send_receive(self.socket, senddata, C2S_Rebel_AttackBegin_attr, 32)  # 发送协议
        return flag, data

    def MSG_C2S_ContendTreasure_OneKeyFast(self, id_into, uid, sid):
        """
        一键夺宝
        :param storm_id_into: 要合成的宝物id
        :param uid:
        :param sid:
        :return:
        """
        C2S_ContendTreasure_OneKeyFast = cs_pb2.C2S_ContendTreasure_OneKeyFast()
        C2S_ContendTreasure_OneKeyFast.id = id_into
        C2S_ContendTreasure_OneKeyFast.is_use_item = 1
        C2S_ContendTreasure_OneKeyFast = C2S_ContendTreasure_OneKeyFast.SerializeToString()
        C2S_ContendTreasure_OneKeyFast_attr = {'name': "C2S_ContendTreasure_OneKeyFast", 'protocol': 'protobuf-ss',
                                               'send_cmd': 10812, 'recv_cmd': 10813, 'uid': uid, 'sid': sid}
        senddata = pack_data(C2S_ContendTreasure_OneKeyFast, C2S_ContendTreasure_OneKeyFast_attr)  # 装包，需要学习
        flag, data = send_receive(self.socket, senddata, C2S_ContendTreasure_OneKeyFast_attr, 32)  # 发送协议
        return flag, data

    def MSG_C2S_Arena_OneKeyChallenge(self, num_into, uid, sid):
        """
        一键竞技场
        :param num_into: 挑战次数
        :param uid:
        :param sid:
        :return:
        """
        C2S_Arena_OneKeyChallenge = cs_pb2.C2S_Arena_OneKeyChallenge()
        C2S_Arena_OneKeyChallenge.num = num_into
        C2S_Arena_OneKeyChallenge = C2S_Arena_OneKeyChallenge.SerializeToString()
        C2S_Arena_OneKeyChallenge_attr = {'name': "C2S_Arena_OneKeyChallenge", 'protocol': 'protobuf-ss',
                                          'send_cmd': 10495, 'recv_cmd': 10496, 'uid': uid, 'sid': sid}
        senddata = pack_data(C2S_Arena_OneKeyChallenge, C2S_Arena_OneKeyChallenge_attr)  # 装包，需要学习
        flag, data = send_receive(self.socket, senddata, C2S_Arena_OneKeyChallenge_attr, 32)  # 发送协议
        return flag, data

    def MSG_C2S_Arena_ChallengeBegin(self, rank_into, uid, sid):
        """
        竞技场挑战
        :param rank_into: 挑战名次
        :param uid:
        :param sid:
        :return:
        """
        C2S_Arena_ChallengeBegin = cs_pb2.C2S_Arena_ChallengeBegin()
        C2S_Arena_ChallengeBegin.rank = rank_into
        C2S_Arena_ChallengeBegin = C2S_Arena_ChallengeBegin.SerializeToString()
        C2S_Arena_ChallengeBegin_attr = {'name': "C2S_Arena_ChallengeBegin", 'protocol': 'protobuf-ss',
                                         'send_cmd': 10482, 'recv_cmd': 10483, 'uid': uid, 'sid': sid}
        senddata = pack_data(C2S_Arena_ChallengeBegin, C2S_Arena_ChallengeBegin_attr)  # 装包，需要学习
        flag, data = send_receive(self.socket, senddata, C2S_Arena_ChallengeBegin_attr, 32)  # 发送协议
        return flag, data

    def MSG_C2S_Arena_GetMainInfo(self, uid, sid):
        """
        获取竞技场可挑战名单
        :param uid:
        :param sid:
        :return:
        """
        C2S_Arena_GetMainInfo = cs_pb2.C2S_Arena_GetMainInfo()
        C2S_Arena_GetMainInfo = C2S_Arena_GetMainInfo.SerializeToString()
        C2S_Arena_GetMainInfo_attr = {'name': "C2S_Arena_GetMainInfo", 'protocol': 'protobuf-ss',
                                      'send_cmd': 10480, 'recv_cmd': 10481, 'uid': uid, 'sid': sid}
        senddata = pack_data(C2S_Arena_GetMainInfo, C2S_Arena_GetMainInfo_attr)  # 装包，需要学习
        flag, data = send_receive(self.socket, senddata, C2S_Arena_GetMainInfo_attr, 32)  # 发送协议
        return flag, data

    def MSG_C2S_EliteDungeon_FastChallenge(self, stage_id_into, diff_type_into, times_into, uid, sid):
        """
        发起炼狱副本扫荡
        :param storm_id_into: int
        :param cell_id_into:int
        :param uid:
        :param sid:
        :return:
        """
        C2S_EliteDungeon_FastChallenge = cs_pb2.C2S_EliteDungeon_FastChallenge()
        C2S_EliteDungeon_FastChallenge.stage_id = stage_id_into
        C2S_EliteDungeon_FastChallenge.diff_type = diff_type_into
        C2S_EliteDungeon_FastChallenge.times = times_into
        C2S_EliteDungeon_FastChallenge = C2S_EliteDungeon_FastChallenge.SerializeToString()
        C2S_EliteDungeon_FastChallenge_attr = {'name': "C2S_EliteDungeon_FastChallenge", 'protocol': 'protobuf-ss',
                                               'send_cmd': 14157, 'recv_cmd': 14158, 'uid': uid, 'sid': sid}
        senddata = pack_data(C2S_EliteDungeon_FastChallenge, C2S_EliteDungeon_FastChallenge_attr)  # 装包，需要学习
        flag, data = send_receive(self.socket, senddata, C2S_EliteDungeon_FastChallenge_attr, 32)  # 发送协议
        return flag, data

    def MSG_C2S_Storm_Award(self, storm_id_into, cell_id_into, uid, sid):
        """
        攻城掠地领取宝箱事件
        :param storm_id_into: int 章节id
        :param cell_id_into:int 小怪id
        :param uid:
        :param sid:
        :return:
        """
        C2S_Storm_Award = cs_pb2.C2S_Storm_Award()
        C2S_Storm_Award.storm_id = storm_id_into
        C2S_Storm_Award.cell_id = cell_id_into
        C2S_Storm_Award = C2S_Storm_Award.SerializeToString()
        C2S_Storm_Award_attr = {'name': "C2S_Storm_Award", 'protocol': 'protobuf-ss',
                                'send_cmd': 12307, 'recv_cmd': 12308, 'uid': uid, 'sid': sid}
        senddata = pack_data(C2S_Storm_Award, C2S_Storm_Award_attr)  # 装包，需要学习
        flag, data = send_receive(self.socket, senddata, C2S_Storm_Award_attr, 32)  # 发送协议
        return flag, data

    def MSG_C2S_Storm_Break(self, storm_id_into, cell_id_into, uid, sid):
        """
        攻城掠地清除障碍事件
        :param storm_id_into: int 章节id
        :param cell_id_into:int 小怪id
        :param uid:
        :param sid:
        :return:
        """
        C2S_Storm_Break = cs_pb2.C2S_Storm_Break()
        C2S_Storm_Break.storm_id = storm_id_into
        C2S_Storm_Break.cell_id = cell_id_into
        C2S_Storm_Break = C2S_Storm_Break.SerializeToString()
        C2S_Storm_Break_attr = {'name': "C2S_Storm_Break", 'protocol': 'protobuf-ss',
                                'send_cmd': 12309, 'recv_cmd': 12310, 'uid': uid, 'sid': sid}
        senddata = pack_data(C2S_Storm_Break, C2S_Storm_Break_attr)  # 装包，需要学习
        flag, data = send_receive(self.socket, senddata, C2S_Storm_Break_attr, 32)  # 发送协议
        return flag, data

    def MSG_C2S_Storm_Reset(self, storm_id_into, uid, sid):
        """
        攻城掠地中关卡重置
        :param storm_id_into: int 章节id
        :param uid:
        :param sid:
        :return:
        """
        C2S_Storm_Reset = cs_pb2.C2S_Storm_Reset()
        C2S_Storm_Reset.storm_id = storm_id_into
        C2S_Storm_Reset = C2S_Storm_Reset.SerializeToString()
        C2S_Storm_Reset_attr = {'name': "C2S_Storm_Reset", 'protocol': 'protobuf-ss',
                                'send_cmd': 12313, 'recv_cmd': 12314, 'uid': uid, 'sid': sid}
        senddata = pack_data(C2S_Storm_Reset, C2S_Storm_Reset_attr)  # 装包，需要学习
        flag, data = send_receive(self.socket, senddata, C2S_Storm_Reset_attr, 32)  # 发送协议
        return flag, data

    def MSG_C2S_DeadBattle_GetInfo(self, uid, sid):
        """
        获取无双试炼的关卡信息
        :param uid:
        :param sid:
        :return:
        """
        C2S_DeadBattle_GetInfo = cs_pb2.C2S_DeadBattle_GetInfo()
        C2S_DeadBattle_GetInfo = C2S_DeadBattle_GetInfo.SerializeToString()
        C2S_DeadBattle_GetInfo_attr = {'name': "C2S_DeadBattle_GetInfo", 'protocol': 'protobuf-ss',
                                       'send_cmd': 10510, 'recv_cmd': 10511, 'uid': uid, 'sid': sid}
        senddata = pack_data(C2S_DeadBattle_GetInfo, C2S_DeadBattle_GetInfo_attr)  # 装包，需要学习
        flag, data = send_receive(self.socket, senddata, C2S_DeadBattle_GetInfo_attr, 32)  # 发送协议
        return flag, data

    def MSG_C2S_Formation_ChangePosition(self, pos_list, uid, sid):
        """
        更改上阵位置
        :param uid:
        :param sid:
        :return:
        """
        C2S_Formation_ChangePosition = cs_pb2.C2S_Formation_ChangePosition()
        C2S_Formation_ChangePosition.position.extend(pos_list)
        C2S_Formation_ChangePosition = C2S_Formation_ChangePosition.SerializeToString()
        C2S_Formation_ChangePosition_attr = {'name': "C2S_Formation_ChangePosition", 'protocol': 'protobuf-ss',
                                             'send_cmd': 10160, 'recv_cmd': 10161, 'uid': uid, 'sid': sid}
        senddata = pack_data(C2S_Formation_ChangePosition, C2S_Formation_ChangePosition_attr)  # 装包，需要学习
        flag, data = send_receive(self.socket, senddata, C2S_Formation_ChangePosition_attr, 32)  # 发送协议
        return flag, data

    def MSG_C2S_DeadBattle_ChallengeBegin(self, uid, sid):
        """
        发起无双试炼战斗
        :param uid:
        :param sid:
        :return:
        """
        C2S_DeadBattle_ChallengeBegin = cs_pb2.C2S_DeadBattle_ChallengeBegin()
        C2S_DeadBattle_ChallengeBegin.index = 2  # 这有这一关能打，所以直接传难度即可
        C2S_DeadBattle_ChallengeBegin = C2S_DeadBattle_ChallengeBegin.SerializeToString()
        C2S_DeadBattle_ChallengeBegin_attr = {'name': "C2S_DeadBattle_ChallengeBegin", 'protocol': 'protobuf-ss',
                                              'send_cmd': 10519, 'recv_cmd': [10520, 20000], 'uid': uid, 'sid': sid}
        senddata = pack_data(C2S_DeadBattle_ChallengeBegin, C2S_DeadBattle_ChallengeBegin_attr)  # 装包，需要学习
        flag, data = send_receive(self.socket, senddata, C2S_DeadBattle_ChallengeBegin_attr, 32)  # 发送协议
        return flag, data

    def MSG_C2S_DeadBattle_BoxAward(self, uid, sid):
        """
        无双试炼领取通关宝箱
        :param uid:
        :param sid:
        :return:
        """
        C2S_DeadBattle_BoxAward = cs_pb2.C2S_DeadBattle_BoxAward()
        C2S_DeadBattle_BoxAward = C2S_DeadBattle_BoxAward.SerializeToString()
        C2S_DeadBattle_BoxAward_attr = {'name': "C2S_DeadBattle_BoxAward", 'protocol': 'protobuf-ss',
                                        'send_cmd': 10522, 'recv_cmd': 10523, 'uid': uid, 'sid': sid}
        senddata = pack_data(C2S_DeadBattle_BoxAward, C2S_DeadBattle_BoxAward_attr)  # 装包，需要学习
        flag, data = send_receive(self.socket, senddata, C2S_DeadBattle_BoxAward_attr, 32)  # 发送协议
        return flag, data

    def MSG_C2S_Shop_Shopping(self, id_into, num_into, uid, sid):
        """
        商城购买道具
        :param storm_id_into: int 道具id
        :param num_into:int 道具数量
        :return:
        """
        C2S_Shop_Shopping = cs_pb2.C2S_Shop_Shopping()
        KV = out_base_pb2.KV()
        KV.id = id_into
        KV.num = num_into
        C2S_Shop_Shopping.info.MergeFrom(KV)
        C2S_Shop_Shopping = C2S_Shop_Shopping.SerializeToString()
        C2S_Shop_Shopping_attr = {'name': "C2S_Shop_Shopping", 'protocol': 'protobuf-ss',
                                  'send_cmd': 10422, 'recv_cmd': 10423, 'uid': uid, 'sid': sid}
        senddata = pack_data(C2S_Shop_Shopping, C2S_Shop_Shopping_attr)  # 装包，需要学习
        flag, data = send_receive(self.socket, senddata, C2S_Shop_Shopping_attr, 32)  # 发送协议
        return flag, data

    def MSG_C2S_DeadBattle_PickBuff(self, buff_id, uid, sid):
        """
        无双试炼领取通关buff
        :param uid:
        :param sid:
        :return:
        """
        C2S_DeadBattle_PickBuff = cs_pb2.C2S_DeadBattle_PickBuff()
        C2S_DeadBattle_PickBuff.id = buff_id
        C2S_DeadBattle_PickBuff = C2S_DeadBattle_PickBuff.SerializeToString()
        C2S_DeadBattle_PickBuff_attr = {'name': "C2S_DeadBattle_PickBuff", 'protocol': 'protobuf-ss',
                                        'send_cmd': 10512, 'recv_cmd': 10513, 'uid': uid, 'sid': sid}
        senddata = pack_data(C2S_DeadBattle_PickBuff, C2S_DeadBattle_PickBuff_attr)  # 装包，需要学习
        flag, data = send_receive(self.socket, senddata, C2S_DeadBattle_PickBuff_attr, 32)  # 发送协议
        return flag, data

    def MSG_C2S_Friend_SendGift(self, uid, sid):
        """
        给所有好友送礼物
        :param uid:
        :param sid:
        :return:
        """
        C2S_Friend_SendGift = cs_pb2.C2S_Friend_SendGift()
        C2S_Friend_SendGift.id = 0
        C2S_Friend_SendGift = C2S_Friend_SendGift.SerializeToString()
        C2S_Friend_SendGift_attr = {'name': "C2S_Friend_SendGift", 'protocol': 'protobuf-ss',
                                    'send_cmd': 10918, 'recv_cmd': 10919, 'uid': uid, 'sid': sid}
        senddata = pack_data(C2S_Friend_SendGift, C2S_Friend_SendGift_attr)  # 装包，需要学习
        flag, data = send_receive(self.socket, senddata, C2S_Friend_SendGift_attr, 32)  # 发送协议
        return flag, data

    def MSG_C2S_CheckBattleResult(self, result_into, uid, sid):
        """
        向服务器发送战斗结果用于校验，通用战斗校验协议
        :param result_into:
        :param uid:
        :param sid:
        :return:
        """
        C2S_CheckBattleResult = bs_pb2.C2S_CheckBattleResult()
        C2S_CheckBattleResult.result = result_into
        C2S_Dungeon_ChallengeStageBegin = C2S_CheckBattleResult.SerializeToString()
        C2S_CheckBattleResult_attr = {'name': "C2S_CheckBattleResult", 'protocol': 'protobuf-ss',
                                      'send_cmd': 20001, 'recv_cmd': 20002, 'uid': uid, 'sid': sid}
        senddata = pack_data(C2S_Dungeon_ChallengeStageBegin, C2S_CheckBattleResult_attr)  # 装包，需要学习
        flag, data = send_receive(self.socket, senddata, C2S_CheckBattleResult_attr, 32)  # 发送协议
        return flag, data

    def MSG_C2S_Guild_Create(self, Guild_name, uid, sid):
        """
        创建军团协议
        :param Guild_name: string 军团名字
        :param uid:
        :param sid:
        :return:
        """
        C2S_Guild_Create = cs_pb2.C2S_Guild_Create()
        C2S_Guild_Create.name = Guild_name
        C2S_Guild_Create.icon = 1
        C2S_Guild_Create.confirm = False
        C2S_Guild_Create.level = 1
        C2S_Guild_Create = C2S_Guild_Create.SerializeToString()
        C2S_Guild_Create_attr = {'name': "C2S_Guild_Create", 'protocol': 'protobuf-ss',
                                 'send_cmd': 11006, 'recv_cmd': 11007, 'uid': uid, 'sid': sid}
        senddata = pack_data(C2S_Guild_Create, C2S_Guild_Create_attr)  # 装包，需要学习
        flag, data = send_receive(self.socket, senddata, C2S_Guild_Create_attr, 32)  # 发送协议
        return flag, data

    def MSG_C2S_Guild_Search(self, Guild_name, uid, sid):
        """
        查询军团协议
        :param Guild_name: string 军团名字
        :param uid:
        :param sid:
        :return:
        """
        C2S_Guild_Search = cs_pb2.C2S_Guild_Search()
        C2S_Guild_Search.key = Guild_name
        C2S_Guild_Search = C2S_Guild_Search.SerializeToString()
        C2S_Guild_Search_attr = {'name': "C2S_Guild_Search", 'protocol': 'protobuf-ss',
                                 'send_cmd': 11002, 'recv_cmd': 11003, 'uid': uid, 'sid': sid}
        senddata = pack_data(C2S_Guild_Search, C2S_Guild_Search_attr)  # 装包，需要学习
        flag, data = send_receive(self.socket, senddata, C2S_Guild_Search_attr, 32)  # 发送协议
        return flag, data

    def MSG_C2S_Guild_ReqJoin(self, id, uid, sid):
        """
        加入军团协议
        :param Guild_name: string 军团名字
        :param uid:
        :param sid:
        :return:
        """
        C2S_Guild_ReqJoin = cs_pb2.C2S_Guild_ReqJoin()
        C2S_Guild_ReqJoin.guild_id = id
        C2S_Guild_Search = C2S_Guild_ReqJoin.SerializeToString()
        C2S_Guild_Search_attr = {'name': "C2S_Guild_ReqJoin", 'protocol': 'protobuf-ss',
                                 'send_cmd': 11008, 'recv_cmd': 11009, 'uid': uid, 'sid': sid}
        senddata = pack_data(C2S_Guild_Search, C2S_Guild_Search_attr)  # 装包，需要学习
        flag, data = send_receive(self.socket, senddata, C2S_Guild_Search_attr, 32)  # 发送协议
        return flag, data

    def MSG_C2S_Guild_Quit(self, uid, sid):
        """
        退出军团协议
        :param Guild_name: string 军团名字
        :param uid:
        :param sid:
        :return:
        """
        C2S_Guild_Quit = cs_pb2.C2S_Guild_Quit()
        C2S_Guild_Quit = C2S_Guild_Quit.SerializeToString()
        C2S_Guild_Quit_attr = {'name': "C2S_Guild_Quit", 'protocol': 'protobuf-ss',
                               'send_cmd': 11014, 'recv_cmd': 11015, 'uid': uid, 'sid': sid}
        senddata = pack_data(C2S_Guild_Quit, C2S_Guild_Quit_attr)  # 装包，需要学习
        flag, data = send_receive(self.socket, senddata, C2S_Guild_Quit_attr, 32)  # 发送协议
        return flag, data

    def MSG_C2S_OrderWorld_Donate(self, num, uid, sid):
        """
        号令添加捐献旗子道具
        :param num: int 捐献数量
        :return:
        """
        C2S_OrderWorld_Donate = cs_pb2.C2S_OrderWorld_Donate()
        C2S_OrderWorld_Donate.item_id = 99  # 就捐这一个道具
        C2S_OrderWorld_Donate.num = num
        C2S_OrderWorld_Donate = C2S_OrderWorld_Donate.SerializeToString()
        C2S_OrderWorld_Donate_attr = {'name': "C2S_OrderWorld_Donate", 'protocol': 'protobuf-ss',
                                      'send_cmd': 12712, 'recv_cmd': 12713, 'uid': uid, 'sid': sid}
        senddata = pack_data(C2S_OrderWorld_Donate, C2S_OrderWorld_Donate_attr)  # 装包，需要学习
        flag, data = send_receive(self.socket, senddata, C2S_OrderWorld_Donate_attr, 32)  # 发送协议
        return flag, data

    def MSG_C2S_Friend_ConfirmFriend(self, uid, sid):
        """
        同意添加好友，全部同意
        :param uid:
        :param sid:
        :return:
        """
        C2S_Friend_ConfirmFriend = cs_pb2.C2S_Friend_ConfirmFriend()
        C2S_Friend_ConfirmFriend.id = 0
        C2S_Friend_ConfirmFriend.accept = True
        C2S_Friend_ConfirmFriend = C2S_Friend_ConfirmFriend.SerializeToString()
        C2S_Friend_ConfirmFriend_attr = {'name': "C2S_Friend_ConfirmFriend", 'protocol': 'protobuf-ss',
                                         'send_cmd': 10916, 'recv_cmd': 10917, 'uid': uid, 'sid': sid}
        senddata = pack_data(C2S_Friend_ConfirmFriend, C2S_Friend_ConfirmFriend_attr)  # 装包，需要学习
        flag, data = send_receive(self.socket, senddata, C2S_Friend_ConfirmFriend_attr, 32)  # 发送协议
        return flag, data

    def MSG_C2S_Test(self, type_into, value_into, size_into, uid, sid):
        """
        添加道具
        :param type_into: int 道具类型
        :param value_into: int 道具ID
        :param size_into: int 道具数量
        :param uid:
        :param sid:
        :return:
        """
        C2S_Test = cs_pb2.C2S_Test()
        award = C2S_Test.awards.add()
        award.type = type_into
        award.value = value_into
        award.size = size_into
        C2S_Test = C2S_Test.SerializeToString()
        C2S_Test_attr = {'name': "C2S_Test", 'protocol': 'protobuf-ss', 'send_cmd': 10140, 'recv_cmd': 10141,
                         'uid': uid, 'sid': sid}
        senddata = pack_data(C2S_Test, C2S_Test_attr)  # 装包，需要学习
        flag, data = send_receive(self.socket, senddata, C2S_Test_attr, 32)  # 发送协议
        return flag, data

    def MSG_C2S_Test_Consumes(self, type_into, value_into, size_into, uid, sid):
        """
        消耗道具
        :param type_into: int 道具类型
        :param value_into: int 道具ID
        :param size_into: int 道具数量
        :param uid:
        :param sid:
        :return:
        """
        C2S_Test = cs_pb2.C2S_Test()
        consume = C2S_Test.consumes.add()
        consume.type = type_into
        consume.value = value_into
        consume.size = size_into
        C2S_Test = C2S_Test.SerializeToString()
        C2S_Test_attr = {'name': "C2S_Test", 'protocol': 'protobuf-ss', 'send_cmd': 10140, 'recv_cmd': 10141,
                         'uid': uid, 'sid': sid}
        senddata = pack_data(C2S_Test, C2S_Test_attr)  # 装包，需要学习
        flag, data = send_receive(self.socket, senddata, C2S_Test_attr, 32)  # 发送协议
        return flag, data

    def MSG_C2S_Equipment_Upgrade(self, id_into, times_into, uid, sid):
        """
        强化装备
        :param id_into: int 道具唯一id
        :param times_into: int 强化次数
        :param uid:
        :param sid:
        :return:
        """
        C2S_Equipment_Upgrade = cs_pb2.C2S_Equipment_Upgrade()
        C2S_Equipment_Upgrade.id.append(id_into)
        C2S_Equipment_Upgrade.times.append(times_into)
        C2S_Equipment_Upgrade = C2S_Equipment_Upgrade.SerializeToString()
        C2S_Equipment_Upgrade_attr = {'name': "C2S_Equipment_Upgrade", 'protocol': 'protobuf-ss', 'send_cmd': 10600,
                                      'recv_cmd': 10601,
                                      'uid': uid, 'sid': sid}
        senddata = pack_data(C2S_Equipment_Upgrade, C2S_Equipment_Upgrade_attr)  # 装包，需要学习
        flag, data = send_receive(self.socket, senddata, C2S_Equipment_Upgrade_attr, 32)  # 发送协议
        return flag, data

    def MSG_C2S_Test_Consumes_some(self, consumes_into_list, uid, sid):
        """
        消耗道具
        :param type_into: int 道具类型
        :param value_into: int 道具ID
        :param size_into: int 道具数量
        :param uid:
        :param sid:
        :return:
        """
        C2S_Test = cs_pb2.C2S_Test()
        for consumes_into in consumes_into_list:
            C2S_Test.consumes.append(consumes_into)
        C2S_Test = C2S_Test.SerializeToString()
        C2S_Test_attr = {'name': "C2S_Test", 'protocol': 'protobuf-ss', 'send_cmd': 10140, 'recv_cmd': 10141,
                         'uid': uid, 'sid': sid}
        senddata = pack_data(C2S_Test, C2S_Test_attr)  # 装包，需要学习
        flag, data = send_receive(self.socket, senddata, C2S_Test_attr, 32)  # 发送协议
        return flag, data

    def MSG_C2S_Activity_Common_Draw(self, activity_id, uid, sid):
        """
        化身10连抽
        :param activity_id:  int 活动ID，GM后台配置
        :param uid:
        :param sid:
        :return:
        """
        C2S_Activity_Common_Draw = cs_pb2.C2S_Activity_Common_Draw()
        C2S_Activity_Common_Draw.activity_id = activity_id
        C2S_Activity_Common_Draw.activity_type = 15
        C2S_Activity_Common_Draw.type = 2
        C2S_Activity_Common_Draw = C2S_Activity_Common_Draw.SerializeToString()
        C2S_Activity_Common_Draw_attr = {'name': "C2S_Activity_Common_Draw", 'protocol': 'protobuf-ss',
                                         'send_cmd': 12816, 'recv_cmd': 12817, 'uid': uid, 'sid': sid}
        senddata = pack_data(C2S_Activity_Common_Draw, C2S_Activity_Common_Draw_attr)  # 装包，需要学习
        flag, data = send_receive(self.socket, senddata, C2S_Activity_Common_Draw_attr, 32)  # 发送协议
        return flag, data

    def MSG_C2S_GoldEquip_Draw(self, activity_id, uid, sid):
        """
        横扫千军10连抽
        :param activity_id:  int 活动ID，GM后台配置
        :param uid:
        :param sid:
        :return:
        """
        C2S_GoldEquip_Draw = cs_pb2.C2S_GoldEquip_Draw()
        C2S_GoldEquip_Draw.activity_id = activity_id
        C2S_GoldEquip_Draw.type = 2
        C2S_GoldEquip_Draw = C2S_GoldEquip_Draw.SerializeToString()
        C2S_GoldEquip_Draw_attr = {'name': "C2S_GoldEquip_Draw", 'protocol': 'protobuf-ss',
                                   'send_cmd': 12702, 'recv_cmd': 12703, 'uid': uid, 'sid': sid}
        senddata = pack_data(C2S_GoldEquip_Draw, C2S_GoldEquip_Draw_attr)  # 装包，需要学习
        flag, data = send_receive(self.socket, senddata, C2S_GoldEquip_Draw_attr, 32)  # 发送协议
        return flag, data

    def MSG_C2S_Recruit_RecruitKnight(self, activity_id, id_into, uid, sid, sub_type):
        """
        限时神将10连抽
        :param activity_id:  int 活动ID，GM后台配置
        :param id_into: int 用于区分阵营
        :param uid:
        :param sid:
        :return:
        """
        C2S_Recruit_RecruitKnight = cs_pb2.C2S_Recruit_RecruitKnight()
        C2S_Recruit_RecruitKnight.activity_id = activity_id
        C2S_Recruit_RecruitKnight.id = id_into
        C2S_Recruit_RecruitKnight.draw_type = 2
        C2S_Recruit_RecruitKnight.sub_type = sub_type
        C2S_Recruit_RecruitKnight = C2S_Recruit_RecruitKnight.SerializeToString()
        C2S_Recruit_RecruitKnight_attr = {'name': "C2S_Recruit_RecruitKnight", 'protocol': 'protobuf-ss',
                                          'send_cmd': 12250, 'recv_cmd': 12251, 'uid': uid, 'sid': sid}
        senddata = pack_data(C2S_Recruit_RecruitKnight, C2S_Recruit_RecruitKnight_attr)  # 装包，需要学习
        flag, data = send_receive(self.socket, senddata, C2S_Recruit_RecruitKnight_attr, 32)  # 发送协议
        return flag, data

    def MSG_S2C_OpObject(self, uid, sid):
        """
        身上状态变更，暂时用来查询元宝数量
        :param uid:
        :param sid:
        :return:
        """
        C2S_Flush = cs_pb2.C2S_Flush()
        C2S_Flush.user = True
        C2S_Flush = C2S_Flush.SerializeToString()
        C2S_Flush_attr = {'name': "C2S_Flush", 'protocol': 'protobuf-ss', 'send_cmd': 10100, 'recv_cmd': 10150,
                          'uid': uid, 'sid': sid}
        senddata = pack_data(C2S_Flush, C2S_Flush_attr)  # 装包，需要学习
        flag, data = send_receive(self.socket, senddata, C2S_Flush_attr, 32)  # 发送协议
        return flag, data

    def MSG_C2S_Artifact_Purify(self,id, uid, sid):
        """
        请求洗练神兵
        :param id:神兵id
        :param uid:
        :param sid:
        :return:
        """
        recv_cmd = [12622,10119]
        recv_cmd = 12622
        C2S_Artifact_Purify = cs_pb2.C2S_Artifact_Purify()
        C2S_Artifact_Purify.id = id
        C2S_Artifact_Purify = C2S_Artifact_Purify.SerializeToString()
        C2S_Artifact_Purify_attr = {'name': "C2S_Artifact_Purify", 'protocol': 'protobuf-ss', 'send_cmd': 12621, 'recv_cmd':recv_cmd ,
                          'uid': uid, 'sid': sid}
        senddata = pack_data(C2S_Artifact_Purify, C2S_Artifact_Purify_attr)  # 装包，需要学习
        flag, data = send_receive(self.socket, senddata, C2S_Artifact_Purify_attr, 32)  # 发送协议
        return flag, data

    def MSG_C2S_Artifact_PurifyResultConfirm(self,id, uid, sid):
        """
        神兵洗炼结果确认
        :param uid:
        :param sid:
        :return:
        """
        C2S_Artifact_PurifyResultConfirm = cs_pb2.C2S_Artifact_PurifyResultConfirm()
        C2S_Artifact_PurifyResultConfirm.id = id
        C2S_Artifact_PurifyResultConfirm.hole_id = -1
        C2S_Artifact_PurifyResultConfirm = C2S_Artifact_PurifyResultConfirm.SerializeToString()
        C2S_Artifact_PurifyResultConfirm_attr = {'name': "C2S_Artifact_PurifyResultConfirm", 'protocol': 'protobuf-ss', 'send_cmd': 12625, 'recv_cmd': 12626,
                          'uid': uid, 'sid': sid}
        senddata = pack_data(C2S_Artifact_PurifyResultConfirm, C2S_Artifact_PurifyResultConfirm_attr)  # 装包，需要学习
        flag, data = send_receive(self.socket, senddata, C2S_Artifact_PurifyResultConfirm_attr, 32,norecv = True)  # 发送协议
        return flag, data

    def MSG_C2S_Richest_Draw(self, activity_id, sub_type, uid, sid):
        """
        富甲天下10连抽
        :param activity_id:  int 活动ID，GM后台配置
        :param sub_type: 1代表金卡池，2表示紫金卡池
        :param type: 1表示单抽，2表示十抽
        :param uid:
        :param sid:
        :return:
        """
        C2S_Richest_Draw = cs_pb2.C2S_Richest_Draw()
        C2S_Richest_Draw.activity_id = activity_id
        C2S_Richest_Draw.sub_type = sub_type
        C2S_Richest_Draw.type = 2
        C2S_Richest_Draw = C2S_Richest_Draw.SerializeToString()
        C2S_Richest_Draw_attr = {'name': "C2S_Richest_Draw", 'protocol': 'protobuf-ss',
                                 'send_cmd': 13632, 'recv_cmd': 13633, 'uid': uid, 'sid': sid}
        senddata = pack_data(C2S_Richest_Draw, C2S_Richest_Draw_attr)  # 装包，需要学习
        flag, data = send_receive(self.socket, senddata, C2S_Richest_Draw_attr, 32)  # 发送协议
        return flag, data

    def MSG_C2S_PeakArena_Match(self, uid, sid):
        """
        王者竞技匹配
        :param uid:
        :param sid:
        :return:
        """
        C2S_PeakArena_Match = cs_pb2.C2S_PeakArena_Match()
        C2S_PeakArena_Match = C2S_PeakArena_Match.SerializeToString()
        C2S_PeakArena_Match_attr = {'name': "C2S_PeakArena_Match", 'protocol': 'protobuf-ss',
                                    'send_cmd': 13860, 'recv_cmd': 13861, 'uid': uid, 'sid': sid}
        senddata = pack_data(C2S_PeakArena_Match, C2S_PeakArena_Match_attr)  # 装包，需要学习
        flag, data = send_receive(self.socket, senddata, C2S_PeakArena_Match_attr, 32)  # 发送协议
        return flag, data

    def MSG_C2S_PeakArena_ChallengeBegin(self, uid, sid):
        """
        王者竞技战斗
        :param uid:
        :param sid:
        :return:
        """
        C2S_PeakArena_ChallengeBegin = cs_pb2.C2S_PeakArena_ChallengeBegin()
        C2S_PeakArena_ChallengeBegin = C2S_PeakArena_ChallengeBegin.SerializeToString()
        C2S_PeakArena_ChallengeBegin_attr = {'name': "C2S_PeakArena_ChallengeBegin", 'protocol': 'protobuf-ss',
                                             'send_cmd': 13862, 'recv_cmd': [13863, 20000], 'uid': uid, 'sid': sid}
        senddata = pack_data(C2S_PeakArena_ChallengeBegin, C2S_PeakArena_ChallengeBegin_attr)  # 装包，需要学习
        flag, data = send_receive(self.socket, senddata, C2S_PeakArena_ChallengeBegin_attr, 32)  # 发送协议
        return flag, data
