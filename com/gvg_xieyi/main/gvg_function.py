# _*_coding:utf-8 _*_
#!/usr/bin/python3
#Reference:********************************
# encoding: utf-8
#@Time: 2020/9/3  11:35
#@Author: 洞洞
#@File: gvg_function.py
#@Function:
#@Method:
#Reference:********************************
import datetime
import time
import requests
from MyPoco.protocol_file import cs_pb2, cg_pb2, bs_pb2, out_base_pb2
from MyPoco.protocol.protocol_tools import pack_data, send_receive
import hashlib, json, base64
# from locust.exception import StopLocust
from MyPoco.foundation.information import Information
from MyPoco.foundation.MyException import *
from socket import create_connection

class LoginGame:
    def __init__(self, server_id):
        game_account_f = time.time()
        dateArray = datetime.datetime.fromtimestamp(game_account_f)
        hms = dateArray.strftime("%Y%m%d")
        game_account_int = int(game_account_f * 1000000)
        self.username = hms[-1:] + str(game_account_int)[-7:]
        self.server_id = server_id
        self.host = "fqa.sk.youzu.com"
        self.port = 19007
        try:
            self.socket = create_connection((self.host, self.port))
        except Exception:
            raise GmException("服务器可能在维护")

    def MSG_C2G_Login(self):
        v = {}
        v["account_system_id"] = "1_"
        v["osdk_game_id"] = "196377847"
        v["user_id"] = self.username
        v["time"] = "123"
        v["osdk_user_id"] = "1_" + self.username
        v["extend"] = "1|1|1"
        v["channel_id"] = "1"
        key = "EXNhCfHaunHNzMG80qyjcOBUuXAnVeTU"
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

    def MSG_C2S_Chat(self):
        """
        聊天协议
        :param content_str_into: str 聊天的内容，默认世界频道
        :param uid:
        :param sid:
        :return:
        """
        C2S_Chat = cs_pb2.C2S_Chat()
        C2S_Chat.channel = 1#世界频道
        C2S_Chat.content = "/set_guild_level 9"
        C2S_Chat = C2S_Chat.SerializeToString()
        C2S_Chat_attr = {'name': "C2S_Chat", 'protocol': 'protobuf-ss',
                                                'send_cmd': 10142, 'recv_cmd': 10143, 'uid': self.uid, 'sid': self.sid}
        senddata = pack_data(C2S_Chat, C2S_Chat_attr)  # 装包，需要学习
        flag, data = send_receive(self.socket, senddata, C2S_Chat_attr, 32)  # 发送协议
        S2C_Chat = cs_pb2.S2C_Chat()  # 创建返回协议对象
        S2C_Chat.ParseFromString(data)  # 解析协议返回值
        if S2C_Chat.ret == 1:
            print("聊天框发送信息成功")
        else:
            raise ProtocolException(str(self.uid) + "聊天框发送信息失败" + str(S2C_Chat.ret))

    def MSG_C2S_Guild_Search(self, Guild_name):
        """
        加入/创建军团协议
        :param Guild_name: string 军团名字
        :param uid:
        :param sid:
        :return:
        """
        if len(Guild_name)>8:
            print("军团名字过长")
            return ""
        C2S_Guild_Search = cs_pb2.C2S_Guild_Search()
        C2S_Guild_Search.key = Guild_name
        C2S_Guild_Search = C2S_Guild_Search.SerializeToString()
        C2S_Guild_Search_attr = {'name': "C2S_Guild_Search", 'protocol': 'protobuf-ss',
                                 'send_cmd': 11002, 'recv_cmd': 11003, 'uid': self.uid, 'sid': self.sid}
        senddata = pack_data(C2S_Guild_Search, C2S_Guild_Search_attr)  # 装包，需要学习
        flag, data = send_receive(self.socket, senddata, C2S_Guild_Search_attr, 32)  # 发送协议
        S2C_Guild_Search = cs_pb2.S2C_Guild_Search()  # 创建返回协议对象
        S2C_Guild_Search.ParseFromString(data)  # 解析协议返回值
        if S2C_Guild_Search.ret == 1:
            print("查询成功")
            for guild in S2C_Guild_Search.guilds:
                self.guild_id = guild.id
                member_num = guild.member_num
                print(member_num)
                if member_num >= 48:
                    raise ProtocolException("军团人数已满")
        elif  S2C_Guild_Search.ret== 87 or S2C_Guild_Search.ret== 104:
            C2S_Guild_Create = cs_pb2.C2S_Guild_Create()
            C2S_Guild_Create.name = Guild_name
            C2S_Guild_Create.icon = 1
            C2S_Guild_Create.confirm = False
            C2S_Guild_Create.level = 1
            C2S_Guild_Create = C2S_Guild_Create.SerializeToString()
            C2S_Guild_Create_attr = {'name': "C2S_Guild_Create", 'protocol': 'protobuf-ss',
                                     'send_cmd': 11006, 'recv_cmd': 11007, 'uid': self.uid, 'sid': self.sid}
            senddata = pack_data(C2S_Guild_Create, C2S_Guild_Create_attr)  # 装包，需要学习
            flag, data = send_receive(self.socket, senddata, C2S_Guild_Create_attr, 32)  # 发送协议
            S2C_Guild_Create = cs_pb2.S2C_Guild_Create()  # 创建返回协议对象
            S2C_Guild_Create.ParseFromString(data)  # 解析协议返回值
            if S2C_Guild_Create.ret == 1:
                print("创建军团成功")
                C2S_Chat = cs_pb2.C2S_Chat()
                C2S_Chat.channel = 1  # 世界频道
                C2S_Chat.content = "/set_guild_level 10"
                C2S_Chat = C2S_Chat.SerializeToString()
                C2S_Chat_attr = {'name': "C2S_Chat", 'protocol': 'protobuf-ss',
                                     'send_cmd': 10142, 'recv_cmd': 10143, 'uid': self.uid, 'sid':  self.sid}
                senddata = pack_data(C2S_Chat, C2S_Chat_attr)  # 装包，需要学习
                send_receive(self.socket, senddata, C2S_Chat_attr, 32,norecv=True)  # 发送协议
                print("军团等级设置完毕")
                self.guild_id = S2C_Guild_Create.guild.id
                return ""
            else:
                raise ProtocolException(str(self.uid) + "创建军团失败" + str(S2C_Guild_Create.ret))
        else:
            raise ProtocolException(str(self.uid) + "创建军团失败" + str(S2C_Guild_Search.ret))
        C2S_Guild_ReqJoin = cs_pb2.C2S_Guild_ReqJoin()
        C2S_Guild_ReqJoin.guild_id = self.guild_id
        C2S_Guild_Search = C2S_Guild_ReqJoin.SerializeToString()
        C2S_Guild_Search_attr = {'name': "C2S_Guild_ReqJoin", 'protocol': 'protobuf-ss',
                                 'send_cmd': 11008, 'recv_cmd': 11009, 'uid': self.uid, 'sid': self.sid}
        senddata = pack_data(C2S_Guild_Search, C2S_Guild_Search_attr)  # 装包，需要学习
        flag, data = send_receive(self.socket, senddata, C2S_Guild_Search_attr, 32)  # 发送协议
        S2C_Guild_ReqJoin = cs_pb2.S2C_Guild_ReqJoin()  # 创建返回协议对象
        S2C_Guild_ReqJoin.ParseFromString(data)  # 解析协议返回值
        if S2C_Guild_ReqJoin.join:
            print("加入成功")
        else:
            raise ProtocolException(str(self.uid) + "军团加入失败" + str(S2C_Guild_ReqJoin.ret))

    def MSG_C2S_Guild_Quit(self, ):
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
                               'send_cmd': 11014, 'recv_cmd': 11015, 'uid': self.uid, 'sid': self.sid}
        senddata = pack_data(C2S_Guild_Quit, C2S_Guild_Quit_attr)  # 装包，需要学习
        send_receive(self.socket, senddata, C2S_Guild_Quit_attr, 32,norecv=True)  # 发送协议


    def MSG_C2S_GVG_GetInfo(self,):
        """
        获取军团战信息
        :param Guild_name:
        :param uid:
        :param sid:
        :return:
        """
        C2S_GVG_GetInfo = cs_pb2.C2S_GVG_GetInfo()
        C2S_GVG_GetInfo = C2S_GVG_GetInfo.SerializeToString()
        C2S_GVG_GetInfo_attr = {'name': "C2S_GVG_GetInfo", 'protocol': 'protobuf-ss',
                                 'send_cmd': 14430, 'recv_cmd': 14431, 'uid': self.uid, 'sid': self.sid}
        senddata = pack_data(C2S_GVG_GetInfo, C2S_GVG_GetInfo_attr)  # 装包，需要学习
        flag, data = send_receive(self.socket, senddata, C2S_GVG_GetInfo_attr, 32)  # 发送协议
        S2C_GVG_GetInfo = cs_pb2.S2C_GVG_GetInfo()  # 创建返回协议对象
        S2C_GVG_GetInfo.ParseFromString(data)  # 解析协议返回值
        if "my_match" in dir(S2C_GVG_GetInfo) and S2C_GVG_GetInfo.is_guild_joined:
            for Info in S2C_GVG_GetInfo.my_match:
                self.G_bisai_id = Info.id
        if S2C_GVG_GetInfo.ret == 1:
            print("军团战信息查询成功")
        else:
            print(str(self.uid) + "军团战信息查询失败" + str(S2C_GVG_GetInfo.ret))
            raise ProtocolException("军团没有军团战")

    def MSG_C2S_GVG_GetMatchInfo(self,match_id):
        """
        获取军团战比赛信息
        :param match_id: 比赛id
        :param uid:
        :param sid:
        :return:
        """
        C2S_GVG_GetMatchInfo = cs_pb2.C2S_GVG_GetMatchInfo()
        C2S_GVG_GetMatchInfo.id = match_id
        C2S_GVG_GetMatchInfo = C2S_GVG_GetMatchInfo.SerializeToString()
        C2S_GVG_GetMatchInfo_attr = {'name': "C2S_GVG_GetMatchInfo", 'protocol': 'protobuf-ss',
                                 'send_cmd': 14432, 'recv_cmd': 14433, 'uid': self.uid, 'sid': self.sid}
        senddata = pack_data(C2S_GVG_GetMatchInfo, C2S_GVG_GetMatchInfo_attr)  # 装包，需要学习
        flag, data = send_receive(self.socket, senddata, C2S_GVG_GetMatchInfo_attr, 32)  # 发送协议
        S2C_GVG_GetMatchInfo = cs_pb2.S2C_GVG_GetMatchInfo()  # 创建返回协议对象
        S2C_GVG_GetMatchInfo.ParseFromString(data)  # 解析协议返回值
        if S2C_GVG_GetMatchInfo.is_guild_joined:
            for Info in S2C_GVG_GetMatchInfo.my_match:
                self.G_bisai_id = Info.id
        if S2C_GVG_GetMatchInfo.ret == 1:
            print("军团战比赛信息查询成功")
            if "match_info" in dir(S2C_GVG_GetMatchInfo):
                self.guild_id_list = []
                for guild_list in S2C_GVG_GetMatchInfo.match_info.guilds:
                    for guild in guild_list:
                        self.guild_id_list.append(guild.id)
        else:
            print(str(self.uid) + "军团战比赛信息查询失败" + str(S2C_GVG_GetMatchInfo.ret))
            raise ProtocolException("军团没有军团战比赛信息")




    def MSG_C2S_GVG_Join(self,):
        """
        军团战报名
        :param uid:
        :param sid:
        :return:
        """
        C2S_GVG_Join = cs_pb2.C2S_GVG_Join()
        C2S_GVG_Join = C2S_GVG_Join.SerializeToString()
        C2S_GVG_Join_attr = {'name': "C2S_GVG_Join", 'protocol': 'protobuf-ss',
                                 'send_cmd': 14434, 'recv_cmd': 14435, 'uid': self.uid, 'sid': self.sid}
        senddata = pack_data(C2S_GVG_Join, C2S_GVG_Join_attr)  # 装包，需要学习
        flag, data = send_receive(self.socket, senddata, C2S_GVG_Join_attr, 32)  # 发送协议
        S2C_GVG_Join = cs_pb2.S2C_GVG_Join()  # 创建返回协议对象
        S2C_GVG_Join.ParseFromString(data)  # 解析协议返回值
        if S2C_GVG_Join.ret == 1 and S2C_GVG_Join.is_guild_joined:
            print("军团战报名成功")
        else:
            print(str(self.uid) + "军团战报名失败" + str(S2C_GVG_Join.ret))
            raise ProtocolException("军团战报名失败")

    def MSG_C2S_GVG_GetAchieve(self,):
        """
        获取赛季成就信息
        :param uid:
        :param sid:
        :return:
        """
        C2S_GVG_GetAchieve = cs_pb2.C2S_GVG_GetAchieve()
        C2S_GVG_GetAchieve = C2S_GVG_GetAchieve.SerializeToString()
        C2S_GVG_GetAchieve_attr = {'name': "C2S_GVG_GetAchieve", 'protocol': 'protobuf-ss',
                                 'send_cmd': 14436, 'recv_cmd': 14437, 'uid': self.uid, 'sid': self.sid}
        senddata = pack_data(C2S_GVG_GetAchieve, C2S_GVG_GetAchieve_attr)  # 装包，需要学习
        flag, data = send_receive(self.socket, senddata, C2S_GVG_GetAchieve_attr, 32)  # 发送协议
        S2C_GVG_GetAchieve = cs_pb2.S2C_GVG_GetAchieve()  # 创建返回协议对象
        S2C_GVG_GetAchieve.ParseFromString(data)  # 解析协议返回值
        if S2C_GVG_GetAchieve.ret == 1 :
            print("获取赛季成就信息成功")
        else:
            print(str(self.uid) + "获取赛季成就信息失败" + str(S2C_GVG_GetAchieve.ret))
            raise ProtocolException("获取赛季成就信息失败")

    def MSG_C2S_GVG_GetAchieveAward(self,id):
        """
        领取赛季成就奖励
        :param id:成就ID
        :return:
        """
        C2S_GVG_GetAchieveAward = cs_pb2.C2S_GVG_GetAchieveAward()
        C2S_GVG_GetAchieveAward.id = id
        C2S_GVG_GetAchieveAward = C2S_GVG_GetAchieveAward.SerializeToString()
        C2S_GVG_GetAchieveAward_attr = {'name': "C2S_GVG_GetAchieveAward", 'protocol': 'protobuf-ss',
                                 'send_cmd': 14438, 'recv_cmd': 14439, 'uid': self.uid, 'sid': self.sid}
        senddata = pack_data(C2S_GVG_GetAchieveAward, C2S_GVG_GetAchieveAward_attr)  # 装包，需要学习
        flag, data = send_receive(self.socket, senddata, C2S_GVG_GetAchieveAward_attr, 32)  # 发送协议
        S2C_GVG_GetAchieve = cs_pb2.S2C_GVG_GetAchieve()  # 创建返回协议对象
        S2C_GVG_GetAchieve.ParseFromString(data)  # 解析协议返回值
        if S2C_GVG_GetAchieve.ret == 1 :
            print("获取赛季成就信息成功")
        else:
            print(str(self.uid) + "获取赛季成就信息失败" + str(S2C_GVG_GetAchieve.ret))
            raise ProtocolException("获取赛季成就信息失败")


    def MSG_C2S_GVG_GetKingHistory(self):
        """
        获取历代王者
        :param uid:
        :param sid:
        :return:
        """
        C2S_GVG_GetKingHistory = cs_pb2.C2S_GVG_GetKingHistory()
        C2S_GVG_GetKingHistory = C2S_GVG_GetKingHistory.SerializeToString()
        C2S_GVG_GetKingHistory_attr = {'name': "C2S_GVG_GetKingHistory", 'protocol': 'protobuf-ss',
                                 'send_cmd': 14438, 'recv_cmd': 14439, 'uid': self.uid, 'sid': self.sid}
        senddata = pack_data(C2S_GVG_GetKingHistory, C2S_GVG_GetKingHistory_attr)  # 装包，需要学习
        flag, data = send_receive(self.socket, senddata, C2S_GVG_GetKingHistory_attr, 32)  # 发送协议
        S2C_GVG_GetKingHistory = cs_pb2.S2C_GVG_GetKingHistory()  # 创建返回协议对象
        S2C_GVG_GetKingHistory.ParseFromString(data)  # 解析协议返回值
        if S2C_GVG_GetKingHistory.ret == 1 :
            print("军团战-获取历代王者成功")
        else:
            print(str(self.uid) + "军团战-获取历代王者失败" + str(S2C_GVG_GetKingHistory.ret))
            raise ProtocolException("军团战-获取历代王者失败")

    def MSG_C2S_GVG_EnterMatch(self,):
        """
        军团战进入比赛
        :param uid:
        :param sid:
        :return:
        """
        C2S_GVG_EnterMatch = cs_pb2.C2S_GVG_EnterMatch()
        C2S_GVG_EnterMatch = C2S_GVG_EnterMatch.SerializeToString()
        C2S_GVG_EnterMatch_attr = {'name': "C2S_GVG_EnterMatch", 'protocol': 'protobuf-ss',
                                 'send_cmd': 14442, 'recv_cmd': [14443,14444], 'uid': self.uid, 'sid': self.sid}
        senddata = pack_data(C2S_GVG_EnterMatch, C2S_GVG_EnterMatch_attr)  # 装包，需要学习
        flag, data = send_receive(self.socket, senddata, C2S_GVG_EnterMatch_attr, 32)  # 发送协议
        S2C_GVG_EnterMatch = cs_pb2.S2C_GVG_EnterMatch()  # 创建返回协议对象
        S2C_GVG_EnterMatch.ParseFromString(data[14443])  # 解析协议返回值
        if S2C_GVG_EnterMatch.ret == 1 :
            print("军团战进入比赛成功")
        else:
            print(str(self.uid) + "军团战进入比赛失败" + str(S2C_GVG_EnterMatch.ret))
            raise ProtocolException("军团战进入比赛失败")
        for Info in S2C_GVG_EnterMatch.info:
            if self.G_bisai_id != Info.id:
                raise ProtocolException("军团战ID和报名的ID不一致")
        guild_index_dic = {}
        for guild_list in S2C_GVG_EnterMatch.guilds:# 公会列表
            guild_num_str = str(guild_list.guild.id)
            guild_index = guild_list.index
            guild_index_dic[guild_num_str] = [guild_index]#军团ID当key
        match_user_dic={}
        for user_list in S2C_GVG_EnterMatch.users: # 比赛中的玩家列表
            match_user_dic[str(user_list.user.id)] = user_list.user.guild_id


        gate_num = 1
        gate_dic={}
        for gate_list in S2C_GVG_EnterMatch.gates: # 城门
            gate_num_str = str(gate_num)
            grid_id = gate_list.grid_id
            hp = gate_list.hp
            gate_dic[gate_num_str] = [grid_id,hp]
            gate_num = gate_num+1
        buff_num = 1
        buff_dic={}
        for buff_list in S2C_GVG_EnterMatch.buffs: # BUFF点
            buff_num_str = str(buff_num)
            grid_id = buff_list.grid_id
            buff_id = buff_list.buff_id
            end_time= buff_list.end_time
            buff_dic[buff_num_str] = [grid_id,buff_id,end_time]
            buff_num = buff_num+1
        tower_num = 1
        tower_dic={}
        for tower_list in S2C_GVG_EnterMatch.towers:# 炮台
            tower_num_str = str(tower_num)
            grid_id = tower_list.grid_id
            guild_id = tower_list.guild_id
            tower_dic[tower_num_str] = [grid_id,guild_id]
            tower_num = tower_num+1
        S2C_GVG_NotifyUserEnter = cs_pb2.S2C_GVG_NotifyUserEnter()  # 创建返回协议对象
        S2C_GVG_NotifyUserEnter.ParseFromString(data[14444])
        S2C_GVG_NotifyUserEnter.user



    def MSG_C2S_GVG_Revive(self,):
        """
        军团战-玩家复活
        :param uid:
        :param sid:
        :return:
        """
        C2S_GVG_Revive = cs_pb2.C2S_GVG_Revive()
        C2S_GVG_Revive = C2S_GVG_Revive.SerializeToString()
        C2S_GVG_Revive_attr = {'name': "C2S_GVG_Revive", 'protocol': 'protobuf-ss',
                                 'send_cmd': 14457, 'recv_cmd': [14458,14459], 'uid': self.uid, 'sid': self.sid}
        senddata = pack_data(C2S_GVG_Revive, C2S_GVG_Revive_attr)  # 装包，需要学习
        flag, data = send_receive(self.socket, senddata, C2S_GVG_Revive_attr, 32)  # 发送协议
        S2C_GVG_Revive = cs_pb2.S2C_GVG_Revive()  # 创建返回协议对象
        S2C_GVG_Revive.ParseFromString(data[14458])  # 解析协议返回值
        if S2C_GVG_Revive.ret == 1 :
            print("军团战-玩家复活成功")
        else:
            print(str(self.uid) + "军团战-玩家复活失败" + str(S2C_GVG_Revive.ret))
            raise ProtocolException("军团战-玩家复活失败")
        S2C_GVG_NotifyRevive = cs_pb2.S2C_GVG_NotifyRevive()  # 创建返回协议对象
        S2C_GVG_NotifyRevive.ParseFromString(data[14459])  # 解析协议返回值
        S2C_GVG_NotifyRevive.user_id#复活玩家id

    def MSG_C2S_GVG_AttackUser(self,user_id):
        """
        军团战-攻击玩家
        :param uid:
        :param sid:
        :return:
        """
        C2S_GVG_AttackUser = cs_pb2.C2S_GVG_AttackUser()
        C2S_GVG_AttackUser.user_id  = user_id
        C2S_GVG_AttackUser = C2S_GVG_AttackUser.SerializeToString()
        C2S_GVG_AttackUser_attr = {'name': "C2S_GVG_AttackUser", 'protocol': 'protobuf-ss',
                                 'send_cmd': 14451, 'recv_cmd': [14452,14453], 'uid': self.uid, 'sid': self.sid}
        senddata = pack_data(C2S_GVG_AttackUser, C2S_GVG_AttackUser_attr)  # 装包，需要学习
        flag, data = send_receive(self.socket, senddata, C2S_GVG_AttackUser_attr, 32)  # 发送协议
        S2C_GVG_Revive = cs_pb2.S2C_GVG_Revive()  # 创建返回协议对象
        S2C_GVG_Revive.ParseFromString(data[14452])  # 解析协议返回值
        if S2C_GVG_Revive.ret == 1 :
            print("军团战-攻击玩家成功")
        else:
            print(str(self.uid) + "军团战-攻击玩家失败" + str(S2C_GVG_Revive.ret))
            raise ProtocolException("军团战-攻击玩家失败")
        S2C_GVG_NotifyAttackUser = cs_pb2.S2C_GVG_NotifyAttackUser()  # 创建返回协议对象
        S2C_GVG_NotifyAttackUser.ParseFromString(data[14453])  # 解析协议返回值
        # todo 根据功能选取参数
        S2C_GVG_NotifyAttackUser.attacker_user_id # 攻击方玩家ID
        S2C_GVG_NotifyAttackUser.attacker_score # 攻击方当前积分
        S2C_GVG_NotifyAttackUser.attacker_power # 攻击方当前兵力
        S2C_GVG_NotifyAttackUser.attacker_cont_kill_num# 连续杀人数
        S2C_GVG_NotifyAttackUser.defender_user_id # 被攻击方玩家ID
        S2C_GVG_NotifyAttackUser.defender_score # 被攻击方当前积分
        S2C_GVG_NotifyAttackUser.defender_power # 被攻击方当前兵力
        S2C_GVG_NotifyAttackUser.defender_cont_kill_num # 被攻击方连续杀人数
        S2C_GVG_NotifyAttackUser.attacker_protect_end_time # 如果是攻占炮台占领位，则返回保护到期时间
        S2C_GVG_NotifyAttackUser.owner_guild_id # 如果是炮台占领区占领军团，则返回当前占领者


    def MSG_C2S_GVG_AttackGate(self):
        """
        军团战-攻击城门
        :param uid:
        :param sid:
        :return:
        """
        C2S_GVG_AttackGate = cs_pb2.C2S_GVG_AttackGate()
        C2S_GVG_AttackGate = C2S_GVG_AttackGate.SerializeToString()
        C2S_GVG_AttackGate_attr = {'name': "C2S_GVG_AttackGate", 'protocol': 'protobuf-ss',
                                 'send_cmd': 14454, 'recv_cmd': [14455,14456], 'uid': self.uid, 'sid': self.sid}
        senddata = pack_data(C2S_GVG_AttackGate, C2S_GVG_AttackGate_attr)  # 装包，需要学习
        flag, data = send_receive(self.socket, senddata, C2S_GVG_AttackGate_attr, 32)  # 发送协议
        S2C_GVG_AttackGate = cs_pb2.S2C_GVG_AttackGate()  # 创建返回协议对象
        S2C_GVG_AttackGate.ParseFromString(data[14455])  # 解析协议返回值
        if S2C_GVG_AttackGate.ret == 1 :
            print("军团战-攻击城门成功")
        else:
            print(str(self.uid) + "军团战-攻击城门失败" + str(S2C_GVG_AttackGate.ret))
            raise ProtocolException("军团战-攻击城门失败")
        S2C_GVG_NotifyAttackGate = cs_pb2.S2C_GVG_NotifyAttackGate()  # 创建返回协议对象
        S2C_GVG_NotifyAttackGate.ParseFromString(data[14456])  # 解析协议返回值
        # todo 根据功能选取参数
        S2C_GVG_NotifyAttackGate.user_id # 玩家ID
        S2C_GVG_NotifyAttackGate.score # 当前积分
        S2C_GVG_NotifyAttackGate.gate_grid_id# 城门格子ID
        S2C_GVG_NotifyAttackGate.gate_hp # 城门当前耐久


    def MSG_C2S_GVG_Move(self,target_pos_id):
        """
        军团战-玩家移动
        :param uid:
        :param sid:
        :return:
        """
        C2S_GVG_Move = cs_pb2.C2S_GVG_Move()
        C2S_GVG_Move.target_pos_id = target_pos_id
        C2S_GVG_Move.cost_time = 0
        C2S_GVG_Move = C2S_GVG_Move.SerializeToString()
        C2S_GVG_Move_attr = {'name': "C2S_GVG_Move", 'protocol': 'protobuf-ss',
                                 'send_cmd': 14448, 'recv_cmd': [14449,14450], 'uid': self.uid, 'sid': self.sid}
        senddata = pack_data(C2S_GVG_Move, C2S_GVG_Move_attr)  # 装包，需要学习
        flag, data = send_receive(self.socket, senddata, C2S_GVG_Move_attr, 32)  # 发送协议
        S2C_GVG_Move = cs_pb2.S2C_GVG_Move()  # 创建返回协议对象
        S2C_GVG_Move.ParseFromString(data[14449])  # 解析协议返回值
        if S2C_GVG_Move.ret == 1 :
            print("军团战-玩家移动成功")
        else:
            print(str(self.uid) + "军团战-玩家移动失败" + str(S2C_GVG_Move.ret))
            raise ProtocolException("军团战-玩家移动失败")
        S2C_GVG_NotifyMove = cs_pb2.S2C_GVG_NotifyMove()  # 创建返回协议对象
        S2C_GVG_NotifyMove.ParseFromString(data[14450])  # 解析协议返回值
        S2C_GVG_NotifyMove.user_id # 玩家ID
        S2C_GVG_NotifyMove.pos_id # 目标位置
        S2C_GVG_NotifyMove.arrive_time # 到达时间    无此值时表示立即到达
        S2C_GVG_NotifyMove.owner_guild_id # 炮塔拥有者是发生变更时，返回当前炮台占领的军团
        S2C_GVG_NotifyMove.protect_end_time # 如果是站上炮台占领位，则返回保护到期时间

    def MSG_C2S_GVG_LeaveMatch(self, ):
        """
        离开比赛
        :param Guild_name: string 军团名字
        :param uid:
        :param sid:
        :return:
        """
        C2S_GVG_LeaveMatch = cs_pb2.C2S_GVG_LeaveMatch()
        C2S_GVG_LeaveMatch = C2S_GVG_LeaveMatch.SerializeToString()
        C2S_GVG_LeaveMatch_attr = {'name': "C2S_GVG_LeaveMatch", 'protocol': 'protobuf-ss',
                               'send_cmd': 14445, 'recv_cmd': [14446,14447], 'uid': self.uid, 'sid': self.sid}
        senddata = pack_data(C2S_GVG_LeaveMatch, C2S_GVG_LeaveMatch_attr)  # 装包，需要学习
        flag, data = send_receive(self.socket, senddata, C2S_GVG_LeaveMatch_attr, 32)  # 发送协议
        S2C_GVG_LeaveMatch = cs_pb2.S2C_GVG_LeaveMatch()  # 创建返回协议对象
        S2C_GVG_LeaveMatch.ParseFromString(data[14446])  # 解析协议返回值
        if S2C_GVG_LeaveMatch.ret == 1 :
            print("军团战-离开比赛成功")
        else:
            print(str(self.uid) + "军团战-离开比赛失败" + str(S2C_GVG_LeaveMatch.ret))
            raise ProtocolException("军团战-离开比赛失败")
        S2C_GVG_NotifyUserLeave = cs_pb2.S2C_GVG_NotifyUserLeave()  # 创建返回协议对象
        S2C_GVG_NotifyUserLeave.ParseFromString(data[14447])
        S2C_GVG_NotifyUserLeave.user_id #离开的玩家ID

    def MSG_C2S_GVG_AddBuff(self,):
        """
        获取Buff
        :param uid:
        :param sid:
        :return:
        """
        C2S_GVG_AddBuff = cs_pb2.C2S_GVG_AddBuff()
        C2S_GVG_AddBuff = C2S_GVG_AddBuff.SerializeToString()
        C2S_GVG_AddBuff_attr = {'name': "C2S_GVG_AddBuff", 'protocol': 'protobuf-ss',
                                 'send_cmd': 14460, 'recv_cmd': [14461,14462,14463], 'uid': self.uid, 'sid': self.sid}
        senddata = pack_data(C2S_GVG_AddBuff, C2S_GVG_AddBuff_attr)  # 装包，需要学习
        flag, data = send_receive(self.socket, senddata, C2S_GVG_AddBuff_attr, 32)  # 发送协议
        S2C_GVG_AddBuff = cs_pb2.S2C_GVG_AddBuff()  # 创建返回协议对象
        S2C_GVG_AddBuff.ParseFromString(data[14461])  # 解析协议返回值
        if S2C_GVG_AddBuff.ret == 1 :
            print("军团战-玩家复活成功")
        else:
            print(str(self.uid) + "军团战-玩家复活失败" + str(S2C_GVG_AddBuff.ret))
            raise ProtocolException("军团战-玩家复活失败")
        S2C_GVG_NotifyAddBuff = cs_pb2.S2C_GVG_NotifyAddBuff()  # 创建返回协议对象
        S2C_GVG_NotifyAddBuff.ParseFromString(data[14462])  # 解析协议返回值
        S2C_GVG_NotifyRemoveBuff = cs_pb2.S2C_GVG_NotifyRemoveBuff()  # 创建返回协议对象
        S2C_GVG_NotifyRemoveBuff.ParseFromString(data[14463])  # 解析协议返回值
        # S2C_GVG_NotifyNewBuff = cs_pb2.S2C_GVG_NotifyNewBuff()  
        # S2C_GVG_NotifyNewBuff.ParseFromString(data[14464])

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
        C2S_Test = cs_pb2.C2S_Test()
        award = C2S_Test.awards.add()
        award.type = type_into
        award.value = value_into
        award.size = size_into
        C2S_Test = C2S_Test.SerializeToString()
        C2S_Test_attr = {'name': "C2S_Test", 'protocol': 'protobuf-ss', 'send_cmd': 10140, 'recv_cmd': 10141,
                         'uid': self.uid, 'sid': self.sid}
        senddata = pack_data(C2S_Test, C2S_Test_attr)  # 装包，需要学习
        flag, data = send_receive(self.socket, senddata, C2S_Test_attr, 32)  # 发送协议
        S2C_Test = cs_pb2.S2C_Test()  # 创建返回协议对象
        S2C_Test.ParseFromString(data)  # 解析协议返回值
        if S2C_Test.ret == 1:
            print("添加道具成功")
        else:
            raise ProtocolException(str(self.uid) + "添加道具失败" + str(S2C_Test.ret))

    def set_checkpoint(self):
        url = "http://gmapi.qa.ngame2.youzu.com/api/gm/checkpoint"
        data = {"account": self.username, "role_id": self.uid, "server": self.server_id, "function": "1", "checkpoint": 53640}
        requests.request("POST", url, data=data)
        print("设置关卡进度成功")


    def Login(self, ):
        """
        登录协议
        :param region: 用来确定是登陆国内还是海外
        :return: 角色ID和服务器时间
        """
        flag, data = self.MSG_C2G_Login()
        G2C_Login = cg_pb2.G2C_Login()
        G2C_Login.ParseFromString(data)
        print("账号登录成功,账号为" + str(self.username), G2C_Login)
        # 如果ret等于3则需要创角协议
        self.uid = G2C_Login.uid
        self.sid = G2C_Login.sid
        if G2C_Login.ret == 5:
            raise GmException("重复登录,创建角色失败" + str(self.username))
        elif G2C_Login.ret == 3:
            print("新账号，开始创建角色")
            flag_Create, data_Create = self.MSG_C2G_Create(0, G2C_Login.sid)
            G2C_Create = cg_pb2.G2C_Create()
            G2C_Create.ParseFromString(data_Create)

            if G2C_Create.ret == 1:
                msg = "角色创建成功，账号：" + self.username + "，区服id：" + str(
                    self.server_id) + "，角色名：" + self.username + "，UID：" + str(G2C_Create.uid)
                print(msg)
                self.uid = G2C_Create.uid
                self.add_resource_pb(1,1,9999999)#角色经验
                self.add_resource_pb(1,2, 99999)#贵族经验
                self.add_resource_pb(999,0, 99999)#元宝
            else:
                raise GmException("创建角色失败" + str(G2C_Create.uid))
        elif G2C_Login.ret == 2:
            raise GameServerStopException("服务器维护中,创建账号失败")
        self.set_checkpoint()



if __name__ == '__main__':
    server_id_dic = {"QA1":1652440001,"QA2":1652440002,"QA3":1652440003,"QA4":1652440004,"QA6":1652440006,"QA7":1652440007,}
    lg = LoginGame(server_id_dic["QA1"])
    lg.Login()
    lg.MSG_C2S_Guild_Search("a2asf")#创建或加入军团
    #报名
    lg.MSG_C2S_GVG_Join()
    #进入战斗
    lg.MSG_C2S_GVG_EnterMatch()
    #移动
    #玩家战斗，抢炮台
    #领取buff
    #打城门
    # lg.MSG_C2S_GVG_GetInfo()  # 获取军团战信息
    # lg.MSG_C2S_GVG_GetMatchInfo(match_id)  # 获取军团战比赛信息
    # lg.MSG_C2S_GVG_Join()  # 参战
    # lg.MSG_C2S_GVG_GetAchieve()  # 获取赛季成就信息
    # lg.MSG_C2S_GVG_GetAchieveAward(achieve_id)  # 领取赛季成就奖励
    # lg.MSG_C2S_GVG_GetKingHistory()  # 获取历代王者
    # lg.MSG_C2S_GVG_EnterMatch()  # 进入比赛
    # lg.MSG_C2S_GVG_LeaveMatch()  # 离开比赛
    # lg.MSG_C2S_GVG_Move(target_pos_id)  # 玩家移动
    # lg.MSG_C2S_GVG_AttackUser(user_id)  # 攻击玩家
    # lg.MSG_C2S_GVG_AttackGate()  # 攻击城门
    # lg.MSG_C2S_GVG_Revive()  # 复活
    # lg.MSG_C2S_GVG_AddBuff()  # 获取Buff
