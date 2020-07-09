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
import time
from socket import create_connection
from MyPoco.foundation.MyException import *
from MyPoco.protocol import battle_tools
from MyPoco.protocol.make_resource_body import MakeResourceBody
from MyPoco.protocol_file import cs_pb2, cg_pb2, bs_pb2, out_base_pb2
from MyPoco.protocol.login_game import LoginGame
from MyPoco.protocol.protocol_tools import ProtocolTools
from MyPoco.foundation.information import Information
# from google.protobuf.json_format import MessageToJson
import lupa


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
        self.mri = MakeResourceBody(game_name)
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
            if S2C_ChangeFormation.ret == 1:
                print("上阵成功")
            else:
                print("上阵失败" + str(S2C_ChangeFormation.ret))
        else:
            raise ValueException("武将坑位数值超出范围")

    def add_friend(self, name):
        self.get_role_id()
        flag_Friend_AddFriend, data_Friend_AddFriend = self.protocol.MSG_C2S_Friend_AddFriend(name, self.uid, self.sid)
        S2C_ChangeFormation = cs_pb2.S2C_Friend_AddFriend()  # 创建返回协议对象
        S2C_ChangeFormation.ParseFromString(data_Friend_AddFriend)  # 解析协议返回值
        if S2C_ChangeFormation.ret == 1:
            print("添加成功")
        else:
            print("添加失败" + str(S2C_ChangeFormation.ret))

    def Dungeon_ChallengeStageBegin(self, fuben_id):
        """
        副本战斗
        :param name:
        :return:
        """
        self.get_role_id()
        flag_Dungeon_ChallengeStageBegin, data_Dungeon_ChallengeStageBegin = self.protocol.MSG_C2S_Dungeon_ChallengeStageBegin(
            fuben_id, self.uid, self.sid)
        S2C_Dungeon_ChallengeStageBegin = cs_pb2.S2C_Dungeon_ChallengeStageBegin()  # 创建返回协议对象
        S2C_Dungeon_ChallengeStageBegin.ParseFromString(data_Dungeon_ChallengeStageBegin["10403"])  # 解析协议返回值
        S2C_ReplyBattleReport = bs_pb2.S2C_ReplyBattleReport()
        S2C_ReplyBattleReport.ParseFromString(data_Dungeon_ChallengeStageBegin["20000"])
        BattleReport = bs_pb2.BattleReport()
        BattleReport.ParseFromString(S2C_ReplyBattleReport.report)
        BattleReport_str = battle_tools.pb2dict(BattleReport)
        jsonStr = json.dumps(BattleReport_str)
        if BattleReport.battle_id == S2C_Dungeon_ChallengeStageBegin.battle_id:
            lua = lupa.LuaRuntime()
            lua.execute("package.path = \";../../com/Tools/MyPoco/protocol/trunk/src/protobuf/?.lua;\" .. package.path")
            lua.execute("package.path = \";../../com/Tools/MyPoco/protocol/trunk/src/?.lua;\" .. package.path")
            lua.execute("require(\"battle\")")
            autoBattleResult = lua.eval("autoBattleResult")
            resultJson = autoBattleResult(jsonStr)
            result = json.loads(resultJson)
            BattleResult = bs_pb2.BattleResult()
            battle_tools.dict_to_protobuf(result, BattleResult)
            BattleResult_bytes = BattleResult.SerializeToString()
            flag_CheckBattleResult, data_CheckBattleResult = self.protocol.MSG_C2S_CheckBattleResult(BattleResult_bytes,
                                                                                                     self.uid, self.sid)
            S2C_CheckBattleResult = bs_pb2.S2C_CheckBattleResult()  # 创建返回协议对象
            S2C_CheckBattleResult.ParseFromString(data_CheckBattleResult)  # 解析协议返回值
            if S2C_CheckBattleResult.ret == 1:
                print("战斗成功")
            else:
                print("战斗失败" + str(S2C_CheckBattleResult.ret))

    def Create_Guild(self, name):
        """
        创建军团
        :param Guild_name: string 军团名字
        :return:
        """
        self.get_role_id()
        flag_Guild_Create, data_Guild_Create = self.protocol.MSG_C2S_Guild_Create(name, self.uid, self.sid)
        C2S_Guild_Create = cs_pb2.S2C_Guild_Create()  # 创建返回协议对象
        C2S_Guild_Create.ParseFromString(data_Guild_Create)  # 解析协议返回值
        if C2S_Guild_Create.ret == 1:
            print("创建成功")
        else:
            print("创建失败" + str(C2S_Guild_Create.ret))

    def search_Guild(self, Guild_name):
        """
        查询并加入军团
        :param Guild_name: string 军团名字
        :return:
        """
        self.get_role_id()
        flag_search_Guild, data_search_Guild = self.protocol.MSG_C2S_Guild_Search(Guild_name, self.uid, self.sid)
        S2C_search_Guild = cs_pb2.S2C_Guild_Search()  # 创建返回协议对象
        S2C_search_Guild.ParseFromString(data_search_Guild)  # 解析协议返回值
        for guild in S2C_search_Guild.guilds:
            guild_id = guild.id
        if S2C_search_Guild.ret == 1:
            print("查询成功")
        else:
            print("查询失败" + str(S2C_search_Guild.ret))
            raise NoneException("军团不存在")
        flag_Guild_ReqJoin, data_Guild_ReqJoin = self.protocol.MSG_C2S_Guild_ReqJoin(guild_id, self.uid, self.sid)
        S2C_Guild_ReqJoin = cs_pb2.S2C_Guild_ReqJoin()  # 创建返回协议对象
        S2C_Guild_ReqJoin.ParseFromString(data_Guild_ReqJoin)  # 解析协议返回值
        if S2C_Guild_ReqJoin.join:
            print("加入成功")
        else:
            print("加入失败" + str(S2C_Guild_ReqJoin.ret))
            raise NoneException("军团加入失败")

    def OrderWorld_Donate(self, num):
        """
        号令添加捐献旗子道具
        :param num: int 捐献数量
        :return:
        """
        self.get_role_id()
        flag_C2S_OrderWorld_Donate, data_C2S_OrderWorld_Donate = self.protocol.MSG_C2S_OrderWorld_Donate(num, self.uid, self.sid)
        S2C_OrderWorld_Donate = cs_pb2.S2C_OrderWorld_Donate()  # 创建返回协议对象
        S2C_OrderWorld_Donate.ParseFromString(data_C2S_OrderWorld_Donate)  # 解析协议返回值
        if S2C_OrderWorld_Donate.ret == 1:
            print("捐献成功")
        else:
            print("捐献失败" + str(S2C_OrderWorld_Donate.ret))

    def GM_fengkuanghaoling(self, Guild_name, num):
        """
        疯狂给军团-号令天下活动捐旗子
        会先创建军团，然后捐旗子
        :param Guild_name: 军团名称
        :param num: 捐献的数量
        :return:
        """
        self.Create_Guild(Guild_name)
        self.OrderWorld_Donate(num)










    def GM_fengkuangfuben(self, checkpoint_name, num):
        """
        指定战斗某一关，必须是可以直接打的关卡，目前仅限于少三2
        :param checkpoint:str 玩法名-章节数-小关卡数  副本-80-10
        :param num:int 战斗次数
        :return:
        """
        fuben_id = self.mri.get_num_from_name(checkpoint_name)
        for i in range(num):
            self.Dungeon_ChallengeStageBegin(fuben_id)
