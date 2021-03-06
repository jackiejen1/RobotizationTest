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
import time
import traceback
from socket import create_connection
from MyPoco.foundation.MyException import *
from MyPoco.protocol import battle_tools
from MyPoco.protocol.make_resource_body import MakeResourceBody
from MyPoco.protocol.protocol_file_ss2 import cs_pb2
from MyPoco.protocol.protocol_file_ss2 import bs_pb2, cg_pb2
from MyPoco.protocol.login_game import LoginGame
from MyPoco.protocol.protocol_tools import ProtocolTools
from MyPoco.foundation.information import Information
# from google.protobuf.json_format import MessageToJson
# import lupa


class ProtocolFunction:
    def __init__(self, game_name, server_name, protocol_name, username, is_new_account, ui_path=None):
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
        self.is_new_account = is_new_account
        self.socket = None
        self.info = Information()
        self.game_name = self.info.get_config(game_name, "app_name")
        self.mri = MakeResourceBody(game_name, ui_path)
        self.pt = ProtocolTools(game_name, ui_path)
        self.username = username
        self.protocol_name = protocol_name
        # 开始连接
        server_name = server_name + "_server_ages"
        socket_ages_dic = self.info.get_config(game_name, server_name)
        self.host = socket_ages_dic["host"]  # host = "10.3.128.5"
        self.port = int(socket_ages_dic["port"])  # port = 16865
        self.server_id = int(socket_ages_dic["server_id"])
        try:
            self.socket = create_connection((self.host, self.port))
        except Exception:
            raise GmException("服务器可能在维护")
        # 启动登陆
        if "韩国" in game_name:
            region = "韩国"
        elif "日本" in game_name:
            region = "日本"
        elif "新马" in game_name:
            region = "新马"
        elif "台湾" in game_name:
            region = "台湾"
        elif "越南" in game_name:
            region = "越南"
        elif "欧美" in game_name:
            region = "欧美"
        elif "少侠" in game_name:
            region = "少侠"
        else:
            region = "国内"
        self.uid = 0
        self.sever_time = 0
        self.Login(region)
        if self.login_two:
            game_account_f = time.time()
            game_account_int = int(game_account_f * 1000000)
            self.username = str(game_account_int)[-8:]
            try:
                self.socket = create_connection((self.host, self.port))
            except Exception:
                raise GmException("服务器可能在维护")
            self.Login(region)
        # 这里做一个新账号的判断，如果是新账号就自动再登录一次获取一下UID
        # if self.uid == 0:
        #     self.socket = create_connection((self.host, self.port))
        #     self.Login(region)

    def socket_close(self):
        """
        关闭链接
        :return:
        """
        # shutdown方法是用来实现通信模式的，模式分三种，SHUT_RD 关闭接收消息通道，SHUT_WR 关闭发送消息通道，SHUT_RDWR 两个通道都关闭。
        self.socket.shutdown(2)
        self.socket.close()

    def send_protocol(self, arg_dic):
        """
        用作协议自动化，todo
        传入参数组，发送协议，并获取返回值
        :param arg_dic: {} 参数集
        :return: 返回值
        """
        flag, data = self.pt.make_def(self.socket, self.protocol_name, arg_dic)
        return flag, data

    def get_role_id(self):
        # if self.uid == 0:
        #     self.socket = create_connection((self.host, self.port))
        #     self.Login()
        #     return self.uid, self.sever_time
        # else:
        #     add_msg_in_log("role_id:" + str(self.uid))
        #     return self.uid, self.sever_time
        return self.uid, self.sever_time

    def Login(self, region):
        """
        登录协议
        :param region: 用来确定是登陆国内还是海外
        :return: 角色ID和服务器时间
        """
        self.protocol = LoginGame(self.socket, self.server_id, self.username)
        flag, data = self.protocol.MSG_C2G_Login(region)
        G2C_Login = cg_pb2.G2C_Login()
        G2C_Login.ParseFromString(data)
        print("账号登录成功,账号为" + str(self.username), G2C_Login)
        # 如果ret等于3则需要创角协议
        self.uid = G2C_Login.uid
        self.sid = G2C_Login.sid
        if self.uid != 0:
            add_msg_in_log("role_id:" + str(self.uid))
            # 需要是个新账号，但不是
            if self.is_new_account:
                self.login_two = True
                print("需要是个新账号，但不是,重新创号")
        if G2C_Login.ret == 5:
            raise GmException("重复登录,创建角色失败" + str(self.username))
        elif G2C_Login.ret == 3:
            print("新账号，开始创建角色")
            flag_Create, data_Create = self.protocol.MSG_C2G_Create(0, G2C_Login.sid)
            G2C_Create = cg_pb2.G2C_Create()
            G2C_Create.ParseFromString(data_Create)
            if G2C_Create.ret == 1:
                msg = "角色创建成功，账号：" + self.username + "，区服id：" + str(
                    self.server_id) + "，角色名：" + self.username + "，UID：" + str(G2C_Create.uid)
                print(msg)
                add_msg_in_log(msg)
                self.uid = G2C_Create.uid
            else:
                # print("*********-**********")
                # print("账号：" + self.username)
                # print(G2C_Create)
                # print("------------------------")
                # print(G2C_Login)
                # print("*********-**********")
                raise GmException("创建角色失败" + str(G2C_Create.uid))
        elif G2C_Login.ret == 2:
            raise GameServerStopException("服务器维护中,创建账号失败")
        # 获取服务器时间
        if self.sever_time == 0:
            flag_SyncTime, data_SyncTime = self.protocol.MSG_C2S_SyncTime(self.uid, G2C_Login.sid)  # 发送协议
            S2C_SyncTime = cs_pb2.S2C_SyncTime()  # 创建返回协议对象
            S2C_SyncTime.ParseFromString(data_SyncTime)  # 解析协议返回值
            self.sever_time = S2C_SyncTime.server_time  # 拿取返回值参数

    def Flush(self, find_name):
        """
        获取基础数据
        :return:
        """
        protocol_name_dic = {"红点": "S2C_FlushRedPoint",
                             "武将": "S2C_FlushKnight",
                             "碎片": "S2C_FlushFragment",
                             "道具": "S2C_FlushItem",
                             "合击": "S2C_FlushUniteToken",
                             "资源": "S2C_FlushResource",
                             "阵容": "S2C_FlushFormation",
                             "进阶装备": "S2C_FlushAdvanceEquipment",
                             "装备": "S2C_FlushEquipment",
                             "宝物": "S2C_FlushTreasure",
                             "时装": "S2C_FlushDress",
                             "红包": "S2C_FlushRedPacket",
                             "随机玩家": "S2C_FlushRandomPlayer",
                             "名将传道具": "S2C_FlushBiographyItem",
                             "皮肤": "S2C_FlushSkin",
                             "特权": "S2C_FlushPrivilege",
                             "神兵": "S2C_FlushArtifact",
                             "化身卡": "S2C_FlushCard",
                             "化身組合": "S2C_FlushCardCompose",
                             "翅膀": "S2C_FlushWing",
                             "神兽": "S2C_FlushPet",
                             "神兽装备": "S2C_FlushPetEquipment",
                             "将灵": "S2C_FlushKSoul",
                             "神兵测试": "S2C_FlushArtifact",
                             }
        protocol_name = protocol_name_dic[find_name]
        self.Flush_id_dic = {"S2C_FlushRedPoint": 10103,
                             "S2C_FlushKnight": 10104,
                             "S2C_FlushFragment": 10105,
                             "S2C_FlushItem": 10106,
                             "S2C_FlushUniteToken": 10107,
                             "S2C_FlushResource": 10108,
                             "S2C_FlushFormation": 10109,
                             "S2C_FlushAdvanceEquipment": 10110,
                             "S2C_FlushEquipment": 10111,
                             "S2C_FlushTreasure": 10112,
                             "S2C_FlushDress": 10113,
                             "S2C_FlushRedPacket": 10114,
                             "S2C_FlushRandomPlayer": 10115,
                             "S2C_FlushBiographyItem": 10116,
                             "S2C_FlushSkin": 10117,
                             "S2C_FlushPrivilege": 10118,
                             "S2C_FlushArtifact": 10119,
                             "S2C_FlushCard": 10120,
                             "S2C_FlushCardCompose": 10121,
                             "S2C_FlushPet": 10122,
                             "S2C_FlushPetEquipment": 10123,
                             "S2C_FlushKSoul": 10124,
                             "S2C_FlushWing": 13306,
                             }
        recv_cmd_id = self.Flush_id_dic[protocol_name]
        # recv_cmd_id = [10103, 10104, 10105, 10106, 10107, 10108, 10109, 10110, 10111, 10112, 10113, 10114, 10115, 10116,
        #                10117, 10118, 10119, 10120, 10121, 10122, 10123, 10124, 13306, ]
        flag_Flush, data_Flush = self.protocol.MSG_C2S_Flush(self.uid, self.sid, recv_cmd_id)
        S2C_FlushRedPoint = cs_pb2.S2C_FlushRedPoint()
        S2C_FlushKnight = cs_pb2.S2C_FlushKnight()
        S2C_FlushFragment = cs_pb2.S2C_FlushFragment()
        S2C_FlushItem = cs_pb2.S2C_FlushItem()
        S2C_FlushUniteToken = cs_pb2.S2C_FlushUniteToken()
        S2C_FlushResource = cs_pb2.S2C_FlushResource()
        S2C_FlushFormation = cs_pb2.S2C_FlushFormation()
        S2C_FlushAdvanceEquipment = cs_pb2.S2C_FlushAdvanceEquipment()
        S2C_FlushEquipment = cs_pb2.S2C_FlushEquipment()
        S2C_FlushTreasure = cs_pb2.S2C_FlushTreasure()
        S2C_FlushDress = cs_pb2.S2C_FlushDress()
        S2C_FlushRedPacket = cs_pb2.S2C_FlushRedPacket()
        S2C_FlushRandomPlayer = cs_pb2.S2C_FlushRandomPlayer()
        S2C_FlushBiographyItem = cs_pb2.S2C_FlushBiographyItem()
        S2C_FlushSkin = cs_pb2.S2C_FlushSkin()
        S2C_FlushPrivilege = cs_pb2.S2C_FlushPrivilege()
        S2C_FlushArtifact = cs_pb2.S2C_FlushArtifact()
        S2C_FlushCard = cs_pb2.S2C_FlushCard()
        S2C_FlushCardCompose = cs_pb2.S2C_FlushCardCompose()
        S2C_FlushWing = cs_pb2.S2C_FlushWing()
        S2C_FlushPet = cs_pb2.S2C_FlushPet()
        S2C_FlushPetEquipment = cs_pb2.S2C_FlushPetEquipment()
        S2C_FlushKSoul = cs_pb2.S2C_FlushKSoul()
        self.Flush_name_dic = {"S2C_FlushRedPoint": "S2C_FlushRedPoint.ParseFromString(data_Flush)",
                               "S2C_FlushKnight": "S2C_FlushKnight.ParseFromString(data_Flush)",
                               "S2C_FlushFragment": "S2C_FlushFragment.ParseFromString(data_Flush)",
                               "S2C_FlushItem": "S2C_FlushItem.ParseFromString(data_Flush)",
                               "S2C_FlushUniteToken": "S2C_FlushUniteToken.ParseFromString(data_Flush)",
                               "S2C_FlushResource": "S2C_FlushResource.ParseFromString(data_Flush)",
                               "S2C_FlushFormation": "S2C_FlushFormation.ParseFromString(data_Flush)",
                               "S2C_FlushAdvanceEquipment": "S2C_FlushAdvanceEquipment.ParseFromString(data_Flush)",
                               "S2C_FlushEquipment": "S2C_FlushEquipment.ParseFromString(data_Flush)",
                               "S2C_FlushTreasure": "S2C_FlushTreasure.ParseFromString(data_Flush)",
                               "S2C_FlushDress": "S2C_FlushDress.ParseFromString(data_Flush)",
                               "S2C_FlushRedPacket": "S2C_FlushRedPacket.ParseFromString(data_Flush)",
                               "S2C_FlushRandomPlayer": "S2C_FlushRandomPlayer.ParseFromString(data_Flush)",
                               "S2C_FlushBiographyItem": "S2C_FlushBiographyItem.ParseFromString(data_Flush)",
                               "S2C_FlushSkin": "S2C_FlushSkin.ParseFromString(data_Flush)",
                               "S2C_FlushPrivilege": "S2C_FlushPrivilege.ParseFromString(data_Flush)",
                               "S2C_FlushArtifact": "S2C_FlushArtifact.ParseFromString(data_Flush)",
                               "S2C_FlushCard": "S2C_FlushCard.ParseFromString(data_Flush)",
                               "S2C_FlushCardCompose": "S2C_FlushCardCompose.ParseFromString(data_Flush)",
                               "S2C_FlushPet": "S2C_FlushPet.ParseFromString(data_Flush)",
                               "S2C_FlushPetEquipment": "S2C_FlushPetEquipment.ParseFromString(data_Flush)",
                               "S2C_FlushKSoul": "S2C_FlushKSoul.ParseFromString(data_Flush)",
                               "S2C_FlushWing": "S2C_FlushWing.ParseFromString(data_Flush)",
                               }
        # self.Flush_name_dic = {"S2C_FlushRedPoint": "S2C_FlushRedPoint.ParseFromString(data_Flush['10103'])",
        #                        "S2C_FlushKnight": "S2C_FlushKnight.ParseFromString(data_Flush['10104'])",
        #                        "S2C_FlushFragment": "S2C_FlushFragment.ParseFromString(data_Flush['10105'])",
        #                        "S2C_FlushItem": "S2C_FlushItem.ParseFromString(data_Flush['10106'])",
        #                        "S2C_FlushUniteToken": "S2C_FlushUniteToken.ParseFromString(data_Flush['10107'])",
        #                        "S2C_FlushResource": "S2C_FlushResource.ParseFromString(data_Flush['10108'])",
        #                        "S2C_FlushFormation": "S2C_FlushFormation.ParseFromString(data_Flush['10109'])",
        #                        "S2C_FlushAdvanceEquipment": "S2C_FlushAdvanceEquipment.ParseFromString(data_Flush['10110'])",
        #                        "S2C_FlushEquipment": "S2C_FlushEquipment.ParseFromString(data_Flush['10111'])",
        #                        "S2C_FlushTreasure": "S2C_FlushTreasure.ParseFromString(data_Flush['10112'])",
        #                        "S2C_FlushDress": "S2C_FlushDress.ParseFromString(data_Flush['10113'])",
        #                        "S2C_FlushRedPacket": "S2C_FlushRedPacket.ParseFromString(data_Flush['10114'])",
        #                        "S2C_FlushRandomPlayer": "S2C_FlushRandomPlayer.ParseFromString(data_Flush['10115'])",
        #                        "S2C_FlushBiographyItem": "S2C_FlushBiographyItem.ParseFromString(data_Flush['10116'])",
        #                        "S2C_FlushSkin": "S2C_FlushSkin.ParseFromString(data_Flush['10117'])",
        #                        "S2C_FlushPrivilege": "S2C_FlushPrivilege.ParseFromString(data_Flush['10118'])",
        #                        "S2C_FlushArtifact": "S2C_FlushArtifact.ParseFromString(data_Flush['10119'])",
        #                        "S2C_FlushCard": "S2C_FlushCard.ParseFromString(data_Flush['10120'])",
        #                        "S2C_FlushCardCompose": "S2C_FlushCardCompose.ParseFromString(data_Flush['10121'])",
        #                        "S2C_FlushPet": "S2C_FlushPet.ParseFromString(data_Flush['10122'])",
        #                        "S2C_FlushPetEquipment": "S2C_FlushPetEquipment.ParseFromString(data_Flush['10123'])",
        #                        "S2C_FlushKSoul": "S2C_FlushKSoul.ParseFromString(data_Flush['10124'])",
        #                        "S2C_FlushWing": "S2C_FlushWing.ParseFromString(data_Flush['13306'])",
        #                        }
        eval(self.Flush_name_dic[protocol_name])
        obj = eval(protocol_name)
        body = {}
        if find_name == "武将":
            for knight in obj.knights:
                body[str(knight.base_id)] = int(knight.id)
            return body
        if find_name == "神兽":
            if len(obj.pets) > 0:
                for pet in obj.pets:
                    if pet.position == 0:
                        if str(pet.base_id) not in body.keys():
                            pet_list = []
                        else:
                            pet_list = body[str(pet.base_id)]
                        pet_list.append(pet.id)
                        body[str(pet.base_id)] = pet_list
            return body
        if find_name == "神兽装备":
            if len(obj.petEquipments) > 0:
                for petEquipment in obj.petEquipments:
                    if petEquipment.position == 0:
                        if petEquipment.base_id not in body.keys():
                            equipment_list = []
                        else:
                            equipment_list = body[petEquipment.base_id]
                        equipment_list.append(petEquipment.id)
                        body[petEquipment.base_id] = equipment_list
            return body
        if find_name == "宝物":
            if len(obj.treasures) > 0:
                for treasure in obj.treasures:
                    if treasure.position == 0:
                        if treasure.base_id not in body.keys():
                            equipment_list = []
                        else:
                            equipment_list = body[treasure.base_id]
                        equipment_list.append(treasure.id)
                        body[treasure.base_id] = equipment_list
            return body
        if find_name == "装备":
            for equipment in obj.equipments:
                if equipment.position == 0:
                    if str(equipment.base_id) not in body.keys():
                        equipment_list = []
                    else:
                        equipment_list = body[str(equipment.base_id)]
                    equipment_list.append(equipment.id)
                    body[str(equipment.base_id)] = equipment_list
            return body
        if find_name == "资源":
            resource_list = []
            for resource in obj.resources:
                resource_dic = {}
                resource_dic[str(resource.id)] = resource.num
                resource_list.append(resource_dic)
            return resource_list
        if find_name == "神兵":
            artifacts_dic = {}
            for artifact in obj.artifacts:
                artifacts_dic[artifact.base_id] = artifact.id
            return artifacts_dic
        if find_name == "神兵测试":
            return obj

    def del_all_resource_pb(self):
        """
        删除账号上的碎片、道具、资源、装备、宝物、进阶装备、名将传道具
        :return:
        """
        consumes_into_list = []
        consumes_into_dic = {}
        # 装备
        flag_Flush, data_Flush = self.protocol.MSG_C2S_Flush(self.uid, self.sid, 10111)
        S2C_FlushEquipment = cs_pb2.S2C_FlushEquipment()
        S2C_FlushEquipment.ParseFromString(data_Flush)
        for equipment in S2C_FlushEquipment.equipments:
            self.chushou(7, equipment.id)
        # 宝物
        flag_Flush, data_Flush = self.protocol.MSG_C2S_Flush(self.uid, self.sid, 10112)
        S2C_FlushTreasure = cs_pb2.S2C_FlushTreasure()
        S2C_FlushTreasure.ParseFromString(data_Flush)
        for treasure in S2C_FlushTreasure.treasures:
            self.chushou(8, treasure.id)
        # 碎片
        flag_Flush, data_Flush = self.protocol.MSG_C2S_Flush(self.uid, self.sid, 10105)
        S2C_FlushFragment = cs_pb2.S2C_FlushFragment()
        S2C_FlushFragment.ParseFromString(data_Flush)
        for fragment in S2C_FlushFragment.fragments:
            self.del_resource_pb(2, fragment.id, fragment.num)
        # 道具
        flag_Flush, data_Flush = self.protocol.MSG_C2S_Flush(self.uid, self.sid, 10106)
        S2C_FlushItem = cs_pb2.S2C_FlushItem()
        S2C_FlushItem.ParseFromString(data_Flush)
        for item in S2C_FlushItem.items:
            self.del_resource_pb(3, item.id, item.num)
        # 资源
        flag_Flush, data_Flush = self.protocol.MSG_C2S_Flush(self.uid, self.sid, 10108)
        S2C_FlushResource = cs_pb2.S2C_FlushResource()
        S2C_FlushResource.ParseFromString(data_Flush)
        for resource in S2C_FlushResource.resources:
            self.del_resource_pb(1, resource.id, resource.num)
        # 进阶装备
        flag_Flush, data_Flush = self.protocol.MSG_C2S_Flush(self.uid, self.sid, 10110)
        S2C_FlushAdvanceEquipment = cs_pb2.S2C_FlushAdvanceEquipment()
        S2C_FlushAdvanceEquipment.ParseFromString(data_Flush)
        for advance_equipment in S2C_FlushAdvanceEquipment.advance_equipments:
            self.del_resource_pb(6, advance_equipment.id, advance_equipment.num)
        # 名将传道具
        flag_Flush, data_Flush = self.protocol.MSG_C2S_Flush(self.uid, self.sid, 10116)
        S2C_FlushBiographyItem = cs_pb2.S2C_FlushBiographyItem()
        S2C_FlushBiographyItem.ParseFromString(data_Flush)
        for biography_item in S2C_FlushBiographyItem.biography_items:
            self.del_resource_pb(12, biography_item.id, biography_item.num)
        self.protocol.MSG_C2S_Test_Consumes_some(consumes_into_list, self.uid, self.sid)

    def chushou(self, type_into, consume_into):
        """
        出售装备和宝物
        :param consume_into: 唯一ID
        :return:
        """
        flag_Sell, data_Sell = self.protocol.MSG_C2S_Sell(type_into, consume_into, self.uid, self.sid, )
        S2C_Sell = cs_pb2.S2C_Sell()  # 创建返回协议对象
        S2C_Sell.ParseFromString(data_Sell)  # 解析协议返回值
        if S2C_Sell.ret == 1:
            print("出售成功")
        else:
            raise ProtocolException(str(self.uid) + "出售失败" + str(S2C_Sell.ret))

    def shangzhenwujiang(self, pos, id):
        """
        上阵武将
        :param pos: 坑位，2-6
        :param id: 武将的道具ID
        :return:
        """
        if pos in [2, 3, 4, 5, 6]:
            flag_ChangeFormation, data_ChangeFormation = self.protocol.MSG_C2S_Formation_ChangeFormation(1, pos, id,
                                                                                                         self.uid,
                                                                                                         self.sid)
            # 只上阵，不解析
            S2C_ChangeFormation = cs_pb2.S2C_Formation_ChangeFormation()  # 创建返回协议对象
            S2C_ChangeFormation.ParseFromString(data_ChangeFormation)  # 解析协议返回值
            if S2C_ChangeFormation.ret == 1:
                print("上阵成功")
            else:
                print()
                raise ProtocolException(str(self.uid) + "上阵失败" + str(S2C_ChangeFormation.ret))
        else:
            raise ValueException(str(self.uid) + "武将坑位数值超出范围")

    def shangzhenshenshou(self, pos, id):
        """
        上阵神兽
        :param pos: 坑位，1-6
        :param id: 神兽的唯一ID
        :return:
        """
        if pos in [1, 2, 3, 4, 5, 6]:
            flag_ChangeFormation, data_ChangeFormation = self.protocol.MSG_C2S_Formation_ChangeFormation(6, pos, id,
                                                                                                         self.uid,
                                                                                                         self.sid)
            # 只上阵，不解析
            S2C_ChangeFormation = cs_pb2.S2C_Formation_ChangeFormation()  # 创建返回协议对象
            S2C_ChangeFormation.ParseFromString(data_ChangeFormation)  # 解析协议返回值
            if S2C_ChangeFormation.ret == 1:
                print("上阵成功")
            else:
                raise ProtocolException(str(self.uid) + "上阵失败" + str(S2C_ChangeFormation.ret))
        else:
            raise ValueException(str(self.uid) + "神兽坑位数值超出范围")

    def shangzhenshenshouzhuangbei(self, pos, id):
        """
        上阵神兽装备
        :param pos: 坑位，1-19
        :param id: 神兽装备的唯一ID
        :return:
        """
        if pos in range(1, 19):
            flag_ChangeFormation, data_ChangeFormation = self.protocol.MSG_C2S_Formation_ChangeFormation(7, pos, id,
                                                                                                         self.uid,
                                                                                                         self.sid)
            # 只上阵，不解析
            S2C_ChangeFormation = cs_pb2.S2C_Formation_ChangeFormation()  # 创建返回协议对象
            S2C_ChangeFormation.ParseFromString(data_ChangeFormation)  # 解析协议返回值
            if S2C_ChangeFormation.ret == 1:
                print("神兽装备上阵成功")
            else:
                raise ProtocolException(str(self.uid) + "神兽装备上阵失败" + str(S2C_ChangeFormation.ret))
        else:
            raise ValueException(str(self.uid) + "神兽装备坑位数值超出范围")

    def chuandaibaowu(self, pos, id):
        """
        穿戴宝物
        :param pos: 坑位，1-12
        :param id: 装备ID
        :return:
        """
        if pos in range(1, 13):
            flag_ChangeFormation, data_ChangeFormation = self.protocol.MSG_C2S_Formation_ChangeFormation(4, pos, id,
                                                                                                         self.uid,
                                                                                                         self.sid)
            # 只上阵，不解析
            S2C_ChangeFormation = cs_pb2.S2C_Formation_ChangeFormation()  # 创建返回协议对象
            S2C_ChangeFormation.ParseFromString(data_ChangeFormation)  # 解析协议返回值
            if S2C_ChangeFormation.ret == 1:
                print("宝物穿戴成功")
            else:
                raise ProtocolException(str(self.uid) + "宝物穿戴失败" + str(S2C_ChangeFormation.ret))
        else:
            raise ValueException(str(self.uid) + "坑位数值超出范围")

    def chuandaishenbing(self, pos, id):
        """
        穿戴神兵
        :param pos: 坑位，1-6
        :param id: 装备ID
        :return:
        """
        if pos in range(1, 7):
            flag_ChangeFormation, data_ChangeFormation = self.protocol.MSG_C2S_Formation_ChangeFormation(5, pos, id,
                                                                                                         self.uid,
                                                                                                         self.sid)
            # 只上阵，不解析
            S2C_ChangeFormation = cs_pb2.S2C_Formation_ChangeFormation()  # 创建返回协议对象
            S2C_ChangeFormation.ParseFromString(data_ChangeFormation)  # 解析协议返回值
            if S2C_ChangeFormation.ret == 1:
                print("神兵穿戴成功")
            else:
                raise ProtocolException(str(self.uid) + "神兵穿戴失败" + str(S2C_ChangeFormation.ret))
        else:
            raise ValueException(str(self.uid) + "坑位数值超出范围")

    def chuandaizhuangbei(self, pos, id):
        """
        穿戴装备
        :param pos: 坑位，1-24
        :param id: 装备ID
        :return:
        """
        if pos in range(1, 25):
            flag_ChangeFormation, data_ChangeFormation = self.protocol.MSG_C2S_Formation_ChangeFormation(3, pos, id,
                                                                                                         self.uid,
                                                                                                         self.sid)
            # 只上阵，不解析
            S2C_ChangeFormation = cs_pb2.S2C_Formation_ChangeFormation()  # 创建返回协议对象
            S2C_ChangeFormation.ParseFromString(data_ChangeFormation)  # 解析协议返回值
            if S2C_ChangeFormation.ret == 1:
                print("装备穿戴成功")
            else:
                raise ProtocolException(str(self.uid) + "装备穿戴失败" + str(S2C_ChangeFormation.ret))
        else:
            raise ValueException(str(self.uid) + "坑位数值超出范围")

    def do_Battle(self, data_into, battle_id_into, wait_recv_cmd_id=None):
        """
        战斗效验
        :param data_into: 开始战斗协议的返回值，里面是两个，需要取id=20000协议的返回值
        :param battle_id_into: 开始战斗协议的返回值，用于校验是否是同一个战斗
        :return:
        """
        S2C_ReplyBattleReport = bs_pb2.S2C_ReplyBattleReport()
        S2C_ReplyBattleReport.ParseFromString(data_into["20000"])
        BattleReport = bs_pb2.BattleReport()
        BattleReport.ParseFromString(S2C_ReplyBattleReport.report)
        BattleReport_str = battle_tools.pb2dict(BattleReport)  # proto转dict，传给lua
        jsonStr = json.dumps(BattleReport_str)
        root_dir = os.path.abspath(os.path.dirname(os.path.dirname(__file__)))
        root_dir = root_dir.replace("\\", "/")
        if BattleReport.battle_id == battle_id_into:
            lua = lupa.LuaRuntime()
            # lua.execute("package.path = \";../../com/Tools/MyPoco/protocol/trunk/src/protobuf/?.lua;\" .. package.path")
            # lua.execute("package.path = \";../../com/Tools/MyPoco/protocol/trunk/src/?.lua;\" .. package.path")
            lua.execute('''package.path = ";''' + root_dir + '''/protocol/trunk/src/protobuf/?.lua;" .. package.path''')
            lua.execute('''package.path = ";''' + root_dir + '''/protocol/trunk/src/?.lua;" .. package.path''')
            lua.execute('''require("battle_py")''')
            autoBattleResult = lua.eval("autoBattleResult")
            resultJson = autoBattleResult(jsonStr)  # 执行战斗
            result = json.loads(resultJson)
            BattleResult = bs_pb2.BattleResult()  # 数据对象
            battle_tools.dict_to_protobuf(result, BattleResult)  # 把dict数据赋值给proto数据对象
            BattleResult_bytes = BattleResult.SerializeToString()
            flag_CheckBattleResult, data_CheckBattleResult = self.protocol.MSG_C2S_CheckBattleResult(BattleResult_bytes,
                                                                                                     self.uid, self.sid,
                                                                                                     wait_recv_cmd_id)
            S2C_CheckBattleResult = bs_pb2.S2C_CheckBattleResult()  # 创建返回协议对象
            if wait_recv_cmd_id == None:
                S2C_CheckBattleResult.ParseFromString(data_CheckBattleResult)  # 解析协议返回值
            else:
                S2C_CheckBattleResult.ParseFromString(data_CheckBattleResult["20002"])
            if S2C_CheckBattleResult.ret == 1:
                print("战斗成功")
            else:
                print(str(self.uid) + "战斗失败" + str(S2C_CheckBattleResult.ret))
                if S2C_CheckBattleResult.ret == 1001:
                    raise ProtocolException("战斗失败,需要更新战斗代码")  # 直接秒怪可以避免
                raise ProtocolException(str(self.uid) + "战斗失败")
            if wait_recv_cmd_id != None:
                return data_CheckBattleResult[str(wait_recv_cmd_id)]

    def add_friend(self, name):
        """
        添加好友
        :param name: 要添加人的角色名
        :return:
        """
        flag_Friend_AddFriend, data_Friend_AddFriend = self.protocol.MSG_C2S_Friend_AddFriend(name, self.uid, self.sid)
        S2C_ChangeFormation = cs_pb2.S2C_Friend_AddFriend()  # 创建返回协议对象
        S2C_ChangeFormation.ParseFromString(data_Friend_AddFriend)  # 解析协议返回值
        if S2C_ChangeFormation.ret == 1:
            print("添加好友成功")
        else:
            raise ProtocolException(str(self.uid) + "添加好友失败" + str(S2C_ChangeFormation.ret))

    def Dungeon_ChallengeStageBegin(self, fuben_id):
        """
        副本战斗
        :param name:
        :return:
        """
        flag_Dungeon_ChallengeStageBegin, data_Dungeon_ChallengeStageBegin = self.protocol.MSG_C2S_Dungeon_ChallengeStageBegin(
            fuben_id, self.uid, self.sid)
        S2C_Dungeon_ChallengeStageBegin = cs_pb2.S2C_Dungeon_ChallengeStageBegin()  # 创建返回协议对象
        S2C_Dungeon_ChallengeStageBegin.ParseFromString(data_Dungeon_ChallengeStageBegin["10403"])  # 解析协议返回值
        battle_id = S2C_Dungeon_ChallengeStageBegin.battle_id
        self.do_Battle(data_Dungeon_ChallengeStageBegin, battle_id)

    def EliteDungeon_BeginChallenge(self, stage_id_into, diff_type_into, ):
        """
        炼狱副本战斗
        :param name:
        :return:
        """
        flag_EliteDungeon_BeginChallenge, data_EliteDungeon_BeginChallenge = self.protocol.MSG_C2S_EliteDungeon_BeginChallenge(
            stage_id_into, diff_type_into, self.uid, self.sid)
        S2C_EliteDungeon_BeginChallenge = cs_pb2.S2C_EliteDungeon_BeginChallenge()  # 创建返回协议对象
        S2C_EliteDungeon_BeginChallenge.ParseFromString(data_EliteDungeon_BeginChallenge)  # 解析协议返回值
        if S2C_EliteDungeon_BeginChallenge.ret == 1:
            print("炼狱副本成功")
        else:
            raise ProtocolException(str(self.uid) + "炼狱副本失败" + str(S2C_EliteDungeon_BeginChallenge.ret))

    def Biography_ExecuteMission(self, mingjiangzhuan_id, type_num):
        """
        名将传战斗
        :param mingjiangzhuan_id:关卡ID
        :param type_num:1/2 ，战斗/非战斗战斗任务的判断id
        :return:
        """
        flag_Biography_ExecuteMission, data_Biography_ExecuteMission = self.protocol.MSG_C2S_Biography_ExecuteMission(
            mingjiangzhuan_id, type_num, self.uid, self.sid)
        S2C_Biography_ExecuteMission = cs_pb2.S2C_Biography_ExecuteMission()  # 创建返回协议对象
        if type_num == 2:
            data_ParseFromString = data_Biography_ExecuteMission
        else:
            data_ParseFromString = data_Biography_ExecuteMission["10703"]
        S2C_Biography_ExecuteMission.ParseFromString(data_ParseFromString)  # 解析协议返回值
        battle_id = S2C_Biography_ExecuteMission.battle_id
        if type_num == 2:
            if S2C_Biography_ExecuteMission.ret == 1:
                print(str(mingjiangzhuan_id) + "," + str(type_num) + "跳过任务成功")
            else:
                print(str(self.uid) + str(mingjiangzhuan_id) + "," + str(type_num) + "跳过任务失败" + str(
                    S2C_Biography_ExecuteMission.ret))
                raise ProtocolException(str(mingjiangzhuan_id) + "," + str(type_num) + "跳过任务失败")
        else:
            self.do_Battle(data_Biography_ExecuteMission, battle_id)

    def Storm_ChallengeBegin(self, storm_id_into, cell_id_into, ):
        """
        攻城掠地战斗
        :param storm_id_into: int 章节id
        :param cell_id_into:int 小怪id
        :return:
        """
        flag_Storm_ChallengeBegin, data_Storm_ChallengeBegin = self.protocol.MSG_C2S_Storm_ChallengeBegin(storm_id_into,
                                                                                                          cell_id_into,
                                                                                                          self.uid,
                                                                                                          self.sid)
        S2C_Storm_ChallengeBegin = cs_pb2.S2C_Storm_ChallengeBegin()  # 创建返回协议对象
        S2C_Storm_ChallengeBegin.ParseFromString(data_Storm_ChallengeBegin["12305"])  # 解析协议返回值
        battle_id = S2C_Storm_ChallengeBegin.battle_id
        self.do_Battle(data_Storm_ChallengeBegin, battle_id)

    def PeakArena_Match(self):
        """
        王者竞技匹配
        :param name:
        :return:
        """
        flag_PeakArena_Match, data_PeakArena_Match = self.protocol.MSG_C2S_PeakArena_Match(self.uid, self.sid)
        S2C_PeakArena_Match = cs_pb2.S2C_PeakArena_Match()  # 创建返回协议对象
        S2C_PeakArena_Match.ParseFromString(data_PeakArena_Match)  # 解析协议返回值
        if S2C_PeakArena_Match.ret == 1:
            print("王者竞技匹配成功")
        else:
            raise ProtocolException(str(self.uid) + "王者竞技匹配失败" + str(S2C_PeakArena_Match.ret))

    def PeakArena_ChallengeBegin(self):
        """
        王者竞技战斗
        :param name:
        :return:
        """
        flag_PeakArena_ChallengeBegin, data_PeakArena_ChallengeBegin = self.protocol.MSG_C2S_PeakArena_ChallengeBegin(
            self.uid, self.sid)
        S2C_PeakArena_ChallengeBegin = cs_pb2.S2C_PeakArena_ChallengeBegin()  # 创建返回协议对象
        S2C_PeakArena_ChallengeBegin.ParseFromString(data_PeakArena_ChallengeBegin["13863"])  # 解析协议返回值
        battle_id = S2C_PeakArena_ChallengeBegin.battle_id
        self.do_Battle(data_PeakArena_ChallengeBegin, battle_id)

    def Rebel_AttackBegin(self, id_into):
        """
        讨伐巨兽战斗
        :param storm_id_into: int 章节id
        :param cell_id_into:int 小怪id
        :return:
        """

        flag_Rebel_AttackBegin, data_Rebel_AttackBegin = self.protocol.MSG_C2S_Rebel_AttackBegin(id_into, self.uid,
                                                                                                 self.sid)
        S2C_Rebel_AttackBegin = cs_pb2.S2C_Rebel_AttackBegin()  # 创建返回协议对象
        S2C_Rebel_AttackBegin.ParseFromString(data_Rebel_AttackBegin)  # 解析协议返回值
        if S2C_Rebel_AttackBegin.ret == 1:
            print("讨伐巨兽成功")
        else:
            raise ProtocolException(str(self.uid) + "讨伐巨兽失败" + str(S2C_Rebel_AttackBegin.ret))

    def ContendTreasure_OneKeyFast(self, id_into):
        """
        一键夺宝
        :param storm_id_into: 要合成的宝物id
        :return:
        """
        flag_ContendTreasure_OneKeyFast, data_ContendTreasure_OneKeyFast = self.protocol.MSG_C2S_ContendTreasure_OneKeyFast(
            id_into, self.uid,
            self.sid)
        S2C_ContendTreasure_OneKeyFast = cs_pb2.S2C_ContendTreasure_OneKeyFast()  # 创建返回协议对象
        S2C_ContendTreasure_OneKeyFast.ParseFromString(data_ContendTreasure_OneKeyFast)  # 解析协议返回值
        if S2C_ContendTreasure_OneKeyFast.ret == 1:
            print("一键夺宝成功")
        else:
            raise ProtocolException(str(self.uid) + "一键夺宝失败" + str(S2C_ContendTreasure_OneKeyFast.ret))

    def Arena_OneKeyChallenge(self, num_into):
        """
        一键竞技场
        :param num_into: 挑战次数
        :return:
        """
        flag_Arena_OneKeyChallenge, data_Arena_OneKeyChallenge = self.protocol.MSG_C2S_Arena_OneKeyChallenge(num_into,
                                                                                                             self.uid,
                                                                                                             self.sid)
        S2C_Arena_OneKeyChallenge = cs_pb2.S2C_Arena_OneKeyChallenge()  # 创建返回协议对象
        S2C_Arena_OneKeyChallenge.ParseFromString(data_Arena_OneKeyChallenge)  # 解析协议返回值
        if S2C_Arena_OneKeyChallenge.ret == 1:
            print("一键竞技场成功")
        else:
            raise ProtocolException(str(self.uid) + "一键竞技场失败" + str(S2C_Arena_OneKeyChallenge.ret))

    def Arena_ChallengeBegin(self, rank_into):
        """
        竞技场挑战
        :param rank_into: 挑战名次
        :return:
        """
        flag_Arena_ChallengeBegin, data_Arena_ChallengeBegin = self.protocol.MSG_C2S_Arena_ChallengeBegin(rank_into,
                                                                                                          self.uid,
                                                                                                          self.sid)
        S2C_Arena_ChallengeBegin = cs_pb2.S2C_Arena_ChallengeBegin()  # 创建返回协议对象
        S2C_Arena_ChallengeBegin.ParseFromString(data_Arena_ChallengeBegin)  # 解析协议返回值
        if S2C_Arena_ChallengeBegin.ret == 1:
            print("竞技场挑战成功")
        else:
            raise ProtocolException(str(self.uid) + "竞技场挑战失败" + str(S2C_Arena_ChallengeBegin.ret))

    def Arena_GetMainInfo(self):
        """
        获取竞技场可挑战名单
        :return:list 挑战名单
        """
        flag_Arena_GetMainInfo, data_Arena_GetMainInfo = self.protocol.MSG_C2S_Arena_GetMainInfo(self.uid,
                                                                                                 self.sid)
        S2C_Arena_GetMainInfo = cs_pb2.S2C_Arena_GetMainInfo()  # 创建返回协议对象
        S2C_Arena_GetMainInfo.ParseFromString(data_Arena_GetMainInfo)  # 解析协议返回值
        if S2C_Arena_GetMainInfo.ret == 1:
            print("获取竞技场可挑战名单成功")
        else:
            print(str(self.uid) + "获取竞技场可挑战名单失败" + str(S2C_Arena_GetMainInfo.ret))
            raise ProtocolException("获取竞技场可挑战名单失败")
        rank_list = []
        for arena_unit in S2C_Arena_GetMainInfo.arena_units:
            rank = arena_unit.rank
            rank_list.append(rank)
        for ii in range(len(rank_list) - 1):
            is_not = 0
            for i in range(len(rank_list) - 1):
                x = rank_list[i]
                y = rank_list[i + 1]
                if x < y:
                    rank_list[i + 1] = x
                    rank_list[i] = y
                    is_not = is_not + 1
            if is_not == 0:
                return rank_list
        return rank_list

    def EliteDungeon_FastChallenge(self, stage_id_into, diff_type_into, times_into, ):
        """
        发起炼狱副本扫荡
        :param storm_id_into: int 章节id
        :param cell_id_into:int 宝箱id
        :return:
        """
        flag_EliteDungeon_FastChallenge, data_EliteDungeon_FastChallenge = self.protocol.MSG_C2S_EliteDungeon_FastChallenge(
            stage_id_into, diff_type_into, times_into, self.uid, self.sid)
        S2C_EliteDungeon_FastChallenge = cs_pb2.S2C_EliteDungeon_FastChallenge()  # 创建返回协议对象
        S2C_EliteDungeon_FastChallenge.ParseFromString(data_EliteDungeon_FastChallenge)  # 解析协议返回值
        if S2C_EliteDungeon_FastChallenge.ret == 1:
            print("炼狱副本扫荡成功")
        else:

            raise ProtocolException(str(self.uid) + "炼狱副本扫荡失败" + str(S2C_EliteDungeon_FastChallenge.ret))

    def Storm_Award(self, storm_id_into, cell_id_into, ):
        """
        攻城掠地领取宝箱事件
        :param storm_id_into: int 章节id
        :param cell_id_into:int 宝箱id
        :return:
        """
        flag_Storm_Award, data_Storm_Award = self.protocol.MSG_C2S_Storm_Award(storm_id_into, cell_id_into, self.uid,
                                                                               self.sid)
        S2C_Storm_Award = cs_pb2.S2C_Storm_Award()  # 创建返回协议对象
        S2C_Storm_Award.ParseFromString(data_Storm_Award)  # 解析协议返回值
        if S2C_Storm_Award.ret == 1:
            print("领取宝箱成功")
        else:
            raise ProtocolException(str(self.uid) + "领取宝箱失败" + str(S2C_Storm_Award.ret))

    def Storm_Reset(self, storm_id_into, ):
        """
        攻城掠地中关卡重置
        :param storm_id_into: int 章节id
        :return:
        """
        flag_Storm_Reset, data_Storm_Reset = self.protocol.MSG_C2S_Storm_Reset(storm_id_into, self.uid, self.sid)
        S2C_Storm_Reset = cs_pb2.S2C_Storm_Reset()  # 创建返回协议对象
        S2C_Storm_Reset.ParseFromString(data_Storm_Reset)  # 解析协议返回值
        if S2C_Storm_Reset.ret == 1:
            print("关卡重置成功")
        else:
            raise ProtocolException(str(self.uid) + "关卡重置失败" + str(S2C_Storm_Reset.ret))

    def Storm_Break(self, storm_id_into, cell_id_into, ):
        """
        攻城掠地清除障碍事件
        :param storm_id_into: int 章节id
        :param cell_id_into:int 宝箱id
        :return:
        """
        flag_Storm_Break, data_Storm_Break = self.protocol.MSG_C2S_Storm_Break(storm_id_into, cell_id_into, self.uid,
                                                                               self.sid)
        S2C_Storm_Break = cs_pb2.S2C_Storm_Break()  # 创建返回协议对象
        S2C_Storm_Break.ParseFromString(data_Storm_Break)  # 解析协议返回值
        if S2C_Storm_Break.ret == 1:
            print("清除障碍成功")
        else:
            raise ProtocolException(str(self.uid) + "清除障碍失败" + str(S2C_Storm_Break.ret))

    def Shop_Shopping(self, id_into, num_into, ):
        """
        商城购买道具
        :param storm_id_into: int 道具id
        :param num_into:int 道具数量
        :return:
        """
        flag_Shop_Shopping, data_Shop_Shopping = self.protocol.MSG_C2S_Shop_Shopping(id_into, num_into, self.uid,
                                                                                     self.sid)
        S2C_Shop_Shopping = cs_pb2.S2C_Shop_Shopping()  # 创建返回协议对象
        S2C_Shop_Shopping.ParseFromString(data_Shop_Shopping)  # 解析协议返回值
        if S2C_Shop_Shopping.ret == 1:
            print("商城购买道具成功")
        else:
            raise ProtocolException(str(self.uid) + "商城购买道具失败" + str(S2C_Shop_Shopping.ret))

    def Create_Guild(self, name):
        """
        创建军团
        :param Guild_name: string 军团名字
        :return:
        """
        flag_Guild_Create, data_Guild_Create = self.protocol.MSG_C2S_Guild_Create(name, self.uid, self.sid)
        S2C_Guild_Create = cs_pb2.S2C_Guild_Create()  # 创建返回协议对象
        S2C_Guild_Create.ParseFromString(data_Guild_Create)  # 解析协议返回值
        if S2C_Guild_Create.ret == 1:
            print("创建军团成功")
            if "guild" in dir(S2C_Guild_Create):
                guild_id = S2C_Guild_Create.guild.id
                return guild_id
        else:
            raise ProtocolException(str(self.uid) + "创建军团失败" + str(S2C_Guild_Create.ret))

    def Friend_SendGift(self, ):
        """
        给所有好友送礼物
        :return:
        """
        flag_Friend_SendGift, data_Friend_SendGift = self.protocol.MSG_C2S_Friend_SendGift(self.uid, self.sid)
        S2C_Friend_SendGift = cs_pb2.S2C_Friend_SendGift()  # 创建返回协议对象
        S2C_Friend_SendGift.ParseFromString(data_Friend_SendGift)  # 解析协议返回值
        if S2C_Friend_SendGift.ret == 1:
            print("一键送礼成功")
        else:
            raise ProtocolException(str(self.uid) + "一键送礼失败" + str(S2C_Friend_SendGift.ret))

    def search_Guild(self, Guild_name):
        """
        查询并加入军团,没有军团就创建一个军团
        :param Guild_name: string 军团名字
        :return:
        """
        if len(Guild_name) > 8:
            print("军团名字过长")
            return ""
        flag_search_Guild, data_search_Guild = self.protocol.MSG_C2S_Guild_Search(Guild_name, self.uid, self.sid)
        S2C_Guild_Search = cs_pb2.S2C_Guild_Search()  # 创建返回协议对象
        S2C_Guild_Search.ParseFromString(data_search_Guild)  # 解析协议返回值
        if S2C_Guild_Search.ret == 1:
            print("查询成功")
            for guild in S2C_Guild_Search.guilds:
                self.guild_id = guild.id
                member_num = guild.member_num
                print(member_num)
                if member_num >= 30:
                    raise ProtocolException("军团人数已满")
        elif S2C_Guild_Search.ret == 87 or S2C_Guild_Search.ret == 104:  # 军团不存在
            self.guild_id = self.Create_Guild(Guild_name)  # 创建军团
            return ""
        elif S2C_Guild_Search.ret == 82:
            print("玩家已加入军团")
            return ""
        else:
            print(str(self.uid) + "查询失败" + str(S2C_Guild_Search.ret))
            raise ProtocolException("军团不存在")
        flag_Guild_ReqJoin, data_Guild_ReqJoin = self.protocol.MSG_C2S_Guild_ReqJoin(self.guild_id, self.uid, self.sid)
        S2C_Guild_ReqJoin = cs_pb2.S2C_Guild_ReqJoin()  # 创建返回协议对象
        S2C_Guild_ReqJoin.ParseFromString(data_Guild_ReqJoin)  # 解析协议返回值
        if S2C_Guild_ReqJoin.join:
            print("加入成功")
        else:
            raise ProtocolException(str(self.uid) + "军团加入失败" + str(S2C_Guild_ReqJoin.ret))

    def Guild_Quit(self, ):
        """
        退出军团
        :param Guild_name: string 军团名字
        :return:
        """
        flag_Guild_Quit, data_Guild_Quit = self.protocol.MSG_C2S_Guild_Quit(self.uid, self.sid)
        S2C_Guild_Quit = cs_pb2.S2C_Guild_Quit()  # 创建返回协议对象
        S2C_Guild_Quit.ParseFromString(data_Guild_Quit)  # 解析协议返回值
        if S2C_Guild_Quit.ret == 1:
            print("退出军团成功")
        elif S2C_Guild_Quit.ret == 95:
            pass
        else:
            raise ProtocolException(str(self.uid) + "退出军团失败" + str(S2C_Guild_Quit.ret))

    def OrderWorld_Donate(self, num):
        """
        号令添加捐献旗子道具
        :param num: int 捐献数量
        :return:
        """
        flag_C2S_OrderWorld_Donate, data_C2S_OrderWorld_Donate = self.protocol.MSG_C2S_OrderWorld_Donate(num, self.uid,
                                                                                                         self.sid)
        S2C_OrderWorld_Donate = cs_pb2.S2C_OrderWorld_Donate()  # 创建返回协议对象
        S2C_OrderWorld_Donate.ParseFromString(data_C2S_OrderWorld_Donate)  # 解析协议返回值
        if S2C_OrderWorld_Donate.ret == 1:
            print("号令旗子捐献成功")
        else:
            print(str(self.uid) + "号令旗子捐献失败" + str(S2C_OrderWorld_Donate.ret))
            raise ProtocolException("号令旗子捐献失败")

    def Friend_ConfirmFriend(self, ):
        """
        同意添加好友，全部同意
        :return:
        """
        flag_C2S_Friend_ConfirmFriend, data_C2S_Friend_ConfirmFriend = self.protocol.MSG_C2S_Friend_ConfirmFriend(
            self.uid, self.sid)
        C2S_Friend_ConfirmFriend = cs_pb2.S2C_Friend_ConfirmFriend()  # 创建返回协议对象
        C2S_Friend_ConfirmFriend.ParseFromString(data_C2S_Friend_ConfirmFriend)  # 解析协议返回值
        if C2S_Friend_ConfirmFriend.ret == 1:
            print("全部同意成功")
        else:
            print(str(self.uid) + "全部同意失败" + str(C2S_Friend_ConfirmFriend.ret))
            raise ProtocolException("全部同意失败")

    def Formation_ChangePosition(self, pos_list):
        """
        更改上阵位置,[6,1,2,3,4,5]，表示主角在6号位
        :param pos_list: list 顺序是上阵的参数，参数是阵位
        :return:
        """
        flag_C2S_Formation_ChangePosition, data_C2S_Formation_ChangePosition = self.protocol.MSG_C2S_Formation_ChangePosition(
            pos_list, self.uid, self.sid)
        S2C_Formation_ChangePosition = cs_pb2.S2C_Formation_ChangePosition()  # 创建返回协议对象
        S2C_Formation_ChangePosition.ParseFromString(data_C2S_Formation_ChangePosition)  # 解析协议返回值
        if S2C_Formation_ChangePosition.ret == 1:
            print("更改上阵位置成功")
        else:
            raise ProtocolException(str(self.uid) + "更改上阵位置失败" + str(S2C_Formation_ChangePosition.ret))

    def DeadBattle_GetInfo(self, ):
        """
        获取无双试炼的关卡信息
        :param uid:
        :param sid:
        :return:可选buff id
        """
        flag_C2S_DeadBattle_GetInfo, data_C2S_DeadBattle_GetInfo = self.protocol.MSG_C2S_DeadBattle_GetInfo(
            self.uid, self.sid)
        S2C_DeadBattle_GetInfo = cs_pb2.S2C_DeadBattle_GetInfo()  # 创建返回协议对象
        S2C_DeadBattle_GetInfo.ParseFromString(data_C2S_DeadBattle_GetInfo)  # 解析协议返回值
        if S2C_DeadBattle_GetInfo.ret == 1:
            print("查询无双信息成功")
        else:
            raise ProtocolException(str(self.uid) + "查询无双信息失败" + str(S2C_DeadBattle_GetInfo.ret))
        history_id_list = S2C_DeadBattle_GetInfo.dbattle.history_id
        history_id = 0
        for history_id_in_list in history_id_list:
            if history_id < history_id_in_list:
                history_id = history_id_in_list
        is_award = S2C_DeadBattle_GetInfo.dbattle.is_award
        return history_id, is_award

    def DeadBattle(self, ):
        """
        无双试炼
        :return:
        """
        flag_DeadBattle_ChallengeBegin, data_DeadBattle_ChallengeBegin = self.protocol.MSG_C2S_DeadBattle_ChallengeBegin(
            self.uid, self.sid)
        S2C_DeadBattle_ChallengeBegin = cs_pb2.S2C_DeadBattle_ChallengeBegin()  # 创建返回协议对象
        S2C_DeadBattle_ChallengeBegin.ParseFromString(data_DeadBattle_ChallengeBegin["10520"])  # 解析协议返回值
        battle_id = S2C_DeadBattle_ChallengeBegin.battle_id
        self.do_Battle(data_DeadBattle_ChallengeBegin, battle_id)

    def DemonBoss_BeginChallenge(self, ):
        """
        发起讨伐魔将战斗
        :return:
        """
        flag_DemonBoss_BeginChallenge, data_DemonBoss_BeginChallenge = self.protocol.MSG_C2S_DemonBoss_BeginChallenge(
            self.uid, self.sid)
        S2C_DemonBoss_BeginChallenge = cs_pb2.S2C_DemonBoss_BeginChallenge()  # 创建返回协议对象
        S2C_DemonBoss_BeginChallenge.ParseFromString(data_DemonBoss_BeginChallenge["14205"])  # 解析协议返回值
        battle_id = S2C_DemonBoss_BeginChallenge.battle_id
        self.do_Battle(data_DemonBoss_BeginChallenge, battle_id)

    def DemonBoss_UserJoin(self, ):
        """
        讨伐魔将玩家进入
        :param uid:
        :param sid:
        :return:
        """
        flag_DemonBoss_UserJoin, data_DemonBoss_UserJoin = self.protocol.MSG_C2S_DemonBoss_UserJoin(
            self.uid, self.sid)
        S2C_DemonBoss_UserJoin = cs_pb2.S2C_DemonBoss_UserJoin()  # 创建返回协议对象
        S2C_DemonBoss_UserJoin.ParseFromString(data_DemonBoss_UserJoin)  # 解析协议返回值
        if S2C_DemonBoss_UserJoin.ret == 1:
            print("讨伐魔将玩家进入成功")
        else:
            raise ProtocolException(str(self.uid) + "讨伐魔将玩家进入失败" + str(S2C_DemonBoss_UserJoin.ret))

    def DemonBoss_ChoseTeam(self, ):
        """
        讨伐魔将选择阵营
        :param uid:
        :param sid:
        :return:
        """
        flag_DemonBoss_ChoseTeam, data_DemonBoss_ChoseTeam = self.protocol.MSG_C2S_DemonBoss_ChoseTeam(
            self.uid, self.sid)
        S2C_DemonBoss_ChoseTeam = cs_pb2.S2C_DemonBoss_ChoseTeam()  # 创建返回协议对象
        S2C_DemonBoss_ChoseTeam.ParseFromString(data_DemonBoss_ChoseTeam)  # 解析协议返回值
        if S2C_DemonBoss_ChoseTeam.ret == 1:
            print("讨伐魔将选择阵营成功")
        else:
            raise ProtocolException(str(self.uid) + "讨伐魔将选择阵营失败" + str(S2C_DemonBoss_ChoseTeam.ret))

    def DeadBattle_BoxAward(self, ):
        """
        无双试炼领取通关宝箱
        :param uid:
        :param sid:
        :return:可选buff id
        """
        flag_C2S_DeadBattle_BoxAward, data_C2S_DeadBattle_BoxAward = self.protocol.MSG_C2S_DeadBattle_BoxAward(
            self.uid, self.sid)
        S2C_DeadBattle_BoxAward = cs_pb2.S2C_DeadBattle_BoxAward()  # 创建返回协议对象
        S2C_DeadBattle_BoxAward.ParseFromString(data_C2S_DeadBattle_BoxAward)  # 解析协议返回值
        if S2C_DeadBattle_BoxAward.ret == 1:
            print("领取通关宝箱成功")
        else:
            raise ProtocolException(str(self.uid) + "领取通关宝箱失败" + str(S2C_DeadBattle_BoxAward.ret))
        buff_id_list = S2C_DeadBattle_BoxAward.dbattle.floor_buff
        buff_id = buff_id_list[2]
        return buff_id

    def DeadBattle_PickBuff(self, buff_id):
        """
        无双试炼领取通关buff
        :param uid:
        :param sid:
        :return:可选buff id
        """
        flag_C2S_DeadBattle_PickBuff, data_C2S_DeadBattle_PickBuff = self.protocol.MSG_C2S_DeadBattle_PickBuff(buff_id,
                                                                                                               self.uid,
                                                                                                               self.sid)
        S2C_DeadBattle_PickBuff = cs_pb2.S2C_DeadBattle_PickBuff()  # 创建返回协议对象
        S2C_DeadBattle_PickBuff.ParseFromString(data_C2S_DeadBattle_PickBuff)  # 解析协议返回值
        if S2C_DeadBattle_PickBuff.ret == 1:
            print("领取通关buff成功")
        else:
            raise ProtocolException(str(self.uid) + "领取通关buff失败" + str(S2C_DeadBattle_PickBuff.ret))

    def Equipment_Upgrade(self, id_into, times_into):
        """
        强化装备
        :param uid:
        :param sid:
        :return:可选buff id
        """
        flag_C2S_Equipment_Upgrade, data_C2S_Equipment_Upgrade = self.protocol.MSG_C2S_Equipment_Upgrade(id_into,
                                                                                                         times_into,
                                                                                                         self.uid,
                                                                                                         self.sid)
        S2C_Equipment_Upgrade = cs_pb2.S2C_Equipment_Upgrade()  # 创建返回协议对象
        S2C_Equipment_Upgrade.ParseFromString(data_C2S_Equipment_Upgrade)  # 解析协议返回值
        if S2C_Equipment_Upgrade.ret == 1:
            print("强化装备成功，当前装备等级" + str(S2C_Equipment_Upgrade.level))
        else:
            raise ProtocolException(str(self.uid) + "强化装备失败" + str(S2C_Equipment_Upgrade.ret))
        return S2C_Equipment_Upgrade.level[0]

    def huashen_shilian(self, activity_id):
        """
        化身10连抽
        :param activity_id:  int 活动ID，GM后台配置
        :param uid:
        :param sid:
        :return:抽到的东西
        """
        flag_Activity_Common_Draw, data_Activity_Common_Draw = self.protocol.MSG_C2S_Activity_Common_Draw(activity_id,
                                                                                                          self.uid,
                                                                                                          self.sid)
        S2C_Activity_Common_Draw = cs_pb2.S2C_Activity_Common_Draw()  # 创建返回协议对象
        S2C_Activity_Common_Draw.ParseFromString(data_Activity_Common_Draw)  # 解析协议返回值
        if S2C_Activity_Common_Draw.ret == 1:
            # print("金化身十连抽成功")
            pass
        else:
            raise ProtocolException(str(self.uid) + "金化身十连抽失败" + str(S2C_Activity_Common_Draw.ret))
        award_list = []
        for award in S2C_Activity_Common_Draw.awards:
            award_dic = {}
            award_dic["type"] = award.type
            award_dic["value"] = award.value
            award_dic["size"] = award.size
            award_list.append(award_dic)
        return award_list

    def hengsaoqianjun_shilian(self, activity_id):
        """
        横扫千军10连抽
        :param activity_id:  int 活动ID，GM后台配置
        :param uid:
        :param sid:
        :return:抽到的东西
        """
        flag_GoldEquip_Draw, data_GoldEquip_Draw = self.protocol.MSG_C2S_GoldEquip_Draw(activity_id, self.uid, self.sid)
        S2C_GoldEquip_Draw = cs_pb2.S2C_GoldEquip_Draw()  # 创建返回协议对象
        S2C_GoldEquip_Draw.ParseFromString(data_GoldEquip_Draw)  # 解析协议返回值
        if S2C_GoldEquip_Draw.ret == 1:
            # print("横扫千军十连抽成功")
            pass
        else:
            raise ProtocolException(str(self.uid) + "横扫千军十连抽失败" + str(S2C_GoldEquip_Draw.ret))
        award_list = []
        for award in S2C_GoldEquip_Draw.awards:
            award_dic = {}
            award_dic["type"] = award.type
            award_dic["value"] = award.value
            award_dic["size"] = award.size
            award_list.append(award_dic)
        return award_list

    def xianshishenjiang_shilian(self, activity_id, id_into, sub_type):
        """
        限时神将10连抽
        :param activity_id:  int 活动ID，GM后台配置
        :param id_into: int 用于区分阵营
        :param id_into: int 用于区分阵营
        :return:抽到的东西
        """
        flag_Recruit_RecruitKnight, data_Recruit_RecruitKnight = self.protocol.MSG_C2S_Recruit_RecruitKnight(
            activity_id, id_into, self.uid, self.sid, sub_type)
        S2C_Recruit_RecruitKnight = cs_pb2.S2C_Recruit_RecruitKnight()  # 创建返回协议对象
        S2C_Recruit_RecruitKnight.ParseFromString(data_Recruit_RecruitKnight)  # 解析协议返回值
        if S2C_Recruit_RecruitKnight.ret == 1:
            # print("限时神将十连抽成功")
            pass
        else:
            raise ProtocolException(str(self.uid) + "限时神将十连抽失败" + str(S2C_Recruit_RecruitKnight.ret))
        award_list = []
        for award in S2C_Recruit_RecruitKnight.awards:
            award_dic = {}
            award_dic["type"] = award.type
            award_dic["value"] = award.value
            award_dic["size"] = award.size
            award_list.append(award_dic)
        return award_list

    def fujiatianxia_shilian(self, activity_id, sub_type):
        """
        富甲天下10连抽
        :param activity_id:  int 活动ID，GM后台配置
        :param sub_type: 1代表金卡池，2表示紫金卡池
        :param uid:
        :param sid:
        :return:
        """
        flag_Richest_Draw, data_Richest_Draw = self.protocol.MSG_C2S_Richest_Draw(
            activity_id, sub_type, self.uid, self.sid, )
        S2C_Richest_Draw = cs_pb2.S2C_Richest_Draw()  # 创建返回协议对象
        S2C_Richest_Draw.ParseFromString(data_Richest_Draw)  # 解析协议返回值
        if S2C_Richest_Draw.ret == 1:
            # print("富甲天下十连抽成功")
            pass
        else:
            print(str(self.uid) + "富甲天下十连抽失败" + str(S2C_Richest_Draw.ret))
            raise ProtocolException("富甲天下十连抽失败")
        award_list = []
        for award in S2C_Richest_Draw.awards:
            award_dic = {}
            award_dic["type"] = award.type
            award_dic["value"] = award.value
            award_dic["size"] = award.size
            award_list.append(award_dic)
        event_num = 0
        for event in S2C_Richest_Draw.events:
            event_num = event_num + 1
        return award_list, event_num

    def shikongzhaohuan_shilian(self, activity_id, id):
        """
        时空召唤-10连抽
        :param activity_id:  int 活动ID，GM后台配置
        :param sub_type:
        :param uid:
        :param sid:
        :return:
        """
        flag, data = self.protocol.MSG_C2S_Recruit_RecruitAuKnight(
            activity_id, id, self.uid, self.sid, )
        S2C_Recruit_RecruitAuKnight = cs_pb2.S2C_Recruit_RecruitAuKnight()  # 创建返回协议对象
        S2C_Recruit_RecruitAuKnight.ParseFromString(data)  # 解析协议返回值
        if S2C_Recruit_RecruitAuKnight.ret == 1:
            # print("富甲天下十连抽成功")
            pass
        else:
            print(str(self.uid) + "富甲天下十连抽失败" + str(S2C_Recruit_RecruitAuKnight.ret))
            raise ProtocolException("富甲天下十连抽失败")
        award_list = []
        for award in S2C_Recruit_RecruitAuKnight.awards:
            award_dic = {}
            award_dic["type"] = award.type
            award_dic["value"] = award.value
            award_dic["size"] = award.size
            award_list.append(award_dic)
        return award_list

    def add_resource_pb(self, type_into, value_into, size_into):
        """
        添加道具
        :param type_into: int 道具类型
        :param value_into: int 道具ID
        :param size_into: int 道具数量
        :param uid:
        :param sid:
        :return:
        """
        flag_C2S_Test, data_C2S_Test = self.protocol.MSG_C2S_Test(type_into, value_into, size_into, self.uid, self.sid)
        S2C_Test = cs_pb2.S2C_Test()  # 创建返回协议对象
        S2C_Test.ParseFromString(data_C2S_Test)  # 解析协议返回值
# <<<<<<< .mine
#         try:
#             if S2C_Test.ret == 1:
#                 print("添加道具成功")
#             else:
#                 raise ProtocolException(str(self.uid) + "添加道具失败" + str(S2C_Test.ret))
#         except ProtocolException as exception:
#             log(traceback, snapshot=True)
# ||||||| .r21660
#         if S2C_Test.ret == 1:
#             print("添加道具成功")
#         else:
#             raise ProtocolException(str(self.uid) + "添加道具失败" + str(S2C_Test.ret))
# =======
        if S2C_Test.ret == 1:
            print("添加道具成功")
        else:
            raise ProtocolException(str(self.uid) + "添加道具{}，{}失败".format(type_into,value_into) + str(S2C_Test.ret))
# >>>>>>> .r21826

    def del_resource_pb(self, type_into, value_into, size_into):
        """
        消耗道具
        :param type_into: int 道具类型
        :param value_into: int 道具ID
        :param size_into: int 道具数量
        :param uid:
        :param sid:
        :return:
        """

        flag_C2S_Test, data_C2S_Test = self.protocol.MSG_C2S_Test_Consumes(type_into, value_into, size_into, self.uid,
                                                                           self.sid)
        S2C_Test = cs_pb2.S2C_Test()  # 创建返回协议对象
        S2C_Test.ParseFromString(data_C2S_Test)  # 解析协议返回值
        if S2C_Test.ret == 1:
            print("消耗道具成功")
        else:
            raise ProtocolException(str(self.uid) + "消耗道具{},{}失败".format(type_into,value_into) + str(S2C_Test.ret))

    def get_resource_pb(self, find_name, ):
        """
        查询资源数量
        :param type_into: str 道具名
        :return: int 道具数量
        """
        resource_type, resource_id = self.mri.get_type_id_from_name(find_name)
        resource_list = self.Flush("资源")
        for resource_dic in resource_list:
            for resource_key in resource_dic.keys():
                if resource_id == int(resource_key):
                    resource_num = resource_dic[resource_key]
                    return resource_num
        return 0

    def GM_World_Chat(self, instruction_str_into):
        flag_C2S_Chat, data_C2S_Chat = self.protocol.MSG_C2S_Chat(instruction_str_into, self.uid,
                                                                  self.sid)
        S2C_Chat = cs_pb2.S2C_Chat()  # 创建返回协议对象
        S2C_Chat.ParseFromString(data_C2S_Chat)  # 解析协议返回值
        if S2C_Chat.ret == 1:
            print("聊天框发送信息成功")
        else:
            raise ProtocolException(str(self.uid) + "聊天框发送信息失败" + str(S2C_Chat.ret))

    def get_resource_pb_yuanbao(self):
        """
        查询元宝数量
        :return: int 道具数量
        """
        flag_OpObject, data_OpObject = self.protocol.MSG_S2C_OpObject(self.uid, self.sid)
        S2C_OpObject = cs_pb2.S2C_OpObject()
        S2C_OpObject.ParseFromString(data_OpObject)
        yuanbaoshuliang = S2C_OpObject.user.gold
        return yuanbaoshuliang

    def Artifact_Purify(self, id):
        """
        请求洗练神兵
        :param id: 神兵的唯一ID
        :return:
        """
        flag_Artifact_Purify, data_Artifact_Purify = self.protocol.MSG_C2S_Artifact_Purify(id, self.uid, self.sid)
        S2C_Artifact_Purify = cs_pb2.S2C_Artifact_Purify()
        # S2C_Artifact_Purify.ParseFromString(data_Artifact_Purify["12622"])
        S2C_Artifact_Purify.ParseFromString(data_Artifact_Purify)
        if S2C_Artifact_Purify.ret == 1:
            # print("神兵洗练成功")
            pass
        else:
            # print(str(self.uid) + "神兵洗练失败" + str(S2C_GoldEquip_Draw.ret))
            raise ProtocolException("神兵洗练失败" + str(S2C_Artifact_Purify.ret))
        # S2C_FlushArtifact = cs_pb2.S2C_FlushArtifact()
        # S2C_FlushArtifact.ParseFromString(data_Artifact_Purify["10119"])
        S2C_FlushArtifact = self.Flush("神兵测试")
        artifacts_list = []
        for artifact in S2C_FlushArtifact.artifacts:
            artifact_dic = {}
            for purify_hole in artifact.artifact_purify_holes:  # 孔位信息
                # 空位：品质
                artifact_dic[str(purify_hole.id)] = str(purify_hole.tmp_quality)
            artifacts_list.append(artifact_dic)
        flag_Artifact_PurifyResultConfirm, data_Artifact_PurifyResultConfirm = self.protocol.MSG_C2S_Artifact_PurifyResultConfirm(
            id, self.uid, self.sid, )
        # S2C_Artifact_PurifyResultConfirm =cs_pb2.S2C_Artifact_PurifyResultConfirm()
        # S2C_Artifact_PurifyResultConfirm.ParseFromString(data_Artifact_PurifyResultConfirm)
        # if S2C_Artifact_PurifyResultConfirm.ret == 1:
        #     # print("神兵洗练结果保存成功")
        #     pass
        # else:
        #     # print(str(self.uid) + "神兵洗练结果保存失败" + str(S2C_GoldEquip_Draw.ret))
        #     raise ProtocolException("神兵洗练结果保存失败"+ str(S2C_Artifact_PurifyResultConfirm.ret))
        return artifacts_list

    def GM_fengkuanghaoling(self, Guild_name, num, join):
        """
        疯狂给军团-号令天下活动捐旗子
        会先创建军团，然后捐旗子
        :param Guild_name: 军团名称
        :param num: 捐献的数量
        :join bool: 加入/创建军团
        :return:
        """
        if join != "":
            if join:
                # 查询并加入军团
                self.search_Guild(Guild_name)
            else:
                # 创建军团
                self.Create_Guild(Guild_name)
        self.OrderWorld_Donate(num)

    def GM_fengkuangfuben(self, fuben_id):
        """
        指定战斗某一关，必须是可以直接打的关卡，目前仅限于少三2
        :param fuben_id:int 副本ID，读配置表

        :return:
        """
        self.Dungeon_ChallengeStageBegin(fuben_id)

    def GM_yijian_guanai(self, checkpoint_id_list):
        """
        一键通关关隘，目前仅限于少三2
        :param checkpoint_id_list:
        :return:
        """
        storm_id_into = checkpoint_id_list[0]
        cell_id_into = checkpoint_id_list[1]
        storm_type = checkpoint_id_list[2]
        if storm_type == 1:
            self.Storm_ChallengeBegin(storm_id_into, cell_id_into)
        elif storm_type == 2:
            self.Storm_Award(storm_id_into, cell_id_into)
        elif storm_type == 3:
            self.Storm_Break(storm_id_into, cell_id_into)
        else:
            raise GmException("没有对应的战斗类型")

    def GM_huoyue_guanai(self, ):
        """
        剑阁，三个怪
        :param checkpoint_num:
        :return:
        """
        self.Storm_ChallengeBegin(2001, 1)
        self.Storm_ChallengeBegin(2001, 3)
        self.Storm_ChallengeBegin(2001, 5)
        # self.Storm_Reset(2001)

    def Debate_EnterInfo(self):
        """
        学宫论战-进入玩法
        :return:
        """

        flag_Debate_EnterInfo, data_Debate_EnterInfo = self.protocol.MSG_C2S_Debate_EnterInfo(self.uid, self.sid)
        S2C_Debate_EnterInfo = cs_pb2.S2C_Debate_EnterInfo()
        S2C_Debate_EnterInfo.ParseFromString(data_Debate_EnterInfo)
        if S2C_Debate_EnterInfo.ret == 1:
            print("学宫论战-进入玩法成功")
        else:
            raise ProtocolException(str(self.uid) + "学宫论战-进入玩法失败" + str(S2C_Debate_EnterInfo.ret))

    def Debate_RefreshMatch(self):
        """
        学宫论战-手动匹配
        :return:
        """

        flag, data_pak = self.protocol.MSG_C2S_Debate_RefreshMatch(self.uid, self.sid)
        S2C_Debate_RefreshMatch = cs_pb2.S2C_Debate_RefreshMatch()
        S2C_Debate_RefreshMatch.ParseFromString(data_pak)
        if S2C_Debate_RefreshMatch.ret == 1:
            print("学宫论战-手动匹配成功")
        else:
            raise ProtocolException(str(self.uid) + "学宫论战-手动匹配失败" + str(S2C_Debate_RefreshMatch.ret))

    def Debate_LineUp(self):
        """
        学宫论战-布阵保存
        :param line_up: 武将id列表，12位
        :return:
        """
        flag, data_pak = self.protocol.MSG_C2S_Debate_LineUp(self.uid, self.sid)
        S2C_Debate_LineUp = cs_pb2.S2C_Debate_LineUp()
        S2C_Debate_LineUp.ParseFromString(data_pak)
        if S2C_Debate_LineUp.ret == 1:
            print("学宫论战-布阵保存成功")
        else:
            raise ProtocolException(str(self.uid) + "学宫论战-布阵保存失败" + str(S2C_Debate_LineUp.ret))

    def Debate_BattleStart(self, enemy_index):
        """
        学宫论战-战斗
        :return:
        """
        flag, data = self.protocol.MSG_C2S_Debate_BattleStart(enemy_index, self.uid, self.sid)
        S2C_Debate_BattleStart = cs_pb2.S2C_Debate_BattleStart()  # 创建返回协议对象
        S2C_Debate_BattleStart.ParseFromString(data["14555"])  # 解析协议返回值
        if S2C_Debate_BattleStart.ret == 1:
            print("学宫论战-战斗成功")
        else:
            raise ProtocolException(str(self.uid) + "学宫论战-战斗失败" + str(S2C_Debate_BattleStart.ret))
        S2C_Debate_BattleFinish = cs_pb2.S2C_Debate_BattleFinish()  # 创建返回协议对象
        S2C_Debate_BattleFinish.ParseFromString(data["14556"])  # 解析协议返回值
        # for multi_result in S2C_Debate_BattleFinish.multi_result:
        #     print(multi_result)
        if S2C_Debate_BattleFinish.is_win:
            print("打赢了，获得积分：" + str(S2C_Debate_BattleFinish.score))
            print("打赢了，积分排名：" + str(S2C_Debate_BattleFinish.score_rank))
        else:
            print("打输了，没有获得积分")
        return S2C_Debate_BattleFinish.is_win

    def Knight_StarIncrease(self, id):
        """
        武将升星
        :param id: 唯一ID
        :return:
        """
        flag, data_pak = self.protocol.MSG_C2S_Knight_StarIncrease(id, self.uid, self.sid)
        S2C_Knight_StarIncrease = cs_pb2.S2C_Knight_StarIncrease()
        S2C_Knight_StarIncrease.ParseFromString(data_pak)
        if S2C_Knight_StarIncrease.ret == 1:
            print("武将升星成功")
        else:
            raise ProtocolException(str(self.uid) + "武将升星失败" + str(S2C_Knight_StarIncrease.ret))

    def Equipment_RefiningOneLevel(self, id):
        """
        装备一键精炼
        :param id: 唯一ID
        :return:
        """
        flag, data_pak = self.protocol.MSG_C2S_Equipment_RefiningOneLevel(id, self.uid, self.sid)
        S2C_Equipment_RefiningOneLevel = cs_pb2.S2C_Equipment_RefiningOneLevel()
        S2C_Equipment_RefiningOneLevel.ParseFromString(data_pak)
        if S2C_Equipment_RefiningOneLevel.ret == 1:
            print("装备一键精炼成功")
        else:
            print(str(self.uid) + "装备一键精炼失败" + str(S2C_Equipment_RefiningOneLevel.ret))

    def Equipment_Glyph(self, id):
        """
        装备雕纹
        :param id: 唯一ID
        :return:
        """
        flag, data_pak = self.protocol.MSG_C2S_Equipment_Glyph(id, self.uid, self.sid)
        S2C_Equipment_Glyph = cs_pb2.S2C_Equipment_Glyph()
        S2C_Equipment_Glyph.ParseFromString(data_pak)
        if S2C_Equipment_Glyph.ret == 1:
            print("装备雕纹成功")
        else:
            raise ProtocolException(str(self.uid) + "装备雕纹失败" + str(S2C_Equipment_Glyph.ret))

    def Pet_OneKey_LevelUp(self, id, level):
        """
        神兽一键升级
        :param id: 唯一ID
        :param level: 提升等级
        :return:
        """
        function_name = "神兽一键升级"
        flag, data_pak = self.protocol.MSG_C2S_Pet_OneKey_LevelUp(id, level, self.uid, self.sid)
        S2C = cs_pb2.S2C_Pet_OneKey_LevelUp()
        S2C.ParseFromString(data_pak)
        if S2C.ret == 1:
            print(function_name + "成功")
        else:
            raise ProtocolException(str(self.uid) + function_name + "失败" + str(S2C.ret))
        return S2C.level

    def Pet_StarUp(self, id, cost_id):
        """
        神兽升星
        :param id: 唯一ID
        :param cost_id: 消耗材料的唯一ID
        :return:
        """
        function_name = "神兽升星"
        flag, data_pak = self.protocol.MSG_C2S_Pet_StarUp(id, cost_id, self.uid, self.sid)
        S2C = cs_pb2.S2C_Pet_StarUp()
        S2C.ParseFromString(data_pak)
        if S2C.ret == 1:
            print(function_name + "成功")
        else:
            raise ProtocolException(str(self.uid) + function_name + "失败" + str(S2C.ret))

    def Pet_Equipment_FastUpgrade(self, positions):
        """
        神兽装备一键强化
        :param positions: 装备位置
        :return:
        """
        function_name = "神兽装备一键强化"
        flag, data_pak = self.protocol.MSG_C2S_Pet_Equipment_FastUpgrade(positions, self.uid, self.sid)
        S2C = cs_pb2.S2C_Pet_Equipment_FastUpgrade()
        S2C.ParseFromString(data_pak)
        if S2C.ret == 1:
            print(function_name + "成功")
        else:
            raise ProtocolException(str(self.uid) + function_name + "失败" + str(S2C.ret))

    def Treasure_Upgrade_OneLevel(self, id,level):
        """
        宝物一键强化
        :param positions: 装备位置
        :return:
        """
        function_name = "宝物一键强化"
        flag, data_pak = self.protocol.MSG_C2S_Treasure_Upgrade_OneLevel(id,level, self.uid, self.sid)
        S2C = cs_pb2.S2C_Treasure_Upgrade_OneLevel()
        S2C.ParseFromString(data_pak)
        if S2C.ret == 1:
            print(function_name + "成功")
        else:
            raise ProtocolException(str(self.uid) + function_name + "失败" + str(S2C.ret))


    def Treasure_Glyph(self, id):
        """
        宝物精炼
        :param id:
        :return:
        """
        function_name = "宝物精炼"
        flag, data_pak = self.protocol.MSG_C2S_Treasure_Glyph(id, self.uid, self.sid)
        S2C = cs_pb2.S2C_Treasure_Glyph()
        S2C.ParseFromString(data_pak)
        if S2C.ret == 1:
            print(function_name + "成功")
        else:
            raise ProtocolException(str(self.uid) + function_name + "失败" + str(S2C.ret))

    def Artifact_LevelUp(self, id, tg_lv):
        """
        神兵强化
        :param id:
        :return:
        """
        function_name = "神兵强化"
        flag, data_pak = self.protocol.MSG_C2S_Artifact_LevelUp(id, tg_lv, self.uid, self.sid)
        S2C = cs_pb2.S2C_Artifact_LevelUp()
        S2C.ParseFromString(data_pak)
        if S2C.ret == 1:
            print(function_name + "成功")
        else:
            raise ProtocolException(str(self.uid) + function_name + "失败" + str(S2C.ret))

    def Artifact_Star(self, id, tg_star):
        """
        神兵升星
        :param id:
        :return:
        """
        function_name = "神兵升星"
        flag, data_pak = self.protocol.MSG_C2S_Artifact_Star(id, tg_star, self.uid, self.sid)
        S2C = cs_pb2.S2C_Artifact_Star()
        S2C.ParseFromString(data_pak)
        if S2C.ret == 1:
            print(function_name + "成功")
        else:
            raise ProtocolException(str(self.uid) + function_name + "失败" + str(S2C.ret))

    def GuideWind_Start(self,):
        """
        周末狂欢-启阵
        :param id:
        :return:
        """
        function_name = "周末狂欢-启阵"
        flag, data_pak = self.protocol.MSG_C2S_GuideWind_Start(self.uid, self.sid)
        S2C = cs_pb2.S2C_GuideWind_Start()
        S2C.ParseFromString(data_pak)
        if S2C.ret == 1:
            # print(function_name + "成功")
            award_list = []
            for award_pool in S2C.award_pool:
                for award in award_pool.awards:
                    award_dic = {}
                    award_dic["type"] = award.type
                    award_dic["value"] = award.value
                    award_dic["size"] = award.size
                    award_list.append(award_dic)
            return award_list

        else:
            raise ProtocolException(str(self.uid) + function_name + "失败" + str(S2C.ret))

    def GuideWind_Draw(self,):
        """
        周末狂欢-抽奖
        :param id:
        :return:
        """
        function_name = "周末狂欢-抽奖"
        flag, data_pak = self.protocol.MSG_C2S_GuideWind_Draw(self.uid, self.sid)
        S2C = cs_pb2.S2C_GuideWind_Draw()
        S2C.ParseFromString(data_pak)
        if S2C.ret == 1:
            # print(function_name + "成功")
            award_list = []
            for award in S2C.award:
                award_dic = {}
                award_dic["type"] = award.type
                award_dic["value"] = award.value
                award_dic["size"] = award.size
                award_list.append(award_dic)
            return award_list
        else:
            raise ProtocolException(str(self.uid) + function_name + "失败" + str(S2C.ret))