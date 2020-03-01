# -*- coding: utf-8 -*-
# @Time    : 2018/7/25 15:02
# @Author  : liaozhj
# @FileName: sendrecvpub.py
# @Software: PyCharm
import struct
import time
from socket import error

# from locust import events
#import lz4ext


class CatchResponseError(Exception):
    pass


def success(restype, workname, response_time, content_size):
#     """
#     记录成功数据
#     :param restype:
#     :param workname:
#     :param response_time:
#     :param content_size:
#     :return: None
#     """
    pass
#     events.request_success.fire(
#         request_type=restype,
#         name=workname,
#         response_time=response_time,
#         response_length=content_size,
#     )


def failure(restype, workname, errormsg):
    """
    记录失败请求
    :param restype: 请求类型(socket,http)
    :param workname: 当前请求名称 例子（ 登录，购买）
    :param errormsg: 错误日志
    :return: None
    """
    exc = CatchResponseError(errormsg)
    # events.request_failure.fire(
    #     request_type=restype,
    #     name=workname,
    #     response_time=0,
    #     exception=exc,
    # )


def _send_data(s, socketdata):

    flag = True
    send_time = time.time()
    try:
        s.send(socketdata)
    except error:
        flag = False
    return flag, send_time


def _recv_data(s, api_attr, buffersize, limittime):
    # 不同的游戏可以自行修改此接收数据的处理方法，以实现不同的游戏规则
    """
        接收socket上的数据，使用了超时设置
        :param s: 接收数据使用的socket
        :param api_attr: 接口属性字典
        :param buffersize: 数据包头大小
        :param limitime: 接收超时时长
        :return: 接收标志与接收到的数据，出错时返回的数据为 b'error'
        """
    recvcmd = api_attr['recv_cmd']
    print("当前接收接口:--{} cmd: {}".format(api_attr['name'], recvcmd))
    rst = int(time.time())
    while True:
        try:
            ct = int(time.time())
            if ct - rst > limittime:
                recvtime = time.time()
                recvdata = b'error'
                failure('socket', api_attr['name'], "ct - rst > limittime")
                return recvdata, recvtime
            s.settimeout(limittime)
            rev_data = s.recv(buffersize)
            print("rev_data-------------->",len(rev_data))
            if len(rev_data) != buffersize:
                recvtime = time.time()
                recvdata = b'error'
                failure('socket', api_attr['name'], "len(rev_data) != buffersize")
                return recvdata, recvtime
                # continue
            if len(rev_data) == 0:
                data = b'error'
                recv_time = time.time()
                failure('socket', api_attr['name'], "len(rev_data) == 0")
                return data, recv_time
            head_data = struct.unpack('>IIQQQ', rev_data)
            print("消息头-->{}".format(head_data))
            s.settimeout(limittime)
            tmpdata = s.recv(head_data[0] - 32)
            while (len(tmpdata) < (head_data[0] - 32)):
                tmpdata += s.recv(head_data[0] - 32 - len(tmpdata))
            recvtime = time.time()
            if head_data[1] == recvcmd:
                recvtime = time.time()
                recvdata = tmpdata
                return recvdata, recvtime
        except Exception as e:
            print("socket接收数据时发生错误")
            print("具体错误 {}".format(e))
            recvtime = time.time()
            recvdata = b'error'
            failure('socket', api_attr['name'], "具体错误 {}".format(e))
            return recvdata, recvtime


def recv_data(sock, api_attr, headsize, norecv=False, limitime=30):
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
    send_time = time.time()
    flag = True
    if not flag:
        failure('socket', workname, "send socket data error")
        return flag, b'error'
    else:
        print("send data success")
    if norecv:
        return flag, b'norecv'
    receive_data, recv_time = _recv_data(sock, api_attr, headsize, limitime)
    send_time = send_time * 1000
    recv_time = recv_time * 1000
    # 将毫秒规整，不然统计数据太多，不利于统计
    usedtime = int(recv_time - send_time)
    print("-----发送时间:{} 接收时间:{} 用时: {:.3f} ms-----".format(send_time, recv_time, usedtime))
    if receive_data != b'error':
        success('socket', workname, usedtime, len(receive_data))
        flag = True
    else:
        #failure('socket', workname, "recv_data recv socket data errror")
        flag = False
    return flag, receive_data


def send_receive(sock, socketdata, api_attr, headsize, norecv=False, limitime=30):
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
    flag, send_time = _send_data(sock, socketdata)
    if not flag:
        failure('socket', workname, "send socket data error")
        return flag, b'error'
    else:
        print("send data success")
    if norecv:
        return flag, b'norecv'
    receive_data, recv_time = _recv_data(sock, api_attr, headsize, limitime)
    send_time = send_time * 1000
    recv_time = recv_time * 1000
    # 将毫秒规整，不然统计数据太多，不利于统计
    usedtime = int(recv_time - send_time)
    print("-----发送时间:{} 接收时间:{} 用时: {:.3f} ms-----".format(send_time, recv_time, usedtime))
    if receive_data != b'error':
        success('socket', workname, usedtime, len(receive_data))
        flag = True
    else:
        #failure('socket', workname, "recv socket data errror")
        flag = False
    return flag, receive_data
