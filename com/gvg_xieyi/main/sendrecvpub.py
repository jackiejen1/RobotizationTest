# -*- coding: utf-8 -*-
# @Time    : 2018/7/25 15:02
# @Author  : 丸子
# @FileName: sendrecvpub.py
# @Software: PyCharm
import struct
import time
from socket import error
from locust.exception import StopLocust
import gevent
from locust import events
from packdata import pack_data
from sx_proto.errorMsgInfo_pb2 import CErrorMsgInfo
from Proto_new.worldBossOperate_pb2 import CWorldBossOperate
from Proto_new.worldBossSystem_pb2 import CWorldBossBattleRevive

GNET_PACKET_FLAG = 0xC0000000
GNET_PACKET_TCPLEN = 0x00ffffff
GNET_PACKET_CONNECT_BIT = 0x02000000
GNET_PACKET_EXT = 0x01000000


def getTcpPacketLen(sign):
    return sign & GNET_PACKET_TCPLEN


def isExt(sign):
    return (sign & GNET_PACKET_EXT) == GNET_PACKET_EXT


def pong():
    return struct.pack('IHHI', (GNET_PACKET_FLAG | GNET_PACKET_EXT | 8), 1, 0, 0)

def CMsgGC2GWAck(t, resIndex):
    CMsgGC2GWAck_data = b''
    CMsgGC2GWAck_attr = {'name': 'CMsgGC2GWAck', 'protocol': 'protobuf-ShanHai-ack',
                                        'send_ServId': 10,
                                        'send_MsgID': 2, 'send_FuncID': 5,
                                        'recv_ServId': 8, 'recv_MsgID': 1, 'recv_FuncID': 5, 'reqIndex': 0,
                                        'resIndex': resIndex}
    sendata = pack_data(t, CMsgGC2GWAck_data, CMsgGC2GWAck_attr)
    # flag, recv_data, code, send_time, resIndex = send_receive(t, sendata, CMsgGC2GWAck_attr, 0,12,20,True)
    flag, send_time = send(t, sendata, CMsgGC2GWAck_attr, 0, 12, 20, True)
    # return flag, recv_data, code, resIndex

def SCMessage(data):
    SCMessage = msg_types_sc_pb2.SCMessage()
    SCMessage.ParseFromString(data)
    return SCMessage


class CatchResponseError(Exception):
    pass


def success(restype, workname, response_time, content_size):
    """
    记录成功数据
    :param restype:
    :param workname:
    :param response_time:
    :param content_size:
    :return: None
    """
    events.request_success.fire(
        request_type=restype,
        name=workname,
        response_time=response_time,
        response_length=content_size,
    )


def failure(restype, workname, errormsg):
    """
    记录失败请求
    :param restype: 请求类型(socket,http)
    :param workname: 当前请求名称 例子（ 登录，购买）
    :param errormsg: 错误日志
    :return: None
    """
    exc = CatchResponseError(errormsg)
    events.request_failure.fire(
        request_type=restype,
        name=workname,
        response_time=0,
        response_length=0,
        exception=exc,
    )


def _send_data(s, socketdata, workname='ack'):
    flag = True
    try:
        send_time = time.time()
        print("sendddddddddddddddd sucAAA",workname)
        # print("sendddddddddddddddd sucAAA")
        s.sendall(socketdata)
        print("sendddddddddddddddd suc",workname)
        # print("sendddddddddddddddd suc")
    except error:
        print("sendddddddddddddddd error==>",error)
        flag = False
    return flag, send_time


# def _recv_data(s, api_attr, buffersize, limittime):
#     # 不同的游戏可以自行修改此接收数据的处理方法，以实现不同的游戏规则
#     recv_msgID = api_attr['recv_MsgID']
#     print("当前接收接口:--{} recv_MsgID: {}".format(api_attr['name'], recv_msgID))
#     rst = int(time.time())
#     sms = int(time.time() * 1000)
#     loop_num = 0
#     # print("用户:{} 开始接收: {} 当前时间:{} ".format(api_attr['username'], recvcmd, sms))
#     while loop_num <= 20:
#
#         try:
#             ct = int(time.time())
#             if ct - rst > limittime:
#                 # print("接收接口 {} 接收超时 {} * {}".format(api_attr['name'], ct - rst, limittime))
#                 recvtime = time.time()
#                 recvdata = b'error'
#                 return recvdata, recvtime
#             s.settimeout(limittime)
#             # rev_data = s.recv(10240)
#             rev_data = s.recv(4)
#             # print("nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn",len(rev_data))
#             if len(rev_data) < 4:
#                 print("2接收包头长度错误 {}".format(len(rev_data)))
#                 raise StopLocust("2接收包头长度错误 {}".format(len(rev_data)))
#
#             headers = struct.unpack("I", rev_data[:4])  # 先把PacketSign解出来（4字节），里面包含消息总长度
#             offset = 4
#             packetSign = headers[0]
#             print("packetSign is: 0x{:02x}".format(packetSign))
#             totalLen = getTcpPacketLen(packetSign)
#             offset = 0
#             rev_data = s.recv(totalLen)
#             while len(rev_data) < totalLen:
#                 print("2接收包头 {} 长度错误 {}".format(totalLen, len(rev_data)))
#                 rev_data = rev_data + s.recv(totalLen - len(rev_data))
#                 # raise StopLocust("2接收包头 {} 长度错误 {}".format(totalLen+4, len(rev_data)))
#             if isExt(packetSign):
#                 extBuff = struct.unpack('B', rev_data[offset:])
#                 if extBuff[0] == 0 or extBuff[0] == 2:
#                     print("接收到PING消息, 回复PONG消息")
#                     s.sendall(pong())
#                     loop_num += 1
#                     continue
#
#             head_data = struct.unpack("HHI", rev_data[offset:offset + 8])  # |MsgType 2字节|MsgId 2字节|序列化后的protobuf流长度 4字节|
#             s.settimeout(limittime)
#             print("解析包头============>", head_data)
#             protoLen = head_data[2]  # protobuf序列化后的buff长度：67
#             offset += 8
#             tmpdata = rev_data[offset:]
#             # print("llllllllllleneeen: %d" % len(tmpdata))
#
#             # if head_data[1] != recvcmd:
#             #     print("接收接口不成功,%d!=%d"%(head_data[1],recvcmd))
#             # print(tmpdata.hex())
#             # recvtime = time.time()
#             # print("接收接口: {} 接收成功, 用时:{}".format(api_attr['name'], int(time.time() * 1000) - sms))
#             # buff = tmpdata[:protoLen]
#             # code = struct.unpack('H', tmpdata[protoLen:protoLen + 2])
#             # # print('buffLen: ', buffLen, 'buff: ', buff, 'code: ', code)
#             # print("buffLen====>buff: %s" % (buff))
#             # print("code ======>", code[0])
#             # return buff, code[0], recvtime
#             # 判断recv_MsgType
#             print("recv_MsgType：", head_data[0])
#             recv_FuncID = api_attr['recv_FuncID']
#             recv_ServId = api_attr['recv_ServId']
#             recv_MsgType = recv_ServId << 8 | recv_FuncID
#             # print("计算出的recv_MsgType：", recv_MsgType)
#             if head_data[0] == recv_MsgType and head_data[1] == recv_msgID:
#                 print("接收接口成功,%d=%d" % (head_data[1], recv_msgID))
#                 recvtime = time.time()
#                 print("接收接口: {} 接收成功, 用时:{}".format(api_attr['name'], int(time.time() * 1000) - sms))
#                 buff = tmpdata[:protoLen]
#                 code = struct.unpack('H', tmpdata[protoLen:protoLen + 2])
#                 reqIndex = struct.unpack('H', tmpdata[protoLen + 2:protoLen + 4])
#                 resIndex = struct.unpack('H', tmpdata[protoLen +4:protoLen + 6])
#                 # print('buffLen: ', buffLen, 'buff: ', buff, 'code: ', code)
#                 # print("buffLen====>buff: %s" % (buff))
#                 # print("code ===123123===>", code[0])
#                 # print("reqIndex ===123123===>", reqIndex[0])
#                 # print("resIndex ===123123===>", resIndex[0])
#                 return buff, code[0], recvtime,resIndex[0]
#             else:
#                 print("接收接口不成功,%d!=%d" % (head_data[1], recv_msgID))
#                 continue
#
#         except Exception as e:
#             print("接收接口 {} ==socket接收数据时发生错误: {}".format(api_attr['name'], e))
#             recvtime = time.time()
#             recvdata = b'error'
#             return recvdata, recvtime

def _recv_data(t, api_attr, buffersize, limittime):
# def _recv_data(
    # 不同的游戏可以自行修改此接收数据的处理方法，以实现不同的游戏规则
    recv_msgID = api_attr['recv_MsgID']
    print("当前接收接口:--{} recv_MsgID: {}".format(api_attr['name'], recv_msgID))
    rst = int(time.time())
    sms = int(time.time() * 1000)
    loop_num = 0
    while loop_num <= 200000:
        try:
            ct = int(time.time())
            if ct - rst > limittime:
                recvtime = time.time()
                recvdata = b'error'
                return recvdata, 0, recvtime,"超时"
            # t.client.settimeout(limittime)
            rev_data = t.client.recv(4)
            if len(rev_data) < 4:
                print("收到数据长度为0！！！", len(rev_data))
                print("1接收包头长度错误 {}".format(len(rev_data)))
                recvtime = time.time()
                recvdata = b'error'
                return recvdata, None, recvtime, "链接已经断开1"
            headers = struct.unpack("I", rev_data[:4])  # 先把PacketSign解出来（4字节），里面包含消息总长度
            packetSign = headers[0]
            # print("packetSign is: 0x{:02x}".format(packetSign))
            totalLen = getTcpPacketLen(packetSign)
            offset = 0
            # print(totalLen)
            time.sleep(0.01)
            rev_data = t.client.recv(totalLen)
            if len(rev_data) < totalLen:
                print("2接收包头 {} 长度错误 {}".format(totalLen, len(rev_data)))
                recvtime = time.time()
                recvdata = b'error'
                return recvdata, None, recvtime, "链接已经断开2"
            ack_data = rev_data
                # raise StopLocust("2接收包头 {} 长度错误 {}".format(totalLen+4, len(rev_data)))
            if isExt(packetSign):
                extBuff = struct.unpack('B', rev_data[offset:])
                if extBuff[0] == 0 or extBuff[0] == 2:
                    print("接收到PING消息, 回复PONG消息 {}".format(extBuff[0]))
                    t.client.sendall(pong())
                    #CMsgGC2GWAck(t)
                    loop_num += 1
                    continue

                    # recvdata = 'ok'
                    # recvtime = time.time()
                    # return recvdata, None, recvtime, None

            head_data = struct.unpack("HH", rev_data[offset:offset + 4])  # |MsgType 2字节|MsgId 2字节|
            t.client.settimeout(limittime)
            offset += 4
            # print("recv_MsgType：", head_data[0])
            # print("recv_MsgId：", head_data[1])
            recv_FuncID = api_attr['recv_FuncID']
            recv_ServId = api_attr['recv_ServId']
            recv_MsgType = recv_ServId << 8 | recv_FuncID
            # print("recv_MsgType====>",recv_MsgType)
            if head_data[0] == 2062 and head_data[1] == 7:
                b = struct.unpack('?', rev_data[offset:offset+1])
                # print("GM指令回包长度---------->",len(rev_data))
                # print("接收GM指令成功 ",b)
                # return rev_data[offset:offset + 1], 0, 0, 0

                # protoLen = struct.unpack("I", rev_data[offset:offset + 4])[0]  # |序列化后的protobuf流长度 4字节|
                # # print("AAAAAAAAAAAAAAAAAAAAAAAAAA1",protoLen)
                # offset += 4
                # tmpdata = rev_data[offset:]
                # buff = tmpdata[:protoLen]
                # # print("AAAAAAAAAAAAAAAAAAAAAAAAAA2")
                # code = struct.unpack('H', tmpdata[protoLen:protoLen + 2])
                # # print("AAAAAAAAAAAAAAAAAAAAAAAAAA3")
                # reqIndex = struct.unpack('H', tmpdata[protoLen + 2:protoLen + 4])
                # # print("AAAAAAAAAAAAAAAAAAAAAAAAAA4")
                # resIndex = struct.unpack('H', tmpdata[protoLen + 4:protoLen + 6])
                # # print("ACKKKKKKKKKKKKKKKKKKKKKKKKK11", resIndex[0])
                # CMsgGC2GWAck(t.client, resIndex[0])


                if head_data[0] == recv_MsgType and head_data[1] == recv_msgID:
                    recv_time = time.time()
                    return  rev_data[offset:offset+1],0,recv_time,0
                else:
                    continue
            # print("AAAAAAAAAAAAAAAAAAAAAAAAAA1")

            protoLen = struct.unpack("I", rev_data[offset:offset + 4])[0]  # |序列化后的protobuf流长度 4字节|
            # print("AAAAAAAAAAAAAAAAAAAAAAAAAA1",protoLen)
            offset += 4
            tmpdata = rev_data[offset:]
            buff = tmpdata[:protoLen]
            # print("AAAAAAAAAAAAAAAAAAAAAAAAAA2")
            code = struct.unpack('H', tmpdata[protoLen:protoLen + 2])
            # print("AAAAAAAAAAAAAAAAAAAAAAAAAA3")
            reqIndex = struct.unpack('H', tmpdata[protoLen + 2:protoLen + 4])
            # print("AAAAAAAAAAAAAAAAAAAAAAAAAA4")
            resIndex = struct.unpack('H', tmpdata[protoLen + 4:protoLen + 6])
            print("ACKKKKKKKKKKKKKKKKKKKKKKKKK11", resIndex[0])
            print("ACKKKKKKKKKKKKKKKKKKKKKKKKK11", head_data)

            CMsgGC2GWAck(t.client,resIndex[0])
            # print("ACKKKKKKKKKKKKKKKKKKKKKKKKK22")

            if not ((head_data[0] == 2062 and head_data[1] == 7) or (head_data[0] == 2048 and head_data[1] == 1)):
                # CMsgGC2GWAck(t)
                pass

            if head_data[0] == 2063 and (head_data[1] == 5 or head_data[1] == 9) and api_attr['name'] != "EMID_GC2CT_REQ_WORLD_BOSS_REVIVE_ENTER_BATTLE_SCENE":# head_data[1] == 4 #之前为4
                print("AA当前接收接口:--{} 收到错误消息！！！！".format(api_attr['name']))
                # protoLen = struct.unpack("I", rev_data[offset:offset + 4])[0]  # |序列化后的protobuf流长度 4字节|
                # offset += 4
                # tmpdata = rev_data[offset:]
                # buff = tmpdata[:protoLen]
                CAccountVerify_data = CErrorMsgInfo()
                CAccountVerify_data.ParseFromString(buff)
                # print("plplpl123", buff)
                print(CAccountVerify_data)
                # recvdata = b'error'
                recvdata = b'ok'
                if api_attr['name'] == "CMsgGC2CTReqAddTeam":
                    buff = b'ok'
                    recvtime = time.time()
                    head_data = 99999
                    return buff, code[0], recvtime, head_data
                if api_attr['name'] == "CFriendMessageBoard":
                    buff = b'error'
                    recvtime = time.time()
                    head_data = 99999
                    return buff, 0, recvtime, head_data

                if api_attr['name'] == "CMsgGC2CTReqReleaseSkill_BOSS" or api_attr['name'] == "CMsgGC2CTReqEnterBattleTest" or api_attr['name'] == "CMsgGC2CTReqEnterBattleScene":
                    recvdata = b'ok'
                recvtime = time.time()

                # failure("logic_err",api_attr['name'],str(CAccountVerify_data.ErrorID))

                continue
                # return recvdata,None, recvtime,None
                # return recvdata, 0, recvtime, head_data
            if api_attr['name'] == "CMsgGC2CTReqReleaseSkill_BOSS" and head_data[0] == 2087 and head_data[1] == 39:
                CWorldBossBattleRevive_data = CWorldBossBattleRevive()
                CWorldBossBattleRevive_data.ParseFromString(buff)
                print("CWorldBossBattleRevive_data.ReviveEndTime ============>",
                      CWorldBossBattleRevive_data)
                print("CWorldBossBattleRevive_data.ReviveEndTime ============>",
                      CWorldBossBattleRevive_data.ReviveEndTime)
                t.Revive_end_time = CWorldBossBattleRevive_data.ReviveEndTime

            if head_data[0] == 2087 and head_data[1] == 48:
                CWorldBossOperate_data = CWorldBossOperate()
                CWorldBossOperate_data.ParseFromString(buff)
                print("CWorldBossOperate_data===sendrecvpub====1>", CWorldBossOperate_data)
                print("CWorldBossOperate_data===sendrecvpub====1>", CWorldBossOperate_data.BossJoinRecord.LastSatus)
                if CWorldBossOperate_data.BossJoinRecord.LastSatus == 4:
                    print("LastSatus == 4:")
                    t.laststatus = 4
                    # raise StopLocust("task over")


            if head_data[0] == 2062 and head_data[1] == 7:
                b = struct.unpack('?', rev_data[offset:offset+1])
                print("接收GM指令成功 ",b)
                if head_data[0] == recv_MsgType and head_data[1] == recv_msgID:
                    recvtime = time.time()
                    return  rev_data[offset:offset+1],0,recvtime,0
            elif (head_data[0] == recv_MsgType and head_data[1] == recv_msgID) or (head_data[0] == 2074 and head_data[1] == 48):
                # protoLen = struct.unpack("I", rev_data[offset:offset + 4])[0]  # |序列化后的protobuf流长度 4字节|
                # offset += 4
                # tmpdata = rev_data[offset:]
                print("接收接口成功,%d=%d" % (head_data[1], recv_msgID))
                recvtime = time.time()
                # print("接收接口: {} 接收成功, 用时:{}".format(api_attr['name'], int(time.time() * 1000) - sms))
                # buff = tmpdata[:protoLen]
                # code = struct.unpack('H', tmpdata[protoLen:protoLen + 2])
                # reqIndex = struct.unpack('H', tmpdata[protoLen + 2:protoLen + 4])
                # resIndex = struct.unpack('H', tmpdata[protoLen +4:protoLen + 6])
                if head_data[0] == 2074 and head_data[1] == 48:
                    return buff, code[0], recvtime, head_data
                # return buff, code[0], recvtime,resIndex[0]
                return buff, code[0], recvtime, head_data
            else:
                print("接收接口不成功,%d %d!=%d %d" % (head_data[0],head_data[1],recv_MsgType, recv_msgID))
                continue

        except Exception as e:
            print("接收接口 {} ==socket接收数据时发生错误: {}".format(api_attr['name'], e))
            recvtime = time.time()
            recvdata = b'error'
            return recvdata,None, recvtime,str(e)


def send_receive(t, socketdata, api_attr, waittime, headsize, limitime=20.0, norec=False):

    workname = api_attr['name']
    # 发送数据
    print("KKKKKKKKK1231")
    flag, send_time = _send_data(t.client, socketdata, workname)
    print("KKKKKKKKK1232",flag)
    if not flag:
        failure('socket', workname, "发送数据错误")
        return flag, b'error'
    print("kpllll123A")
    if norec:
        return flag, b'norecv'
    if api_attr['name'] == 'CMsgGC2CTReqChangeScene' or api_attr['name'] == 'CMsgGC2CTReqChangeScene':
        receive_data = ''
        code = 0
    # print("kpllll123B")
        return flag, receive_data, code
    # 接收数据
    print("kpllll123C")
    receive_data, code, recv_time, resIndex = _recv_data(t, api_attr, headsize, limitime)
    # receive_data = b''
    # code = 0
    # recv_time = 0
    # resIndex = 0
    print("send_time=====>",send_time)
    print("recv_time=====>", recv_time)
    send_time = send_time * 1000
    recv_time = recv_time * 1000
    # 将毫秒规整，不然统计数据太多，不利于统计
    usedtime = int(recv_time - send_time)# + 20000
    print("zzz--接收接口{}---发送时间:{} 接收时间:{} 用时: {:.3f} ms-----".format(workname, send_time, recv_time, usedtime))
    if receive_data != b'error':
        # if usedtime > 3000:
        #     print("发现超过3s的 响应:{} ".format(usedtime))
        if resIndex==99999 and workname=="CMsgGC2CTReqAddTeam":
            print("加入队伍失败")
            flag = True
        else:
            print("--接收接口{}---发送时间:{} 接收时间:{} 用时: {:.3f} ms-----".format(workname, send_time, recv_time, usedtime))
            success('socket', workname, usedtime, len(receive_data))
            flag = True

    else:
        # usedtime = time.time() - send_time
        if usedtime >= 20000:
            # failure('socket', workname + t.account, "接收数据超时")
            failure('socket', workname, "接收数据超时，"+resIndex)
            print("接收超时错误！！")
            if  workname=='EMID_GC2CT_REQ_WORLD_BOSS_REVIVE_ENTER_BATTLE_SCENE'or workname=='CMsgGC2CTReqPrepareOk' or workname=='CMsgGC2GWReqCommand_Pet':
                #超时重发
                return False,receive_data, code, send_time, resIndex
            # if workname=='CMsgGC2CTReqEnterChapterTeam':
            #     return False,receive_data, code, send_time, resIndex
        else:
            # failure('socket', workname + t.account, "接收数据错误")
            failure('socket', workname, "接收数据错误，"+ str(2443))
        print("--接收接口{}---用户名: {} -----".format(workname, t.account))
        flag = False
        if workname!='EMID_GC2CT_REQ_DEL_FRIEND' and workname!='CMsgGC2CTReqReleaseSkill_BOSS' and workname!='EMID_GC2CT_REQ_WORLD_BOSS_JOIN_RECORD'and workname!='EMID_GC2CT_REQ_ENTER_WORLD_BOSS' :
            # return
            pass
    return flag, receive_data, code, send_time, resIndex

def send_receiveMany(t, socketdata, api_attr, waittime, headsize, limitime=20.0, norec=False):
    workname = api_attr['name']
    # 发送数据
    flag, send_time = _send_data(t.client, socketdata)
    if not flag:
        failure('socket', workname, "发送数据错误")
        return flag, b'error'
    if norec:
        return flag, b'norecv'
    # 接收数据
    recv_msgs = _recv_data_many(t, api_attr, headsize, limitime)
    for recv in api_attr['recv']:
        workname = recv['name']
        recv_msg = recv_msgs[workname]
        recv_msg['send_time'] = send_time * 1000
        recv_msg['recv_time'] = recv_msg['recv_time'] * 1000
        # 将毫秒规整，不然统计数据太多，不利于统计
        usedtime = int(recv_msg['recv_time'] - recv_msg['send_time'])
        if recv_msg['receive_data'] != b'error':
            success('socket', workname, usedtime, len(recv_msg['receive_data']))
            recv_msg['flag'] = True
        else:
            failure('socket', workname, "接收数据错误")
            return None
        recv_msgs[workname]=recv_msg
    return recv_msgs

def _recv_data_many(t, api_attr, buffersize, limittime):
    # 不同的游戏可以自行修改此接收数据的处理方法，以实现不同的游戏规则
    rst = int(time.time())
    sms = int(time.time() * 1000)
    loop_num = 0
    length =len(api_attr['recv'])
    count=0
    # print("用户:{} 开始接收: {} 当前时间:{} ".format(api_attr['username'], recvcmd, sms))
    recv_msgs = {}
    while loop_num<length+200000:
        recv_msgID = api_attr['recv'][count]['recv_MsgID']
        recv_name = api_attr['recv'][count]['name']
        print("当前接收接口:--{} recv_MsgID: {}".format(recv_name, recv_msgID))
        try:
            ct = int(time.time())
            if ct - rst > limittime:
                # print("接收接口 {} 接收超时 {} * {}".format(api_attr['name'], ct - rst, limittime))
                msg = {'receive_data': b'error', 'code': 0, 'recv_time': time.time(), 'resIndex': 0}
                recv_msgs[recv_name] = msg
                return recv_msgs
            t.client.settimeout(limittime)
            # rev_data = t.client.recv(10240)
            rev_data = t.client.recv(4)
            # if len(rev_data) < 4:
            #     print("收到数据长度为0！！！", len(rev_data))
            #     t.client.sendall(pong())
            #     continue
            if len(rev_data) < 4:
                print("2接收包头长度错误 {}".format(len(rev_data)))
                raise StopLocust("2接收包头长度错误 {}".format(len(rev_data)))

            headers = struct.unpack("I", rev_data[:4])  # 先把PacketSign解出来（4字节），里面包含消息总长度
            offset = 4
            packetSign = headers[0]
            print("packetSign is: 0x{:02x}".format(packetSign))
            totalLen = getTcpPacketLen(packetSign)
            offset = 0
            rev_data = t.client.recv(totalLen)
            while len(rev_data) < totalLen:
                print("2接收包头 {} 长度错误 {}".format(totalLen, len(rev_data)))
                rev_data = rev_data + t.client.recv(totalLen - len(rev_data))
                # raise StopLocust("2接收包头 {} 长度错误 {}".format(totalLen+4, len(rev_data)))
            if isExt(packetSign):
                extBuff = struct.unpack('B', rev_data[offset:])
                if extBuff[0] == 0 or extBuff[0] == 2:
                    print("接收到PING消息, 回复PONG消息 {}".format(extBuff[0]))
                    #CMsgGC2GWAck(t)
                    t.client.sendall(pong())
                    loop_num += 1
                    continue

            head_data = struct.unpack("HHI", rev_data[offset:offset + 8])  # |MsgType 2字节|MsgId 2字节|序列化后的protobuf流长度 4字节|
            t.client.settimeout(limittime)
            print("解析包头============>", head_data)
            protoLen = head_data[2]  # protobuf序列化后的buff长度：67
            offset += 8
            tmpdata = rev_data[offset:]
            print("recv_MsgType：", head_data[0])
            recv_FuncID = api_attr['recv'][count]['recv_FuncID']
            recv_ServId = api_attr['recv'][count]['recv_ServId']
            recv_MsgType = recv_ServId << 8 | recv_FuncID
            # print("计算出的recv_MsgType：", recv_MsgType)
            #if not ((head_data[0] == 2062 and head_data[1] == 7) or (head_data[0] == 2048 and head_data[1] == 1)):
                #CMsgGC2GWAck(t)
            #    pass

            if head_data[0] == 2063 and head_data[1] == 4:
                print("当前接收接口:--{} 收到错误消息！！！！".format(recv_name))
                buff = tmpdata[:protoLen]
                CAccountVerify_data = CErrorMsgInfo()
                CAccountVerify_data.ParseFromString(buff)
                print(CAccountVerify_data)
                msg = {'receive_data': b'error', 'code': 0, 'recv_time': time.time(), 'resIndex': 0}
                recv_msgs[recv_name] = msg
                return recv_msgs


            if head_data[0] == recv_MsgType and head_data[1] == recv_msgID:
                print("接收接口成功,%d=%d" % (head_data[1], recv_msgID))
                recvtime = time.time()
                print("接收接口: {} 接收成功, 用时:{}".format(api_attr['name'], int(time.time() * 1000) - sms))
                buff = tmpdata[:protoLen]
                code = struct.unpack('H', tmpdata[protoLen:protoLen + 2])
                reqIndex = struct.unpack('H', tmpdata[protoLen + 2:protoLen + 4])
                resIndex = struct.unpack('H', tmpdata[protoLen +4:protoLen + 6])
                # print('buffLen: ', buffLen, 'buff: ', buff, 'code: ', code)
                # print("buffLen====>buff: %s" % (buff))
                # print("code ===123123===>", code[0])
                # print("reqIndex ===123123===>", reqIndex[0])
                # print("resIndex ===123123===>", resIndex[0])
                msg = {'receive_data':buff,'code':code[0],'recv_time':recvtime,'resIndex':resIndex[0]}
                recv_msgs[recv_name] = msg
                if count==length-1:
                    return recv_msgs
                else:
                    count+=1
                    continue
            else:
                print("接收接口不成功,%d!=%d" % (head_data[1], recv_msgID))
                continue

        except Exception as e:
            print("接收接口 {} ==socket接收数据时发生错误: {}".format(api_attr['name'], e))
            msg = {'receive_data': b'error', 'code': 0, 'recv_time': time.time(), 'resIndex': 0}
            recv_msgs[recv_name] = msg
            return recv_msgs


def send(sock, socketdata, api_attr, waittime, headsize, limitime=20.0, norec=False):
    workname = api_attr['name']
    # 发送数据
    flag, send_time = _send_data(sock, socketdata, workname)
    if not flag:
        # failure('socket', workname, "发送数据错误")
        return flag, b'error'
    if norec:
        return flag, b'norecv'
    return flag,send_time


def receive(t, socketdata, api_attr, waittime, headsize, send_time = None, count = False,limitime=20.0, norec=False):
    if send_time==None:
        send_time = time.time() * 1000
    workname = api_attr['name']
    # 接收数据
    receive_data, code, recv_time, resIndex = _recv_data(t, api_attr, headsize, limitime)
    recv_time = recv_time * 1000
    # 将毫秒规整，不然统计数据太多，不利于统计
    usedtime = int(recv_time - send_time)
    flag = True
    if count:
        if receive_data != b'error':
            # if usedtime > 3000:
            #     print("发现超过3s的 响应:{} ".format(usedtime))
            print("--接收接口{}-11--发送时间:{} 接收时间:{} 用时: {:.3f} ms-----".format(workname, send_time, recv_time, usedtime))
            success('socket', workname, usedtime, len(receive_data))
            flag = True
        else:
            failure('socket', workname, "接收数据错误"+resIndex)
            flag = False
    return flag, receive_data, code, resIndex


def receive_data(sock, socketdata, api_attr, waittime, headsize, send_time, limitime=20.0, norec=False):
    workname = api_attr['name']
    # 接收数据
    receive_data, code, recv_time,recv_interface = receive_data_(sock, api_attr, headsize, limitime)
    print("kkkkkkkk")
    send_time = send_time * 1000
    recv_time = recv_time * 1000
    # 将毫秒规整，不然统计数据太多，不利于统计
    usedtime = int(recv_time - send_time)
    if recv_interface['recv_MsgID'] == 48:
        if receive_data != b'error':
            # if usedtime > 3000:
            #     print("发现超过3s的 响应:{} ".format(usedtime))
            # print("--接收接口{}---发送时间:{} 接收时间:{} 用时: {:.3f} ms-----".format(workname, send_time, recv_time, usedtime))
            success('socket', workname, usedtime, len(receive_data))
            flag = True
        else:
            failure('socket', workname, "接收数据错误")
            flag = False
    return flag, receive_data, code,recv_interface


def receive_data_(s, api_attr, buffersize, limittime):
    # 不同的游戏可以自行修改此接收数据的处理方法，以实现不同的游戏规则
    print("当前接收接口:--{}".format(api_attr['name']))
    rst = int(time.time())
    sms = int(time.time() * 1000)
    loop_num = 0
    # print("用户:{} 开始接收: {} 当前时间:{} ".format(api_attr['username'], recvcmd, sms))
    while loop_num <= 20:

        try:
            ct = int(time.time())
            if ct - rst > limittime:
                # print("接收接口 {} 接收超时 {} * {}".format(api_attr['name'], ct - rst, limittime))
                recvtime = time.time()
                recvdata = b'error'
                return recvdata, recvtime
            s.settimeout(limittime)
            # rev_data = s.recv(10240)
            rev_data = s.recv(4)
            if len(rev_data) < 4:
                print("1接收包头长度错误 {}".format(len(rev_data)))
                raise StopLocust("1接收包头长度错误 {}".format(len(rev_data)))

            headers = struct.unpack("I", rev_data[:4])  # 先把PacketSign解出来（4字节），里面包含消息总长度
            offset = 4
            packetSign = headers[0]
            print("packetSign is: 0x{:02x}".format(packetSign))
            totalLen = getTcpPacketLen(packetSign)
            offset = 0
            rev_data = s.recv(totalLen)
            while len(rev_data) < totalLen:
                print("2接收包头 {} 长度错误 {}".format(totalLen, len(rev_data)))
                rev_data = rev_data + s.recv(totalLen - len(rev_data))
                # raise StopLocust("2接收包头 {} 长度错误 {}".format(totalLen+4, len(rev_data)))
            if isExt(packetSign):
                extBuff = struct.unpack('B', rev_data[offset:])
                if extBuff[0] == 0 or extBuff[0] == 2:
                    print("接收到PING消息, 回复PONG消息 {}".format(extBuff[0]))
                    t.sendall(pong())
                    loop_num += 1
                    continue

            head_data = struct.unpack("HHI",
                                      rev_data[offset:offset + 8])  # |MsgType 2字节|MsgId 2字节|序列化后的protobuf流长度 4字节|
            s.settimeout(limittime)
            print("解析包头============>", head_data)
            protoLen = head_data[2]  # protobuf序列化后的buff长度：67
            offset += 8
            tmpdata = rev_data[offset:]
            print("llllllllllleneeen: %d" % len(tmpdata))

            # if head_data[1] != recvcmd:
            #     print("接收接口不成功,%d!=%d"%(head_data[1],recvcmd))
            # print(tmpdata.hex())
            # recvtime = time.time()
            # print("接收接口: {} 接收成功, 用时:{}".format(api_attr['name'], int(time.time() * 1000) - sms))
            # buff = tmpdata[:protoLen]
            # code = struct.unpack('H', tmpdata[protoLen:protoLen + 2])
            # # print('buffLen: ', buffLen, 'buff: ', buff, 'code: ', code)
            # print("buffLen====>buff: %s" % (buff))
            # print("code ======>", code[0])
            # return buff, code[0], recvtime
            # 判断recv_MsgType
            print("recv_MsgType：", head_data[0])
            recv_success = False
            for recv_info in api_attr['recv']:
                recv_msgID = recv_info['recv_MsgID']
                recv_FuncID = recv_info['recv_FuncID']
                recv_ServId = recv_info['recv_ServId']
                recv_MsgType = recv_ServId << 8 | recv_FuncID
                print("计算出的recv_MsgType：", recv_MsgType)
                if head_data[0] == recv_MsgType and head_data[1] == recv_msgID:
                    print("接收接口成功,%d=%d" % (head_data[1], recv_msgID))
                    recvtime = time.time()
                    print("接收接口: {} 接收成功, 用时:{}".format(api_attr['name'], int(time.time() * 1000) - sms))
                    buff = tmpdata[:protoLen]
                    code = struct.unpack('H', tmpdata[protoLen:protoLen + 2])
                    # print('buffLen: ', buffLen, 'buff: ', buff, 'code: ', code)
                    # print("buffLen====>buff: %s" % (buff))
                    # print("code ===123123===>", code[0])
                    recv_success = True
                    return buff, code[0], recvtime, recv_info

            if not recv_success:
                print("接收接口不成功,%d!=%d" % (head_data[1], recv_msgID))
                continue

        except Exception as e:
            print("接收接口 {} ==socket接收数据时发生错误: {}".format(api_attr['name'], e))
            recvtime = time.time()
            recvdata = b'error'
            return recvdata, recvtime
