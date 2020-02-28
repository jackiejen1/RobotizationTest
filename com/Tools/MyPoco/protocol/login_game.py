# _*_coding:utf-8 _*_
#!/usr/bin/python3
#Reference:********************************
# encoding: utf-8
#@Time: 2020/2/28  18:24
#@Author: 洞洞
#@File: login_game.py
#@Function:
#@Method:
#Reference:********************************
from MyPoco.protocol_file import cs_pb2, cg_pb2, out_base_pb2
from MyPoco.protocol.packdata import pack_data
from MyPoco.protocol.sendrecvpub import send_receive, recv_data
import hashlib, json, base64
# from locust.exception import StopLocust
import random
from MyPoco.foundation.information import Information
class LoginGame:
    def __init__(self,socket):
        self.info = Information()
        self.username = None
        self.server_name=None
        self.socket = socket
        self.server_id = self.info.get_config("com.youzu.test.qa",self.server_name)
    def MSG_C2G_Login(self,socket):
        v = {}
        v["account_system_id"] = "1_"
        v["osdk_game_id"] = "196377847"
        v["user_id"] = self.username
        v["time"] = "123"
        v["osdk_user_id"] = "1_" +self.username
        v["extend"] = "1|1|1"
        v["channel_id"] = "1"
        key = "EXNhCfHaunHNzMG80qyjcOBUuXAnVeTU"
        print("t.username---------->", self.username)
        string = "account_system_id=1_&channel_id=1&extend=1|1|1&osdk_game_id=196377847&osdk_user_id=1_" + self.username + "&time=123&user_id=" + t.username + key
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
        flag, data = send_receive(socket, senddata, C2G_Login_attr, 32)
        return flag, data

    # 创建角色
    def MSG_C2G_Create(self):
        C2G_Create = cg_pb2.C2G_Create()
        C2G_Create.name = str(self.username)
        C2G_Create.type = 210000
        uid = self.info.get_config("ProtocolArgs","uid")
        sid = self.info.get_config("ProtocolArgs","sid")
        print(sid)
        C2G_Create.server_id = self.server_id
        C2G_Create = C2G_Create.SerializeToString()
        C2G_Create_attr = {'name': "C2G_Create", 'protocol': 'protobuf-ss', 'send_cmd': 10004, 'recv_cmd': 10005,
                           'uid': uid, 'sid': sid}
        senddata = pack_data(C2G_Create, C2G_Create_attr)
        flag, data = send_receive(self.socket, senddata, C2G_Create_attr, 32)
        return flag, data
