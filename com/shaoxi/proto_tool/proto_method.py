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

# from google.protobuf.json_format import MessageToJson
from gm.gm_method import GmMethod
from proto_tool.protocol_tools import pack_data, send_receive
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
        self.mri = MakeResourceBody("少西", ui_path)
        self.username = "_" + username
        self.server_name = server_name
        # 开始连接
        if "1" in server_name:
            self.server_id = 2246440001
        elif "2" in server_name:
            self.server_id = 2246440002
        self.host = "g1.snxyj.uuzuonline.net"
        self.host = "120.92.248.137"
        self.port = 38422
        try:
            self.socket = socket.create_connection((self.host, self.port))
        except Exception:
            raise GmException("服务器可能在维护")
        self.uid = 0
        self.sever_time = 0
        self.gm = GmMethod("少西")

    def Login(self):
        """
        登录协议
        :param version: 版本号
        :return:
        """
        get_acctoun_url = "http:#gm.snxyj.youzu.com/tools/token.php?op_id=1&uid=" + self.username
        r = requests.get(url=get_acctoun_url)
        tocken_dic = r.json()
        C2S_Login = cs_pb2.C2S_Login()
        C2S_Login.token = tocken_dic["osdk_ticket"]
        C2S_Login.sid = self.server_id
        C2S_Login.channel_id = ""
        C2S_Login.device_id = '''{"moblie":"","device":"Test Simulator","ad":"{\"device_name\":\"iPhone 6s\",\"bundle_id\":\"com.uuzu.nznh\",\"idfv\":\"7A64A21C-C624-4FB4-A36D-A850FFE206A4\",\"os_version\":\"iOS10.0.2\",\"operator\":\"chinaMobile\",\"language\":\"zh-Hans-CN\",\"device_type\":\"iPhone 6s\",\"network\":\"WiFi\",\"idfa\":\"0951FD47-788E-4042-B491-7E73C2711EDA\"}"}'''
        # C2S_Login.version = version
        C2G_Login = C2S_Login.SerializeToString()
        C2G_Login_attr = {'name': "C2S_Login", 'protocol': 'protobuf-ss', 'send_cmd': 10002, 'recv_cmd': 10003,
                          'uid': 0, 'sid': 0}
        senddata = pack_data(C2G_Login, C2G_Login_attr)
        Login_flag, Login_data = send_receive(self.socket, senddata, C2G_Login_attr, 20)
        S2C_Login = cs_pb2.S2C_Login()
        S2C_Login.ParseFromString(Login_data)
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
            flag, data = send_receive(self.socket, senddata, C2G_Create_attr, 20)
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

    def ID_C2S_Flush(self, ):
        """
        刷新协议
        :return:
        """
        C2S_Flush = cs_pb2.C2S_Flush()
        C2S_Flush.id = True
        C2S_Flush.user = True  # 玩家基本信息
        C2S_Flush.equipment = True  # 装备
        C2S_Flush.knight = True  # 神将
        C2S_Flush.treasure = True  # 宝物
        C2S_Flush.fragment = True  # 碎片
        C2S_Flush.fight_knight = True  # 上阵武将
        C2S_Flush.fight_resource = True  # 上阵阵容资源（team_resource）
        C2S_Flush.item = True  # 道具
        C2S_Flush.instrument_materials = True  # 法宝胚子列表
        C2S_Flush.stars = True  # 星宿
        C2S_Flush.bible = True  # 真经
        C2S_Flush.fairyland = True  # 仙界
        C2S_Flush.daily_dungeon = True  # 日常副本信息
        C2S_Flush.soul = True  # 仙灵
        C2S_Flush.dress = True  # 时装
        C2S_Flush.pets = True  # 神兽
        C2S_Flush.magic = True  # 神将幻化
        C2S_Flush.magic_book = True  # 法术书
        C2S_Flush.gem = True  # 宝石信息
        C2S_Flush.gem_inteam = True  # 宝石上阵信息
        C2S_Flush.wing = True  # 翅膀
        C2S_Flush.knight_card = True  # 魂卡数据
        C2S_Flush.knight_card_team = True  # 魂卡队伍图鉴
        C2S_Flush.eliminate_demon = True  # 降妖伏魔
        C2S_Flush.totem = True  # 仙灵英魂
        C2S_Flush.wing_bless = True  # 翅膀护阵
        C2S_Flush.practice_buddhism = True  # 主角升金信息
        C2S_Flush.rune = True  # 符文
        C2S_Flush.realm = True  # 神符灵界
        C2S_Flush.knight_bless = True  # 神将护佑
        C2S_Flush.rune_stone = True  # 符石
        C2S_Flush.matrix = True  # 仙阵养成
        C2S_Flush.star_knight = True  # 星君
        C2S_Flush.pulse = True  # 主角升紫金
        C2S_Flush.artifact = True  # 神器

        recv_cmd_list = [10007, ]
        C2S_Flush_attr = {'name': "C2S_Flush", 'protocol': 'protobuf-ss', 'send_cmd': 10006, 'recv_cmd': recv_cmd_list,
                          'uid': self.uid, 'sid': self.sid}
        senddata = pack_data(C2S_Flush, C2S_Flush_attr)
        flag, data = send_receive(self.socket, senddata, C2S_Flush_attr, 20)
        S2C_Flush = cs_pb2.S2C_Flush()
        S2C_Flush.ParseFromString(data[10007])
        if S2C_Flush.ret == 1:
            print("信息拉取成功")
        else:
            raise GmException(str(self.uid) + "信息拉取失败" + str(S2C_Flush.ret))
        # todo 其他协议后续补齐
        S2C_GetUser
        S2C_GetEquipment
        S2C_GetKnight
        S2C_GetTreasure
        S2C_GetSoulScore
        S2C_GetSoul
        S2C_GetActivedSouls
        S2C_GetFragment
        S2C_GetGem
        S2C_FightKnight
        S2C_FightResource
        S2C_GetItem
        S2C_GetInstrument
        S2C_GetFirstKill

    def ID_C2S_KnightLevelUp(self, id, materials):
        """
        武将升级
        :param id: 武将唯一id
        :param materials: 升级材料
        :return:
        """
        C2S_KnightLevelUp = cs_pb2.C2S_KnightLevelUp()
        C2S_KnightLevelUp.id = id
        C2S_KnightLevelUp.materials = materials
        C2S_KnightLevelUp.SerializeToString()
        C2S_KnightLevelUp_attr = {'name': "C2S_KnightLevelUp", 'protocol': 'protobuf-ss', 'send_cmd': 11000,
                                  'recv_cmd': 11001,
                                  'uid': self.uid, 'sid': self.sid}
        senddata = pack_data(C2S_KnightLevelUp, C2S_KnightLevelUp_attr)
        flag, data = send_receive(self.socket, senddata, C2S_KnightLevelUp_attr, 20)
        S2C_KnightLevelUp = cs_pb2.S2C_KnightLevelUp()
        S2C_KnightLevelUp.ParseFromString(data)
        if S2C_KnightLevelUp.ret == 1:
            print("武将升级成功")
        else:
            raise GmException(str(self.uid) + "武将升级失败" + str(S2C_KnightLevelUp.ret))

    def ID_C2S_KnightQualityUp(self, id, knight_id):
        """
        武将突破
        :param id: 武将唯一id
        :param materials: 消耗同名卡
        :return:
        """
        C2S_KnightQualityUp = cs_pb2.C2S_KnightQualityUp()
        C2S_KnightQualityUp.id = id
        C2S_KnightQualityUp.knight_id = knight_id
        C2S_KnightQualityUp.SerializeToString()
        C2S_KnightQualityUp_attr = {'name': "C2S_KnightQualityUp", 'protocol': 'protobuf-ss', 'send_cmd': 11002,
                                    'recv_cmd': 11003,
                                    'uid': self.uid, 'sid': self.sid}
        senddata = pack_data(C2S_KnightQualityUp, C2S_KnightQualityUp_attr)
        flag, data = send_receive(self.socket, senddata, C2S_KnightQualityUp_attr, 20)
        S2C_KnightQualityUp = cs_pb2.S2C_KnightQualityUp()
        S2C_KnightQualityUp.ParseFromString(data)
        if S2C_KnightQualityUp.ret == 1:
            print("武将突破成功")
        else:
            raise GmException(str(self.uid) + "武将突破失败" + str(S2C_KnightQualityUp.ret))

    def ID_C2S_KnightDestinyUp10(self, id):
        """
        武将天命10次
        :param id: 武将唯一id
        :return:
        """
        C2S_KnightDestinyUp10 = cs_pb2.C2S_KnightDestinyUp10()
        C2S_KnightDestinyUp10.id = id
        C2S_KnightDestinyUp10.auto = True
        C2S_KnightDestinyUp10.SerializeToString()
        C2S_KnightDestinyUp10_attr = {'name': "C2S_KnightDestinyUp10", 'protocol': 'protobuf-ss', 'send_cmd': 11036,
                                      'recv_cmd': 11037,
                                      'uid': self.uid, 'sid': self.sid}
        senddata = pack_data(C2S_KnightDestinyUp10, C2S_KnightDestinyUp10_attr)
        flag, data = send_receive(self.socket, senddata, C2S_KnightDestinyUp10_attr, 20)
        S2C_KnightDestinyUp10 = cs_pb2.S2C_KnightDestinyUp10()
        S2C_KnightDestinyUp10.ParseFromString(data)
        if S2C_KnightDestinyUp10.ret == 1:
            print("武将天命10次成功")
        else:
            raise GmException(str(self.uid) + "武将天命10次失败" + str(S2C_KnightDestinyUp10.ret))

    def ID_C2S_UpgradeTreasure(self, id, material):
        """
        强化宝物
        :param id: 武将唯一id
        :return:
        """
        C2S_UpgradeTreasure = cs_pb2.C2S_UpgradeTreasure()
        C2S_UpgradeTreasure.id = id
        C2S_UpgradeTreasure.materials = material  # 升级材料
        C2S_UpgradeTreasure.SerializeToString()
        send_cmd = 10900
        recv_cmd = 10901
        C2S_UpgradeTreasure_attr = {'name': "C2S_UpgradeTreasure", 'protocol': 'protobuf-ss', 'send_cmd': send_cmd,
                                      'recv_cmd': recv_cmd,
                                      'uid': self.uid, 'sid': self.sid}
        senddata = pack_data(C2S_UpgradeTreasure, C2S_UpgradeTreasure_attr)
        flag, data = send_receive(self.socket, senddata, C2S_UpgradeTreasure_attr, 20)
        S2C_UpgradeTreasure = cs_pb2.S2C_UpgradeTreasure()
        S2C_UpgradeTreasure.ParseFromString(data)
        if S2C_UpgradeTreasure.ret == 1:
            print("强化宝物成功")
        else:
            raise GmException(str(self.uid) + "强化宝物失败" + str(S2C_UpgradeTreasure.ret))
