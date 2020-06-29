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

from MyPoco.protocol_file import cs_pb2, cg_pb2, out_base_pb2
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
                          'uid': 0,
                          'sid': 0}
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
        C2S_SyncTime = cs_pb2.C2S_SyncTime()  # 创建发送协议对象
        C2S_SyncTime.client_time = int(time.time())  # 参数赋值
        C2S_SyncTime = C2S_SyncTime.SerializeToString()  # 序列化
        C2S_SyncTime_attr = {'name': "C2S_SyncTime", 'protocol': 'protobuf-ss', 'send_cmd': 10145, 'recv_cmd': 10146,
                             'uid': uid, 'sid': sid}
        senddata = pack_data(C2S_SyncTime, C2S_SyncTime_attr)  # 装包，需要学习
        flag, data = send_receive(self.socket, senddata, C2S_SyncTime_attr, 32)  # 发送协议
        return flag, data

    def MSG_C2S_Flush(self, uid, sid,recv_cmd_id):
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
                          'recv_cmd': int(recv_cmd_id),'uid': uid, 'sid': sid}
        senddata = pack_data(C2S_Flush, C2S_Flush_attr)  # 装包，需要学习
        flag, data = send_receive(self.socket, senddata, C2S_Flush_attr, 32)  # 发送协议
        return flag, data

    def MSG_C2S_Formation_ChangeFormation(self, tp, pos, id, uid, sid):
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
