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
from socket import create_connection
from MyPoco.foundation.MyException import *
from MyPoco.protocol_file import cs_pb2, cg_pb2, out_base_pb2
from MyPoco.protocol.login_game import LoginGame
from MyPoco.protocol.protocol_tools import ProtocolTools
from MyPoco.foundation.information import Information
from google.protobuf.json_format import MessageToJson


class ProtocolFunction:
    def __init__(self, game_name, server_name, protocol_name, username):
        """
        用于协议测试使用，创建账号的协议方法单独实现
        开局指定测试哪个游戏的哪条协议
        通过server_name获取对应服务器的IP、端口和服务器ID。设置连接后直接启动登陆协议
        :param game_name:游戏名
        :param server_name: 区服名
        :param protocol_name: 协议名，默认空，只走登录
        :param username: 账号
        """
        self.info = Information()
        self.game_name = self.info.get_config(game_name, "app_name")
        self.pt = ProtocolTools(game_name)
        # self.username = self.info.get_config(self.game_name,"new_game_account1")
        self.username = username
        self.protocol_name = protocol_name
        # self.protocol_ages_list= self.pt.get_args_list(protocol_name)  #  todo 可能有报错
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
        self.uid = 0
        self.sever_time = 0
        self.Login()  # 可以考虑单独启动

    def get_role_id(self):
        if self.uid == 0:
            self.socket = create_connection((self.host, self.port))
            self.Login()
            return self.uid, self.sever_time
        else:
            add_msg_in_log("role_id:" + str(self.uid))
            return self.uid, self.sever_time

    def Login(self):
        """
        :return: 角色ID和服务器时间
        """
        self.protocol = LoginGame(self.socket, self.server_id, self.game_name, self.username)
        flag, data = self.protocol.MSG_C2G_Login()
        G2C_Login = cg_pb2.G2C_Login()
        G2C_Login.ParseFromString(data)
        print(G2C_Login)
        print("账号登录成功")
        # self.info.set_config("com.youzu.test.qa","uid",str(G2C_Login.uid))
        # self.info.set_config("com.youzu.test.qa","sid",str(G2C_Login.sid))
        # 如果ret等于3则需要创角协议
        self.uid = G2C_Login.uid
        self.sid = G2C_Login.sid
        if self.uid != 0:
            add_msg_in_log("role_id:" + str(self.uid))
        if G2C_Login.ret == 3:
            print("新账号，开始创建角色")
            flag_Create, data_Create = self.protocol.MSG_C2G_Create(G2C_Login.uid, G2C_Login.sid)
            G2C_Create = cg_pb2.C2G_Create()
            G2C_Create.ParseFromString(data_Create)
            # print(G2C_Create)
        elif G2C_Login.ret == 2:
            raise GameServerStopException("服务器维护中,创建账号失败")
        # 获取服务器时间
        if self.sever_time == 0:
            flag_SyncTime, data_SyncTime = self.protocol.MSG_C2S_SyncTime(G2C_Login.uid, G2C_Login.sid)  # 发送协议
            S2C_SyncTime = cs_pb2.S2C_SyncTime()  # 创建返回协议对象
            S2C_SyncTime.ParseFromString(data_SyncTime)  # 解析协议返回值
            self.sever_time = S2C_SyncTime.server_time  # 拿取返回值参数

    def Flush(self, find_name):
        """
        获取基础数据
        :return:
        """
        self.get_role_id()
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
                             "特权": "S2C_FlushPrivilege", }
        protocol_name = protocol_name_dic[find_name]
        Flush_id_dic = {"S2C_FlushRedPoint": "10103",
                        "S2C_FlushKnight": "10104",
                        "S2C_FlushFragment": "10105",
                        "S2C_FlushItem": "10106",
                        "S2C_FlushUniteToken": "10107",
                        "S2C_FlushResource": "10108",
                        "S2C_FlushFormation": "10109",
                        "S2C_FlushAdvanceEquipment": "10110",
                        "S2C_FlushEquipment": "10111",
                        "S2C_FlushTreasure": "10112",
                        "S2C_FlushDress": "10113",
                        "S2C_FlushRedPacket": "10114",
                        "S2C_FlushRandomPlayer": "10115",
                        "S2C_FlushBiographyItem": "10116",
                        "S2C_FlushSkin": "10117",
                        "S2C_FlushPrivilege": "10118", }
        recv_cmd_id = Flush_id_dic[protocol_name]
        flag_Flush, data_Flush = self.protocol.MSG_C2S_Flush(self.uid, self.sid, recv_cmd_id)
        # S2C_Flush = cs_pb2.S2C_Flush()  # 创建返回协议对象
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
        Flush_name_dic = {"S2C_FlushRedPoint": "S2C_FlushRedPoint.ParseFromString(data_Flush)",
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
                          "S2C_FlushPrivilege": "S2C_FlushPrivilege.ParseFromString(data_Flush)", }

        eval(Flush_name_dic[protocol_name])
        obj = eval(protocol_name)
        body = {}
        if find_name == "武将":
            for knight in obj.knights:
                body[str(knight.base_id)] = int(knight.id)
            return body

    def shangzhenwujiang(self, pos, id):
        """
        上阵武将
        :param pos: 坑位，2-6
        :param id: 武将的道具ID
        :return:
        """
        if pos in [2, 3, 4, 5, 6]:
            self.get_role_id()
            flag_ChangeFormation, data_ChangeFormation = self.protocol.MSG_C2S_Formation_ChangeFormation(1, pos, id,
                                                                                                         self.uid,
                                                                                                         self.sid)
            # 只上阵，不解析
            S2C_ChangeFormation = cs_pb2.S2C_Formation_ChangeFormation()  # 创建返回协议对象
            S2C_ChangeFormation.ParseFromString(data_ChangeFormation)  # 解析协议返回值
            if S2C_ChangeFormation.ret ==1:
                print("上阵成功")
            else:
                print("上阵失败"+str(S2C_ChangeFormation.ret))
        else:
            raise ValueException("武将坑位数值超出范围")

    def send_protocol(self, arg_dic):
        """
        传入参数组，发送协议，并获取返回值
        :param arg_dic: {} 参数集
        :return: 返回值
        """
        flag, data = self.pt.make_def(self.socket, self.protocol_name, arg_dic)
        return flag, data
