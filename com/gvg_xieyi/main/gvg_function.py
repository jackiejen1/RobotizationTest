# _*_coding:utf-8 _*_
# !/usr/bin/python3
# Reference:********************************
# encoding: utf-8
# @Time: 2020/9/3  11:35
# @Author: 洞洞
# @File: gvg_function.py
# @Function:
# @Method:
# Reference:********************************
import datetime
import struct
import time
import requests
from com.gvg_xieyi.proto import cs_pb2, cg_pb2, bs_pb2, out_base_pb2
import hashlib, json, base64
from com.gvg_xieyi.tools.MyException import *
from socket import create_connection
from locust import HttpLocust, TaskSet, task, seq_task, TaskSequence, Locust


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
        self.waiting_for_you_list = [14444, 14447, 14464]
        self.guild_index_dic = {}  # 军团id，比赛中的索引
        self.match_user_dic = {}  # 记录在场所有人员的UI和所有user信息
        self.gate_dic = {}  # 城门位置id  hp
        self.go_gate_dic = {}  # 城门位置id和可攻击位置id
        self.buff_dic = {}  # buff点位置[buff_id，消失时间]
        self.tower_dic = {}  # 炮台位置id,军团id
        self.go_tower_dic = {}  # 炮台位置id{可攻击位置id 占领区id 占领区玩家id}todo 炮台有三个区域 移动和战斗需要更新炮台的数据
        self.G_bisai_id = 0  # 军团战比赛ID
        self.achieve_id_list = []  # 成就id列表
        self.NotifyMove_id = 0 #移动推送ID，用来区别重复消息，减少更新信息频率
        self.NotifyAttackUser_id = 0#攻击推送ID，用来区别重复消息，减少更新信息频率
        self.NotifyAttackGate_id= 0#攻击城门推送ID，用来区别重复消息，减少更新信息频率
        self.NotifyRevive_id =0#复活推送ID，用来区别重复消息，减少更新信息频率
        self.fuhuo_cd = 0#复活CD todo 需要改表
        self.move_cd = 0#移动CD todo 需要改表

    def send_receive(self, socketdata, api_attr, headsize, norecv=False, limitime=40):
        """
        发送并接收socket数据，并返回给调用函数
        :param sock: 使用的socket
        :param socketdata: 要发送的数据，已经pack好的数据
        :param api_attr: 属性参数字典
        :param headsize: 数据包大小
        :param norecv: 是否需要接收返回，不需要接收返回时，发送完数据后就直接返回，发送的标志和 b'norecv'
        :param limitime: 发送与接收timeout时长
        :return: 发送或者接收标志 ，接收到的数据或者 b'norecv' b'error'
        """
        workname = api_attr['name']
        print("当前发送接口:--{}".format(workname))
        flag = True
        try:
            self.socket.send(socketdata)  # 发送数据
        except Exception:
            flag = False
        if not flag:
            return flag, b'error'
        else:
            print("send data success")
        if norecv:  # 是否需要接受数据，默认接收
            return flag, b'norecv'
        receive_data, recv_time = self.recv_data(api_attr, headsize, limitime)  # 开始接收数据
        if receive_data != b'error':
            flag = True
        else:
            flag = False
        return flag, receive_data

    def recv_data(self, api_attr, buffersize, limittime):
        # 不同的游戏可以自行修改此接收数据的处理方法，以实现不同的游戏规则
        """
            接收socket上的数据，使用了超时设置
            :param s: 接收数据使用的socket
            :param api_attr: 接口属性字典
            :param buffersize: 数据包头大小
            :param limitime: 接收超时时长
            :return: 接收标志与接收到的数据，出错时返回的数据为 b'error'
            """
        recvcmd = api_attr['recv_cmd']  # 确定需要接收的协议ID
        recvdata_dic = {}
        then_len = 0
        print("当前接收接口:--{} cmd: {}".format(api_attr['name'], recvcmd))
        rst = int(time.time())
        self.socket.settimeout(limittime)  # 设置超时时间
        while True:  # 这里是一直接收数据的，只要有消息，就一直接收
            try:
                ct = int(time.time())
                # 规定时间内没有收到想要的包就退出
                if ct - rst > limittime:
                    recvtime = time.time()
                    recvdata = b'error'
                    print("等了很久都没有等到想要的")
                    return recvdata, recvtime
                rev_data = self.socket.recv(buffersize)  # 第一次接收数据，只获取消息头，消息头包含数据体的长度和协议编号
                if len(rev_data) == 0:
                    print(str(api_attr['uid']) + ":error,消息头长度为0")
                    raise Exception("消息头长度为0")
                    # data = b'error'
                    # recv_time = time.time()
                    # return data, recv_time
                if len(rev_data) < buffersize:  # 服务端拆包发送，第一条不是完整数据，包头长度会不够
                    rev_data = rev_data + self.socket.recv(buffersize - len(rev_data))
                head_data = struct.unpack('>IIQQQ', rev_data)  # 把消息头解包
                # 通过消息头数据，计算出消息体的长度
                data_len = head_data[0] - 32
                tmpdata = self.socket.recv(data_len)  # 接收后续的消息体
                while (len(tmpdata) < data_len):  # 一次没收完，就继续收
                    tmpdata += self.socket.recv(data_len - len(tmpdata))
                # 收完完整的一条后进行校验
                recvtime = time.time()
                if len(self.waiting_for_you_list) >= 1:
                    for recv_id in self.waiting_for_you_list:
                        if head_data[1] == recv_id:
                            self.waiting_for_you(recv_id, tmpdata)
                if isinstance(recvcmd, list):
                    # 需要多条返回协议的处理
                    for rec in recvcmd:
                        if head_data[1] == rec:  # 这里对返回数据进行校验，只返回要求协议ID的数据
                            recvtime = time.time()
                            recvdata = tmpdata
                            recvdata_dic[str(rec)] = recvdata
                            then_len = then_len + 1
                    if then_len == len(recvcmd):
                        return recvdata_dic, recvtime
                else:
                    if head_data[1] == recvcmd:  # 这里对返回数据进行校验，只返回要求协议ID的数据
                        recvtime = time.time()
                        recvdata = tmpdata
                        return recvdata, recvtime
                # 如果不是指定的协议，就继续接收下一条协议内容
            except Exception as e:
                print("socket接收数据时发生错误")
                print("error,具体错误 {}".format(e))
                print("战斗协议的话可能是无需战斗造成的")
                recvtime = time.time()
                recvdata = b'error'
                return recvdata, recvtime

    def pack_data(self, data, api_attr):
        """
        消息体拼接函数，根据项目组装包头
        :param data: pb协议对象，消息体
        :param api_attr:
        :return:
        """
        msg_data_str = data
        pack_length = len(msg_data_str) + 32  # 32 是包头长度
        cmd = api_attr['send_cmd']  # 发包协议ID号
        uid = api_attr['uid']
        sid = api_attr['sid']
        cid = 0
        head_data = struct.pack(">IIQQQ", pack_length, cmd, uid, sid, cid)  # 把包头需要的信息转成bytes
        # IIQQQ表示根据什么规则去把python的类型转换成c的类型
        # >大端小端，内存对其？设备位数？
        msg_data_str = head_data + msg_data_str  # 把包头和包体拼接
        return msg_data_str

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
        senddata = self.pack_data(C2G_Login, C2G_Login_attr)
        flag, data = self.send_receive(senddata, C2G_Login_attr, 32)
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
        senddata = self.pack_data(C2G_Create, C2G_Create_attr)
        flag, data = self.send_receive(senddata, C2G_Create_attr, 32)
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
        C2S_Chat.channel = 1  # 世界频道
        C2S_Chat.content = "/set_guild_level 9"
        C2S_Chat = C2S_Chat.SerializeToString()
        C2S_Chat_attr = {'name': "C2S_Chat", 'protocol': 'protobuf-ss',
                         'send_cmd': 10142, 'recv_cmd': 10143, 'uid': self.uid, 'sid': self.sid}
        senddata = self.pack_data(C2S_Chat, C2S_Chat_attr)  # 装包，需要学习
        flag, data = self.send_receive(senddata, C2S_Chat_attr, 32)  # 发送协议
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
        if len(Guild_name) > 8:
            print("军团名字过长")
            return ""
        C2S_Guild_Search = cs_pb2.C2S_Guild_Search()
        C2S_Guild_Search.key = Guild_name
        C2S_Guild_Search = C2S_Guild_Search.SerializeToString()
        C2S_Guild_Search_attr = {'name': "C2S_Guild_Search", 'protocol': 'protobuf-ss',
                                 'send_cmd': 11002, 'recv_cmd': 11003, 'uid': self.uid, 'sid': self.sid}
        senddata = self.pack_data(C2S_Guild_Search, C2S_Guild_Search_attr)  # 装包，需要学习
        flag, data = self.send_receive(senddata, C2S_Guild_Search_attr, 32)  # 发送协议
        S2C_Guild_Search = cs_pb2.S2C_Guild_Search()  # 创建返回协议对象
        S2C_Guild_Search.ParseFromString(data)  # 解析协议返回值
        if S2C_Guild_Search.ret == 1:
            print("查询成功")
            for guild in S2C_Guild_Search.guilds:
                self.self_guild_id = guild.id
                member_num = guild.member_num
                print(member_num)
                if member_num >= 48:
                    raise ProtocolException("军团人数已满")
        elif S2C_Guild_Search.ret == 87 or S2C_Guild_Search.ret == 104:
            C2S_Guild_Create = cs_pb2.C2S_Guild_Create()
            C2S_Guild_Create.name = Guild_name
            C2S_Guild_Create.icon = 1
            C2S_Guild_Create.confirm = False
            C2S_Guild_Create.level = 1
            C2S_Guild_Create = C2S_Guild_Create.SerializeToString()
            C2S_Guild_Create_attr = {'name': "C2S_Guild_Create", 'protocol': 'protobuf-ss',
                                     'send_cmd': 11006, 'recv_cmd': 11007, 'uid': self.uid, 'sid': self.sid}
            senddata = self.pack_data(C2S_Guild_Create, C2S_Guild_Create_attr)  # 装包，需要学习
            flag, data = self.send_receive(senddata, C2S_Guild_Create_attr, 32)  # 发送协议
            S2C_Guild_Create = cs_pb2.S2C_Guild_Create()  # 创建返回协议对象
            S2C_Guild_Create.ParseFromString(data)  # 解析协议返回值
            if S2C_Guild_Create.ret == 1:
                print("创建军团成功")
                C2S_Chat = cs_pb2.C2S_Chat()
                C2S_Chat.channel = 1  # 世界频道
                C2S_Chat.content = "/set_guild_level 10"
                C2S_Chat = C2S_Chat.SerializeToString()
                C2S_Chat_attr = {'name': "C2S_Chat", 'protocol': 'protobuf-ss',
                                 'send_cmd': 10142, 'recv_cmd': 10143, 'uid': self.uid, 'sid': self.sid}
                senddata = self.pack_data(C2S_Chat, C2S_Chat_attr)  # 装包，需要学习
                self.send_receive(senddata, C2S_Chat_attr, 32, norecv=True)  # 发送协议
                print("军团等级设置完毕")
                self.self_guild_id = S2C_Guild_Create.guild.id
                return ""
            else:
                raise ProtocolException(str(self.uid) + "创建军团失败" + str(S2C_Guild_Create.ret))
        else:
            raise ProtocolException(str(self.uid) + "创建军团失败" + str(S2C_Guild_Search.ret))
        C2S_Guild_ReqJoin = cs_pb2.C2S_Guild_ReqJoin()
        C2S_Guild_ReqJoin.guild_id = self.self_guild_id
        C2S_Guild_Search = C2S_Guild_ReqJoin.SerializeToString()
        C2S_Guild_Search_attr = {'name': "C2S_Guild_ReqJoin", 'protocol': 'protobuf-ss',
                                 'send_cmd': 11008, 'recv_cmd': 11009, 'uid': self.uid, 'sid': self.sid}
        senddata = self.pack_data(C2S_Guild_Search, C2S_Guild_Search_attr)  # 装包，需要学习
        flag, data = self.send_receive(senddata, C2S_Guild_Search_attr, 32)  # 发送协议
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
        senddata = self.pack_data(C2S_Guild_Quit, C2S_Guild_Quit_attr)  # 装包，需要学习
        self.send_receive(senddata, C2S_Guild_Quit_attr, 32, norecv=True)  # 发送协议

    def MSG_C2S_GVG_GetInfo(self, ):
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
        senddata = self.pack_data(C2S_GVG_GetInfo, C2S_GVG_GetInfo_attr)  # 装包，需要学习
        flag, data = self.send_receive(senddata, C2S_GVG_GetInfo_attr, 32)  # 发送协议
        S2C_GVG_GetInfo = cs_pb2.S2C_GVG_GetInfo()  # 创建返回协议对象
        S2C_GVG_GetInfo.ParseFromString(data)  # 解析协议返回值
        if "is_guild_joined" in dir(S2C_GVG_GetInfo):
            if "my_match" in dir(S2C_GVG_GetInfo) and S2C_GVG_GetInfo.is_guild_joined:
                self.G_bisai_id = S2C_GVG_GetInfo.my_match.id
        if S2C_GVG_GetInfo.ret == 1:
            print("军团战信息查询成功")
        else:
            print(str(self.uid) + "军团战信息查询失败" + str(S2C_GVG_GetInfo.ret))
            raise ProtocolException("军团没有军团战")

    def MSG_C2S_GVG_GetMatchInfo(self):
        """
        获取军团战比赛信息
        :param match_id: 比赛id
        :param uid:
        :param sid:
        :return:
        """
        C2S_GVG_GetMatchInfo = cs_pb2.C2S_GVG_GetMatchInfo()
        C2S_GVG_GetMatchInfo.id = self.G_bisai_id
        C2S_GVG_GetMatchInfo = C2S_GVG_GetMatchInfo.SerializeToString()
        C2S_GVG_GetMatchInfo_attr = {'name': "C2S_GVG_GetMatchInfo", 'protocol': 'protobuf-ss',
                                     'send_cmd': 14432, 'recv_cmd': 14433, 'uid': self.uid, 'sid': self.sid}
        senddata = self.pack_data(C2S_GVG_GetMatchInfo, C2S_GVG_GetMatchInfo_attr)  # 装包，需要学习
        flag, data = self.send_receive(senddata, C2S_GVG_GetMatchInfo_attr, 32)  # 发送协议
        S2C_GVG_GetMatchInfo = cs_pb2.S2C_GVG_GetMatchInfo()  # 创建返回协议对象
        S2C_GVG_GetMatchInfo.ParseFromString(data)  # 解析协议返回值
        if S2C_GVG_GetMatchInfo.ret == 1:
            print("军团战比赛信息查询成功")
            # MSG_C2S_GVG_EnterMatch 接口以及获取了参战军团信息了
            # if "match_info" in dir(S2C_GVG_GetMatchInfo):
            #     self.guild_id_list = []
            #     for guild_list in S2C_GVG_GetMatchInfo.match_info.guilds:
            #         for guild in guild_list:
            #             self.guild_id_list.append(guild.id)
        else:
            print(str(self.uid) + "军团战比赛信息查询失败" + str(S2C_GVG_GetMatchInfo.ret))
            raise ProtocolException("军团没有军团战比赛信息")

    def MSG_C2S_GVG_Join(self, ):
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
        senddata = self.pack_data(C2S_GVG_Join, C2S_GVG_Join_attr)  # 装包，需要学习
        flag, data = self.send_receive(senddata, C2S_GVG_Join_attr, 32)  # 发送协议
        S2C_GVG_Join = cs_pb2.S2C_GVG_Join()  # 创建返回协议对象
        S2C_GVG_Join.ParseFromString(data)  # 解析协议返回值
        if S2C_GVG_Join.ret == 1 and S2C_GVG_Join.is_guild_joined:
            print("军团战报名成功")
        else:
            print(str(self.uid) + "军团战报名失败" + str(S2C_GVG_Join.ret))
            raise ProtocolException("军团战报名失败")

    def MSG_C2S_GVG_GetAchieve(self, ):
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
        senddata = self.pack_data(C2S_GVG_GetAchieve, C2S_GVG_GetAchieve_attr)  # 装包，需要学习
        flag, data = self.send_receive(senddata, C2S_GVG_GetAchieve_attr, 32)  # 发送协议
        S2C_GVG_GetAchieve = cs_pb2.S2C_GVG_GetAchieve()  # 创建返回协议对象
        S2C_GVG_GetAchieve.ParseFromString(data)  # 解析协议返回值
        if S2C_GVG_GetAchieve.ret == 1:
            print("获取赛季成就信息成功")
            for achieve in S2C_GVG_GetAchieve.achieves:
                if "state" in dir(achieve):
                    if achieve.state == 1:
                        self.achieve_id_list.append(achieve.id)
        else:
            print(str(self.uid) + "获取赛季成就信息失败" + str(S2C_GVG_GetAchieve.ret))
            raise ProtocolException("获取赛季成就信息失败")

    def MSG_C2S_GVG_GetAchieveAward(self, achieve_id):
        """
        领取赛季成就奖励
        :param id:成就ID
        :return:
        """
        C2S_GVG_GetAchieveAward = cs_pb2.C2S_GVG_GetAchieveAward()
        C2S_GVG_GetAchieveAward.id = achieve_id
        C2S_GVG_GetAchieveAward = C2S_GVG_GetAchieveAward.SerializeToString()
        C2S_GVG_GetAchieveAward_attr = {'name': "C2S_GVG_GetAchieveAward", 'protocol': 'protobuf-ss',
                                        'send_cmd': 14438, 'recv_cmd': 14439, 'uid': self.uid, 'sid': self.sid}
        senddata = self.pack_data(C2S_GVG_GetAchieveAward, C2S_GVG_GetAchieveAward_attr)  # 装包，需要学习
        flag, data = self.send_receive(senddata, C2S_GVG_GetAchieveAward_attr, 32)  # 发送协议
        S2C_GVG_GetAchieve = cs_pb2.S2C_GVG_GetAchieve()  # 创建返回协议对象
        S2C_GVG_GetAchieve.ParseFromString(data)  # 解析协议返回值
        if S2C_GVG_GetAchieve.ret == 1:
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
        senddata = self.pack_data(C2S_GVG_GetKingHistory, C2S_GVG_GetKingHistory_attr)  # 装包，需要学习
        flag, data = self.send_receive(senddata, C2S_GVG_GetKingHistory_attr, 32)  # 发送协议
        S2C_GVG_GetKingHistory = cs_pb2.S2C_GVG_GetKingHistory()  # 创建返回协议对象
        S2C_GVG_GetKingHistory.ParseFromString(data)  # 解析协议返回值
        if S2C_GVG_GetKingHistory.ret == 1:
            print("军团战-获取历代王者成功")
        else:
            print(str(self.uid) + "军团战-获取历代王者失败" + str(S2C_GVG_GetKingHistory.ret))
            raise ProtocolException("军团战-获取历代王者失败")
    def make_user_info(self,user):
        """
        传入角色信息，更新战场角色信息记录
        :param user:
        :return:
        """
        if "pos_id" in dir(user):
            pos_id = user.pos_id
        else:
            pos_id = 0
        if "move_arrive_time" in dir(user):
            move_arrive_time = user.move_arrive_time
        else:
            move_arrive_time = 0
        if "power" in dir(user):
            power = user.power  # 当前兵力
        else:
            power = 1
        if "tower_protect_end_time" in dir(user):
            tower_protect_end_time = user.tower_protect_end_time  # 如果玩家在炮台占领位，则有炮台占领位保护结束时间
        else:
            tower_protect_end_time = 0
        wudi_time = tower_protect_end_time + move_arrive_time
        self.match_user_dic[user.user_id] = {"军团ID": user.snapshot.guild_id, "血量": power, "位置ID": pos_id,
                                             "无敌结束时间": wudi_time}

    def MSG_C2S_GVG_EnterMatch(self, ):
        """
        军团战进入比赛
        :param uid:
        :param sid:
        :return:
        """
        C2S_GVG_EnterMatch = cs_pb2.C2S_GVG_EnterMatch()
        C2S_GVG_EnterMatch = C2S_GVG_EnterMatch.SerializeToString()
        C2S_GVG_EnterMatch_attr = {'name': "C2S_GVG_EnterMatch", 'protocol': 'protobuf-ss',
                                   'send_cmd': 14442, 'recv_cmd': [14443, 14444], 'uid': self.uid, 'sid': self.sid}
        senddata = self.pack_data(C2S_GVG_EnterMatch, C2S_GVG_EnterMatch_attr)  # 装包，需要学习
        flag, data = self.send_receive(senddata, C2S_GVG_EnterMatch_attr, 32)  # 发送协议
        S2C_GVG_EnterMatch = cs_pb2.S2C_GVG_EnterMatch()  # 创建返回协议对象
        S2C_GVG_EnterMatch.ParseFromString(data[14443])  # 解析协议返回值
        if S2C_GVG_EnterMatch.ret == 1:
            print("军团战进入比赛成功")
        else:
            print(str(self.uid) + "军团战进入比赛失败" + str(S2C_GVG_EnterMatch.ret))
            raise ProtocolException("军团战进入比赛失败")
        if self.G_bisai_id != S2C_GVG_EnterMatch.info.id:
            raise ProtocolException("军团战ID和报名的ID不一致")
        for guild_list in S2C_GVG_EnterMatch.guilds:
            guild_num_str = str(guild_list.guild.id)  # 军团战中的军团id
            self.guild_index_dic[guild_num_str] = guild_list.index  # 军团ID当key
        for user in S2C_GVG_EnterMatch.users:  # 比赛中的玩家列表
            self.make_user_info(user)
        for gate_list in S2C_GVG_EnterMatch.gates:  # 城门
            self.gate_dic[gate_list.grid_id] = gate_list.hp
        for buff_list in S2C_GVG_EnterMatch.buffs:  # BUFF点
            grid_id = buff_list.grid_id
            buff_id = buff_list.buff_id
            end_time = buff_list.end_time
            self.buff_dic[grid_id] = [buff_id, end_time]
        for tower_list in S2C_GVG_EnterMatch.towers:  # 炮台
            grid_id = tower_list.grid_id
            if "guild_id" in dir(tower_list):
                guild_id = tower_list.guild_id
                self.tower_dic[grid_id] =guild_id
            else:
                self.tower_dic[grid_id] = 0


    def waiting_for_you(self, recvcmd_into, data):
        """
        :param recvcmd_into: 需要监听的协议号
        :param data: 协议包
        :return:
        """
        # todo 需要做一个持续监听协议的函数，监听并更新进入/离开战场的玩家ID
        if recvcmd_into == 14444:
            # 玩家进入战场推送
            S2C_GVG_NotifyUserEnter = cs_pb2.S2C_GVG_NotifyUserEnter()  # 创建返回协议对象
            S2C_GVG_NotifyUserEnter.ParseFromString(data)
            # 收到推送后自动更新场上玩家列表
            if self.UserEnter_id != S2C_GVG_NotifyUserEnter.message_index:
                self.UserEnter_id=S2C_GVG_NotifyUserEnter.message_index
                self.make_user_info(S2C_GVG_NotifyUserEnter.user)
        if recvcmd_into == 14447:
            #玩家离开比赛推送
            S2C_GVG_NotifyUserLeave = cs_pb2.S2C_GVG_NotifyUserLeave()  # 创建返回协议对象
            S2C_GVG_NotifyUserLeave.ParseFromString(data)
            # 收到推送后自动更新场上玩家列表
            self.match_user_dic.pop(S2C_GVG_NotifyUserLeave.user_id, 0)
        if recvcmd_into == 14464:
            #刷新Buff推送
            S2C_GVG_NotifyNewBuff = cs_pb2.S2C_GVG_NotifyNewBuff()
            S2C_GVG_NotifyNewBuff.ParseFromString(data)
            # 出现buff了，就刷新buff
            self.buff_dic[S2C_GVG_NotifyNewBuff.grid_buff.grid_id] = [S2C_GVG_NotifyNewBuff.grid_buff.buff_id,
                                                                      S2C_GVG_NotifyNewBuff.grid_buff.end_time]
        if recvcmd_into == 14450:
            #玩家移动推送
            S2C_GVG_NotifyMove = cs_pb2.S2C_GVG_NotifyMove()  # 创建返回协议对象
            S2C_GVG_NotifyMove.ParseFromString(data)  # 解析协议返回值
            if self.NotifyMove_id != S2C_GVG_NotifyMove.message_index:
                self.NotifyMove_id = S2C_GVG_NotifyMove.message_index
                self.match_user_dic[S2C_GVG_NotifyMove.user_id]["位置ID"]=S2C_GVG_NotifyMove.pos_id
                if S2C_GVG_NotifyMove.pos_id in self.go_tower_dic.keys():
                    self.go_tower_dic[S2C_GVG_NotifyMove.pos_id]
                if "arrive_time" in dir(S2C_GVG_NotifyMove):
                    arrive_time = S2C_GVG_NotifyMove.arrive_time  # 到达时间    无此值时表示立即到达
                    self.match_user_dic[S2C_GVG_NotifyMove.user_id]["无敌结束时间"] = arrive_time
                if "owner_guild_id" in dir(S2C_GVG_NotifyMove):
                    owner_guild_id = S2C_GVG_NotifyMove.owner_guild_id  # 炮塔拥有者是发生变更时，返回当前炮台占领的军团
                    self.tower_dic[S2C_GVG_NotifyMove.pos_id] = owner_guild_id
                if "protect_end_time" in dir(S2C_GVG_NotifyMove):
                    protect_end_time = S2C_GVG_NotifyMove.protect_end_time  # 如果是站上炮台占领位，则返回保护到期时间
                    if "arrive_time" in dir(S2C_GVG_NotifyMove) and S2C_GVG_NotifyMove.arrive_time>protect_end_time:
                        self.match_user_dic[S2C_GVG_NotifyMove.user_id]["无敌结束时间"] = S2C_GVG_NotifyMove.arrive_time
                    else:
                        self.match_user_dic[S2C_GVG_NotifyMove.user_id]["无敌结束时间"] = protect_end_time

        # 攻击玩家推送
        if recvcmd_into == 14453:
            S2C_GVG_NotifyAttackUser = cs_pb2.S2C_GVG_NotifyAttackUser()  # 创建返回协议对象
            S2C_GVG_NotifyAttackUser.ParseFromString(data)  # 解析协议返回值
            # todo 根据功能选取参数
            if self.NotifyAttackUser_id != S2C_GVG_NotifyAttackUser.message_index:
                self.NotifyAttackUser_id=S2C_GVG_NotifyAttackUser.message_index
                attacker_user_id = S2C_GVG_NotifyAttackUser.attacker_user_id  # 攻击方玩家ID
                attacker_score = S2C_GVG_NotifyAttackUser.attacker_score  # 攻击方当前积分
                attacker_power = S2C_GVG_NotifyAttackUser.attacker_power  # 攻击方当前兵力
                self.match_user_dic[attacker_user_id]["血量"] = attacker_power
                if attacker_power==0:
                    self.match_user_dic[attacker_user_id]["无敌结束时间"] =time.time()+self.fuhuo_cd
                attacker_cont_kill_num = S2C_GVG_NotifyAttackUser.attacker_cont_kill_num  # 连续杀人数
                defender_user_id = S2C_GVG_NotifyAttackUser.defender_user_id  # 被攻击方玩家ID
                defender_score = S2C_GVG_NotifyAttackUser.defender_score  # 被攻击方当前积分
                defender_power = S2C_GVG_NotifyAttackUser.defender_power  # 被攻击方当前兵力
                self.match_user_dic[defender_user_id]["血量"] = defender_power
                if defender_power==0:
                    self.match_user_dic[attacker_user_id]["无敌结束时间"] =time.time()+self.fuhuo_cd
                defender_cont_kill_num = S2C_GVG_NotifyAttackUser.defender_cont_kill_num  # 被攻击方连续杀人数
                if "attacker_protect_end_time" in dir(S2C_GVG_NotifyAttackUser):
                    attacker_protect_end_time = S2C_GVG_NotifyAttackUser.attacker_protect_end_time  # 如果是攻占炮台占领位，则返回保护到期时间
                    if defender_power > 0:
                        self.match_user_dic[defender_user_id]["无敌结束时间"] = attacker_protect_end_time
                    if attacker_power > 0:
                        self.match_user_dic[attacker_user_id]["无敌结束时间"] = attacker_protect_end_time
                if "owner_guild_id" in dir(S2C_GVG_NotifyAttackUser):
                    owner_guild_id = S2C_GVG_NotifyAttackUser.owner_guild_id  # 如果是炮台占领区占领军团，则返回当前占领者
                    pos_id = self.match_user_dic[defender_user_id]["位置ID"]
                    self.tower_dic[pos_id] = owner_guild_id
        if recvcmd_into == 14456:
            #攻击城门推送
            S2C_GVG_NotifyAttackGate = cs_pb2.S2C_GVG_NotifyAttackGate()  # 创建返回协议对象
            S2C_GVG_NotifyAttackGate.ParseFromString(data)  # 解析协议返回值
            if self.NotifyAttackGate_id!=S2C_GVG_NotifyAttackGate.message_index:
                self.NotifyAttackGate_id = S2C_GVG_NotifyAttackGate.message_index
                score = S2C_GVG_NotifyAttackGate.score  # 当前积分
                gate_grid_id = S2C_GVG_NotifyAttackGate.gate_grid_id  # 城门格子ID
                if "gate_hp" in dir(S2C_GVG_NotifyAttackGate):
                    gate_hp = S2C_GVG_NotifyAttackGate.gate_hp  # 城门当前耐久
                    self.gate_dic[gate_grid_id] = gate_hp
        if recvcmd_into == 14459:
            #玩家复活
            S2C_GVG_NotifyRevive = cs_pb2.S2C_GVG_NotifyRevive()  # 创建返回协议对象
            S2C_GVG_NotifyRevive.ParseFromString(data)  # 解析协议返回值
            if self.NotifyRevive_id!=S2C_GVG_NotifyRevive.message_index:
                self.NotifyRevive_id = S2C_GVG_NotifyRevive.message_index
                self.match_user_dic[S2C_GVG_NotifyRevive.user_id]["位置ID"] = S2C_GVG_NotifyRevive.pos_id#复活玩家id
                self.match_user_dic[S2C_GVG_NotifyRevive.user_id]["无敌结束时间"] =0
                self.match_user_dic[S2C_GVG_NotifyRevive.user_id]["血量"] = 1

    def MSG_C2S_GVG_Revive(self, ):
        """
        军团战-玩家复活
        :param uid:
        :param sid:
        :return:
        """
        # recv_cmd_list = [14458,14459]
        recv_cmd_list = 14458
        C2S_GVG_Revive = cs_pb2.C2S_GVG_Revive()
        C2S_GVG_Revive = C2S_GVG_Revive.SerializeToString()
        C2S_GVG_Revive_attr = {'name': "C2S_GVG_Revive", 'protocol': 'protobuf-ss',
                               'send_cmd': 14457, 'recv_cmd': recv_cmd_list, 'uid': self.uid, 'sid': self.sid}
        senddata = self.pack_data(C2S_GVG_Revive, C2S_GVG_Revive_attr)  # 装包，需要学习
        flag, data = self.send_receive(senddata, C2S_GVG_Revive_attr, 32)  # 发送协议
        S2C_GVG_Revive = cs_pb2.S2C_GVG_Revive()  # 创建返回协议对象
        S2C_GVG_Revive.ParseFromString(data)  # 解析协议返回值
        if S2C_GVG_Revive.ret == 1:
            print("军团战-玩家复活成功")
        else:
            print(str(self.uid) + "军团战-玩家复活失败" + str(S2C_GVG_Revive.ret))
            raise ProtocolException("军团战-玩家复活失败")


    def MSG_C2S_GVG_AttackUser(self, user_id):
        """
        军团战-攻击玩家
        :param uid:
        :param sid:
        :return:
        """
        C2S_GVG_AttackUser = cs_pb2.C2S_GVG_AttackUser()
        C2S_GVG_AttackUser.user_id = user_id
        C2S_GVG_AttackUser = C2S_GVG_AttackUser.SerializeToString()
        C2S_GVG_AttackUser_attr = {'name': "C2S_GVG_AttackUser", 'protocol': 'protobuf-ss',
                                   'send_cmd': 14451, 'recv_cmd': 14452, 'uid': self.uid, 'sid': self.sid}
        senddata = self.pack_data(C2S_GVG_AttackUser, C2S_GVG_AttackUser_attr)  # 装包，需要学习
        flag, data = self.send_receive(senddata, C2S_GVG_AttackUser_attr, 32)  # 发送协议
        S2C_GVG_Revive = cs_pb2.S2C_GVG_Revive()  # 创建返回协议对象
        S2C_GVG_Revive.ParseFromString(data)  # 解析协议返回值
        if S2C_GVG_Revive.ret == 1:
            print("军团战-攻击玩家成功")
        else:
            print(str(self.uid) + "军团战-攻击玩家失败" + str(S2C_GVG_Revive.ret))
            raise ProtocolException("军团战-攻击玩家失败")


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
                                   'send_cmd': 14454, 'recv_cmd': 14455, 'uid': self.uid, 'sid': self.sid}
        senddata = self.pack_data(C2S_GVG_AttackGate, C2S_GVG_AttackGate_attr)  # 装包，需要学习
        flag, data = self.send_receive(senddata, C2S_GVG_AttackGate_attr, 32)  # 发送协议
        S2C_GVG_AttackGate = cs_pb2.S2C_GVG_AttackGate()  # 创建返回协议对象
        S2C_GVG_AttackGate.ParseFromString(data)  # 解析协议返回值
        if S2C_GVG_AttackGate.ret == 1:
            print("军团战-攻击城门成功")
        else:
            print(str(self.uid) + "军团战-攻击城门失败" + str(S2C_GVG_AttackGate.ret))
            raise ProtocolException("军团战-攻击城门失败")


    def MSG_C2S_GVG_Move(self, target_pos_id):
        """
        军团战-玩家移动
        :param uid:
        :param sid:
        :return:
        """
        C2S_GVG_Move = cs_pb2.C2S_GVG_Move()
        C2S_GVG_Move.target_pos_id = target_pos_id
        C2S_GVG_Move.cost_time = self.move_cd
        C2S_GVG_Move = C2S_GVG_Move.SerializeToString()
        C2S_GVG_Move_attr = {'name': "C2S_GVG_Move", 'protocol': 'protobuf-ss',
                             'send_cmd': 14448, 'recv_cmd': 14449, 'uid': self.uid, 'sid': self.sid}
        senddata = self.pack_data(C2S_GVG_Move, C2S_GVG_Move_attr)  # 装包，需要学习
        flag, data = self.send_receive(senddata, C2S_GVG_Move_attr, 32)  # 发送协议
        S2C_GVG_Move = cs_pb2.S2C_GVG_Move()  # 创建返回协议对象
        S2C_GVG_Move.ParseFromString(data)  # 解析协议返回值
        if S2C_GVG_Move.ret == 1:
            print("军团战-玩家移动成功")
            self.match_user_dic[self.uid]["位置ID"] =target_pos_id
            if "arrive_time" in dir(S2C_GVG_Move):
                self.match_user_dic[self.uid]["移动结束时间"] = S2C_GVG_Move.arrive_time
        else:
            print(str(self.uid) + "军团战-玩家移动失败" + str(S2C_GVG_Move.ret))
            raise ProtocolException("军团战-玩家移动失败")


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
                                   'send_cmd': 14445, 'recv_cmd': 14446, 'uid': self.uid, 'sid': self.sid}
        senddata = self.pack_data(C2S_GVG_LeaveMatch, C2S_GVG_LeaveMatch_attr)  # 装包，需要学习
        flag, data = self.send_receive(senddata, C2S_GVG_LeaveMatch_attr, 32)  # 发送协议
        S2C_GVG_LeaveMatch = cs_pb2.S2C_GVG_LeaveMatch()  # 创建返回协议对象
        S2C_GVG_LeaveMatch.ParseFromString(data)  # 解析协议返回值
        if S2C_GVG_LeaveMatch.ret == 1:
            print("军团战-离开比赛成功")
        else:
            print(str(self.uid) + "军团战-离开比赛失败" + str(S2C_GVG_LeaveMatch.ret))
            raise ProtocolException("军团战-离开比赛失败")

    def MSG_C2S_GVG_AddBuff(self, ):
        """
        获取Buff
        :param uid:
        :param sid:
        :return:
        """
        C2S_GVG_AddBuff = cs_pb2.C2S_GVG_AddBuff()
        C2S_GVG_AddBuff = C2S_GVG_AddBuff.SerializeToString()
        C2S_GVG_AddBuff_attr = {'name': "C2S_GVG_AddBuff", 'protocol': 'protobuf-ss',
                                'send_cmd': 14460, 'recv_cmd': 14461, 'uid': self.uid, 'sid': self.sid}
        senddata = self.pack_data(C2S_GVG_AddBuff, C2S_GVG_AddBuff_attr)  # 装包，需要学习
        flag, data = self.send_receive(senddata, C2S_GVG_AddBuff_attr, 32)  # 发送协议
        S2C_GVG_AddBuff = cs_pb2.S2C_GVG_AddBuff()  # 创建返回协议对象
        S2C_GVG_AddBuff.ParseFromString(data[14461])  # 解析协议返回值
        if S2C_GVG_AddBuff.ret == 1:
            print("军团战-获取Buff成功")
        else:
            print(str(self.uid) + "军团战-获取Buff失败" + str(S2C_GVG_AddBuff.ret))
            raise ProtocolException("军团战-获取Buff失败")
        # S2C_GVG_NotifyAddBuff = cs_pb2.S2C_GVG_NotifyAddBuff()  # 创建返回协议对象
        # S2C_GVG_NotifyAddBuff.ParseFromString(data[14462])  # 解析协议返回值
        # S2C_GVG_NotifyRemoveBuff = cs_pb2.S2C_GVG_NotifyRemoveBuff()  # 创建返回协议对象
        # S2C_GVG_NotifyRemoveBuff.ParseFromString(data[14463])  # 解析协议返回值

    def sleep_time(self, time_stamp):
        """
        根据输入的时间戳，算出需要等待的时间
        :param time_stamp:
        :return: 需要等待的时间
        """
        new_time = time.time()
        sleep_time = int(time_stamp - new_time)
        return sleep_time

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
        senddata = self.pack_data(C2S_Test, C2S_Test_attr)  # 装包，需要学习
        flag, data = self.send_receive(senddata, C2S_Test_attr, 32)  # 发送协议
        S2C_Test = cs_pb2.S2C_Test()  # 创建返回协议对象
        S2C_Test.ParseFromString(data)  # 解析协议返回值
        if S2C_Test.ret == 1:
            print("添加道具成功")
        else:
            raise ProtocolException(str(self.uid) + "添加道具失败" + str(S2C_Test.ret))

    def set_checkpoint(self):
        url = "http://gmapi.qa.ngame2.youzu.com/api/gm/checkpoint"
        data = {"account": self.username, "role_id": self.uid, "server": self.server_id, "function": "1",
                "checkpoint": 53640}
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
                self.add_resource_pb(1, 1, 9999999)  # 角色经验
                self.add_resource_pb(1, 2, 99999)  # 贵族经验
                self.add_resource_pb(999, 0, 99999)  # 元宝
            else:
                raise GmException("创建角色失败" + str(G2C_Create.uid))
        elif G2C_Login.ret == 2:
            raise GameServerStopException("服务器维护中,创建账号失败")
        self.set_checkpoint()


class MyTaskSet(TaskSequence):
    def __init__(self, parent):
        super(MyTaskSet, self).__init__(parent)
        self.account = self.locust.username
        self.OpServerID = self.locust.OpServerID
        self.exceptTime = 30
        self.hands = 0
        self.battleUnits = {}

    @seq_task(1)
    @task(1)
    def go_run(self):
        server_id_dic = {"QA1": 1652440001, "QA2": 1652440002, "QA3": 1652440003, "QA4": 1652440004, "QA6": 1652440006,
                         "QA7": 1652440007, }
        lg = LoginGame(server_id_dic["QA1"])
        lg.Login()
        lg.MSG_C2S_Guild_Search("a2asf")  # 创建或加入军团

        lg.MSG_C2S_GVG_Join()  # 报名
        lg.MSG_C2S_GVG_GetInfo()  # 获取军团战信息

        lg.MSG_C2S_GVG_EnterMatch()  # 进入比赛   公会列表
        # 移动
        # 玩家战斗，抢炮台
        lg.go_tower_dic
        lg.MSG_C2S_GVG_Move(target_pos_id)  # 玩家移动
        # 领取buff
        # 打城门

        lg.MSG_C2S_GVG_GetMatchInfo()  # 获取军团战比赛信息，
        lg.MSG_C2S_GVG_GetAchieve()  # 获取赛季成就信息
        if len(self.achieve_id_list) > 0:
            for achieve_id in self.achieve_id_list:
                lg.MSG_C2S_GVG_GetAchieveAward(achieve_id)  # 领取赛季成就奖励

        lg.MSG_C2S_GVG_GetKingHistory()  # 获取历代王者
        lg.MSG_C2S_GVG_LeaveMatch()  # 离开比赛
        target_pos_id = 0  # 地图坐标
        lg.MSG_C2S_GVG_Move(target_pos_id)  # 玩家移动

        for uid in lg.match_user_dic.keys():
            if lg.self_guild_id != lg.match_user_dic[uid]["军团ID"] and time.time()>=lg.match_user_dic[uid]["移动结束时间"] and time.time()>=lg.match_user_dic[uid]["无敌结束时间"] and lg.match_user_dic[uid]["血量"]!=0:#不是一个军团
                lg.MSG_C2S_GVG_Move(lg.match_user_dic[uid]["位置ID"])  # 玩家移动
                lg.MSG_C2S_GVG_AttackUser(uid)  # 攻击玩家
        for key_id in lg.go_gate_dic.keys():
            target_pos_id = lg.go_gate_dic[key_id]
            lg.MSG_C2S_GVG_Move(target_pos_id)  # 玩家移动
            lg.MSG_C2S_GVG_AttackGate()  # 攻击城门 需要先移动到指定位置
        lg.MSG_C2S_GVG_Revive()  # 复活 有CD
        lg.MSG_C2S_GVG_AddBuff()  # 获取Buff  有时间限制


class MyLocust(Locust):
    def __init__(self):
        print("test beginning.....", time.strftime("%Y-%m-%d %H:%M:%S", time.localtime()))

    task_set = MyTaskSet
    min_wait = 200
    max_wait = 200


if __name__ == '__main__':
    wl = MyLocust()
    wl.run()
