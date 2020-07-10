# _*_coding:utf-8 _*_
# !/usr/bin/python3
# Reference:********************************
# encoding: utf-8
# @Time: 2020/2/28  18:24
# @Author: 洞洞
# @File: login_game.py
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
    def __init__(self, socket, server_id, game_name, username=None):
        self.info = Information()
        if username == None:
            self.username = self.info.get_config(game_name, "new_game_account1")
        else:
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
        username = str(self.username)[2:]
        C2G_Create.name = username
        C2G_Create.type = 210000
        C2G_Create.server_id = self.server_id
        C2G_Create = C2G_Create.SerializeToString()
        C2G_Create_attr = {'name': "C2G_Create", 'protocol': 'protobuf-ss', 'send_cmd': 10004, 'recv_cmd': 10005,
                           'uid': uid, 'sid': sid}
        senddata = pack_data(C2G_Create, C2G_Create_attr)
        flag, data = send_receive(self.socket, senddata, C2G_Create_attr, 32)
        msg = "角色创建成功，账号：" + self.username + "，区服id：" + str(self.server_id) + "，角色名：" + username
        print(msg)
        add_msg_in_log(msg)
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
        :param tp: 上阵类型，武将1，宝物2，装备3
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

    def MSG_C2S_Biography_ExecuteMission(self, id, uid, sid):
        """
        发起名将传战斗
        :param id:
        :param uid:
        :param sid:
        :return:
        """
        C2S_Biography_ExecuteMission = cs_pb2.C2S_Biography_ExecuteMission()
        C2S_Biography_ExecuteMission.id = id
        C2S_Biography_ExecuteMission = C2S_Biography_ExecuteMission.SerializeToString()
        C2S_Biography_ExecuteMission_attr = {'name': "C2S_Biography_ExecuteMission", 'protocol': 'protobuf-ss',
                                             'send_cmd': 10702, 'recv_cmd': [10703, 20000], 'uid': uid, 'sid': sid}
        senddata = pack_data(C2S_Biography_ExecuteMission, C2S_Biography_ExecuteMission_attr)  # 装包，需要学习
        flag, data = send_receive(self.socket, senddata, C2S_Biography_ExecuteMission_attr, 32)  # 发送协议
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
        添加或消耗道具，目前只用做添加，消耗待定 #todo
        :param type_into: int 道具类型
        :param value_into: int 道具ID
        :param size_into: int 道具数量
        :param uid:
        :param sid:
        :return:
        """
        C2S_Test = cs_pb2.C2S_Test()
        # C2S_Test.awards.type = type_into
        # C2S_Test.awards.value = value_into
        # C2S_Test.awards.size = size_into
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
