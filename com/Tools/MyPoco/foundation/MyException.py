# _*_coding:utf-8 _*_
# !/usr/bin/python3
# Reference:********************************
# encoding: utf-8
# @Time: 2020/1/14  16:54
# @Author: 洞洞
# @File: MyException.py
# @Function:
# @Method:
# Reference:********************************
from airtest.core.helper import G


def add_msg_in_log(msg, is_pass=True):
    name = "添加日志"
    if is_pass:  # 默认添加的日志是通过状态
        rizhi = {"name": name, "call_args": {"text": str(msg)}}
    else:
        rizhi = {"name": name, "call_args": {"text": ""}, "traceback": str(msg)}
    G.LOGGER.log("function", rizhi, 1)


class NoneException(Exception):
    '''
    没有节点
    '''

    def __init__(self, msg=""):
        self.msg = str(msg) + "节点没有找到"

    def __str__(self):
        return str(self.msg)

class ProtocolException(Exception):
    '''
    协议异常，一般ret=3的时候会用到
    '''

    def __init__(self, msg=""):
        self.msg = str(msg)

    def __str__(self):
        return str(self.msg)

class NoneStrException(Exception):
    '''
    poco没有str属性
    '''

    def __init__(self, msg=""):
        self.my_msg = msg

    def __str__(self):
        return str("")

class GameNotPassException(Exception):
    '''
    脚本用例最终判定不通过
    '''

    def __init__(self, msg=""):
        self.my_msg = msg

    def __str__(self):
        return str("")


class NotHaveGameException(Exception):
    '''
    游戏没有开启（包括闪退）
    '''

    def __init__(self, msg=""):
        self.my_msg = msg

    def __str__(self):
        return str("")

class NotPocoServeException(Exception):
    '''
    前端poco服务断开连接，重复了
    '''

    def __init__(self, msg=""):
        self.my_msg = msg

    def __str__(self):
        return str("")


class PocoVverstepBoundaryException(Exception):
    '''
    忘了
    '''

    def __init__(self, msg=""):
        self.my_msg = msg

    def __str__(self):
        return str("")


class GameServerStopException(Exception):
    '''
    前端poco服务断开连接
    '''

    def __init__(self, msg=""):
        self.my_msg = msg
        print(self.my_msg)

    def __str__(self):
        return str(self.my_msg)


class GameServerMaintenanceException(Exception):
    '''
    服务器维护
    '''

    def __init__(self, msg=""):
        self.my_msg = msg
        print(self.my_msg)

    def __str__(self):
        return str(self.my_msg)

class GmException(Exception):
    '''
    服务器维护
    '''

    def __init__(self, msg=""):
        self.my_msg = msg
        print(self.my_msg)

    def __str__(self):
        return str(self.my_msg)

class ValueException(Exception):
    '''
    传入参数异常
    '''

    def __init__(self, msg=""):
        self.my_msg = msg
        print(self.my_msg)

    def __str__(self):
        return str(self.my_msg)