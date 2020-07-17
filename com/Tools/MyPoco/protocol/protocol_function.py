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
        if "韩国" in server_name:
            region = "韩国"
        elif "日本" in server_name:
            region = "日本"
        elif "新马" in server_name:
            region = "新马"
        elif "台湾" in server_name:
            region = "台湾"
        else:
            region = "国内"
        self.uid = 0
        self.sever_time = 0
        self.Login(region)
        # 这里做一个新账号的判断，如果是新账号就自动再登录一次获取一下UID
        if self.uid == 0:
            self.socket = create_connection((self.host, self.port))
            self.Login(region)

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
        self.protocol = LoginGame(self.socket, self.server_id, self.game_name, self.username)
        flag, data = self.protocol.MSG_C2G_Login(region)
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
        if find_name == "资源":
            resource_list = []
            for resource in obj.resources:
                resource_dic = {}
                resource_dic[str(resource.id)] = resource.num
                resource_list.append(resource_dic)
            return resource_list

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
                print("上阵失败" + str(S2C_ChangeFormation.ret))
                raise ProtocolException("上阵失败")
        else:
            raise ValueException("武将坑位数值超出范围")

    def do_Battle(self, data_into, battle_id_into):
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
            lua.execute('''require("battle")''')
            autoBattleResult = lua.eval("autoBattleResult")
            resultJson = autoBattleResult(jsonStr)  # 执行战斗
            result = json.loads(resultJson)
            BattleResult = bs_pb2.BattleResult()  # 数据对象
            battle_tools.dict_to_protobuf(result, BattleResult)  # 把dict数据赋值给proto数据对象
            BattleResult_bytes = BattleResult.SerializeToString()
            flag_CheckBattleResult, data_CheckBattleResult = self.protocol.MSG_C2S_CheckBattleResult(BattleResult_bytes,
                                                                                                     self.uid, self.sid)
            S2C_CheckBattleResult = bs_pb2.S2C_CheckBattleResult()  # 创建返回协议对象
            S2C_CheckBattleResult.ParseFromString(data_CheckBattleResult)  # 解析协议返回值
            if S2C_CheckBattleResult.ret == 1:
                print("战斗成功")
            else:
                print("战斗失败" + str(S2C_CheckBattleResult.ret))
                if S2C_CheckBattleResult.ret == 1001:
                    raise ProtocolException("战斗失败,需要更新战斗代码")  # 直接秒怪可以避免
                raise ProtocolException("战斗失败")

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
            print("添加好友失败" + str(S2C_ChangeFormation.ret))
            raise ProtocolException("添加好友失败")

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
                print(str(mingjiangzhuan_id) + "," + str(type_num) + "跳过任务失败" + str(S2C_Biography_ExecuteMission.ret))
                raise ProtocolException(str(mingjiangzhuan_id) + "," + str(type_num) + "跳过任务失败")
        else:
            self.do_Battle(data_Biography_ExecuteMission, battle_id)

    def Storm_ChallengeBegin(self, storm_id, cell_id, ):
        """
        攻城掠地战斗
        :param name:
        :return:
        """
        flag_Storm_ChallengeBegin, data_Storm_ChallengeBegin = self.protocol.MSG_C2S_Storm_ChallengeBegin(storm_id,
                                                                                                          cell_id,
                                                                                                          self.uid,
                                                                                                          self.sid)
        S2C_Storm_ChallengeBegin = cs_pb2.S2C_Storm_ChallengeBegin()  # 创建返回协议对象
        S2C_Storm_ChallengeBegin.ParseFromString(data_Storm_ChallengeBegin["12305"])  # 解析协议返回值
        battle_id = S2C_Storm_ChallengeBegin.battle_id
        self.do_Battle(S2C_Storm_ChallengeBegin, battle_id)

    def Create_Guild(self, name):
        """
        创建军团
        :param Guild_name: string 军团名字
        :return:
        """
        flag_Guild_Create, data_Guild_Create = self.protocol.MSG_C2S_Guild_Create(name, self.uid, self.sid)
        C2S_Guild_Create = cs_pb2.S2C_Guild_Create()  # 创建返回协议对象
        C2S_Guild_Create.ParseFromString(data_Guild_Create)  # 解析协议返回值
        if C2S_Guild_Create.ret == 1:
            print("创建军团成功")
        else:
            print("创建军团失败" + str(C2S_Guild_Create.ret))
            raise ProtocolException("创建军团失败")

    def search_Guild(self, Guild_name):
        """
        查询并加入军团
        :param Guild_name: string 军团名字
        :return:
        """
        flag_search_Guild, data_search_Guild = self.protocol.MSG_C2S_Guild_Search(Guild_name, self.uid, self.sid)
        S2C_search_Guild = cs_pb2.S2C_Guild_Search()  # 创建返回协议对象
        S2C_search_Guild.ParseFromString(data_search_Guild)  # 解析协议返回值
        for guild in S2C_search_Guild.guilds:
            guild_id = guild.id
        if S2C_search_Guild.ret == 1:
            print("查询成功")
        else:
            print("查询失败" + str(S2C_search_Guild.ret))
            raise ProtocolException("军团不存在")
        flag_Guild_ReqJoin, data_Guild_ReqJoin = self.protocol.MSG_C2S_Guild_ReqJoin(guild_id, self.uid, self.sid)
        S2C_Guild_ReqJoin = cs_pb2.S2C_Guild_ReqJoin()  # 创建返回协议对象
        S2C_Guild_ReqJoin.ParseFromString(data_Guild_ReqJoin)  # 解析协议返回值
        if S2C_Guild_ReqJoin.join:
            print("加入成功")
        else:
            print("加入失败" + str(S2C_Guild_ReqJoin.ret))
            raise ProtocolException("军团加入失败")

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
            print("号令旗子捐献失败" + str(S2C_OrderWorld_Donate.ret))
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
            print("全部同意失败" + str(C2S_Friend_ConfirmFriend.ret))
            raise ProtocolException("全部同意失败")

    def Formation_ChangePosition(self,pos_list ):
        """
        更改上阵位置,[6,1,2,3,4,5]，表示主角在6号位
        :param pos_list: list 顺序是上阵的参数，参数是阵位
        :return:
        """
        flag_C2S_Formation_ChangePosition, data_C2S_Formation_ChangePosition = self.protocol.MSG_C2S_Formation_ChangePosition(pos_list,self.uid, self.sid)
        S2C_Formation_ChangePosition = cs_pb2.S2C_Formation_ChangePosition()  # 创建返回协议对象
        S2C_Formation_ChangePosition.ParseFromString(data_C2S_Formation_ChangePosition)  # 解析协议返回值
        if S2C_Formation_ChangePosition.ret == 1:
            print("更改上阵位置成功")
        else:
            print("更改上阵位置失败" + str(S2C_Formation_ChangePosition.ret))
            raise ProtocolException("更改上阵位置失败")

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
            print("查询无双信息失败" + str(S2C_DeadBattle_GetInfo.ret))
            raise ProtocolException("查询无双信息失败")
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
            print("领取通关宝箱失败" + str(S2C_DeadBattle_BoxAward.ret))
            raise ProtocolException("领取通关宝箱失败")
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
            print("领取通关buff失败" + str(S2C_DeadBattle_PickBuff.ret))
            raise ProtocolException("领取通关buff失败")

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
            print("金化身十连抽成功")
        else:
            print("金化身十连抽失败" + str(S2C_Activity_Common_Draw.ret))
            raise ProtocolException("金化身十连抽失败")
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
            print("横扫千军十连抽成功")
        else:
            print("横扫千军十连抽失败" + str(S2C_GoldEquip_Draw.ret))
            raise ProtocolException("横扫千军十连抽失败")
        award_list = []
        for award in S2C_GoldEquip_Draw.awards:
            award_dic = {}
            award_dic["type"] = award.type
            award_dic["value"] = award.value
            award_dic["size"] = award.size
            award_list.append(award_dic)
        return award_list

    def xianshishenjiang_shilian(self, activity_id, id_into):
        """
        限时神将10连抽
        :param activity_id:  int 活动ID，GM后台配置
        :param id_into: int 用于区分阵营
        :return:抽到的东西
        """
        flag_Recruit_RecruitKnight, data_Recruit_RecruitKnight = self.protocol.MSG_C2S_Recruit_RecruitKnight(
            activity_id, id_into, self.uid, self.sid)
        S2C_Recruit_RecruitKnight = cs_pb2.S2C_Recruit_RecruitKnight()  # 创建返回协议对象
        S2C_Recruit_RecruitKnight.ParseFromString(data_Recruit_RecruitKnight)  # 解析协议返回值
        if S2C_Recruit_RecruitKnight.ret == 1:
            print("限时神将十连抽成功")
        else:
            print("限时神将十连抽失败" + str(S2C_Recruit_RecruitKnight.ret))
            raise ProtocolException("限时神将十连抽失败")
        award_list = []
        for award in S2C_Recruit_RecruitKnight.awards:
            award_dic = {}
            award_dic["type"] = award.type
            award_dic["value"] = award.value
            award_dic["size"] = award.size
            award_list.append(award_dic)
        return award_list

    def add_resource_pb(self, type_into, value_into, size_into):
        """
        添加或消耗道具，目前只用做添加，消耗待定
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
        if S2C_Test.ret == 1:
            print("添加道具成功")
        else:
            print("添加道具失败" + str(S2C_Test.ret))
            raise ProtocolException("添加道具失败")

    def get_resource_pb(self, find_name, ):
        """
        添加查询资源数量
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

    def GM_fengkuanghaoling(self, Guild_name, num, join):
        """
        疯狂给军团-号令天下活动捐旗子
        会先创建军团，然后捐旗子
        :param Guild_name: 军团名称
        :param num: 捐献的数量
        :join bool: 加入/创建军团
        :return:
        """
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

    def GM_fengkuanghuashen(self, type_into, value_into, size_into, activity_id, is_stop):
        """
        十连抽化身，检测是否抽到指定的东西
        :param type_into: int 道具type
        :param value_into: int 道具 value
        :param activity_id: int 活动ID，GM后台配置
        :param is_stop: bool 是否抽到后就马上停止
        :return:
        """

        award_list = self.huashen_shilian(activity_id)
        num = 0
        for award in award_list:
            award_type = award["type"]
            award_value = award["value"]
            award_size = award["size"]
            if award_type == type_into and award_value == value_into and award_size == size_into:
                num = num + 1
                if is_stop:
                    raise GmException("抽到需要验证的道具了，终止抽奖")
                else:
                    print("抽到了" + str(num) + "次")

    def GM_fengkuanghengsaoqianjun(self, type_into, value_into, size_into, activity_id, is_stop):
        """
        横扫千军10连抽，检测是否抽到指定的东西
        :param type_into: int 道具type
        :param value_into: int 道具 value
        :param activity_id: int 活动ID，GM后台配置
        :param is_stop: bool 是否抽到后就马上停止
        :return:
        """
        award_list = self.hengsaoqianjun_shilian(activity_id)
        num = 0
        for award in award_list:
            award_type = award["type"]
            award_value = award["value"]
            award_size = award["size"]
            if award_type == type_into and award_value == value_into and award_size == size_into:
                num = num + 1
                if is_stop:
                    raise GmException("抽到需要验证的道具了，终止抽奖")
                else:
                    print("抽到了" + str(num) + "次")

    def GM_fengkuangxianshijinjiang(self, type_into, value_into, activity_id, id_into, is_stop):
        """
        十连抽化身，检测是否抽到指定的东西
        :param type_into: int 道具type
        :param value_into: int 道具 value
        :param activity_id: int 活动ID，GM后台配置
        :param id_into: int 期数ID，GM后台配置
        :param is_stop: bool 是否抽到后就马上停止
        :return:
        """

        award_list = self.xianshishenjiang_shilian(activity_id, id_into)
        num = 0
        for award in award_list:
            award_type = award["type"]
            award_value = award["value"]
            if award_type == type_into and award_value == value_into:
                num = num + 1
                if is_stop:
                    raise GmException("抽到需要验证的道具了，终止抽奖")
                else:
                    print("抽到了" + str(num) + "次")
