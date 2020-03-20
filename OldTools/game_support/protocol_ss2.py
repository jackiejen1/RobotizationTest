# _*_coding:utf-8 _*_
# !/usr/bin/python3
# Reference:********************************
# encoding: utf-8
# @Time: 2019/11/20  11:12
# @Author: 洞洞
# @File: protocol_ss2.py
# @Function:
# @Method:
# Reference:********************************

from airtest.core.api import *
from poco.drivers.std import StdPoco

using("Tools")
from get_info.information import Information
from new_poco.my_poco_object import MyPocoObject
from game_support.protocol_dic_test_ss2 import ProtocolDicTestSs2


# from Tools.get_info.information import Information
# from Tools.poco.my_poco_object import MyPocoObject
# from Tools.game_support.protocol_dic_test_ss2 import ProtocolDicTestSs2


class ProtocolSs2:
    def __init__(self):
        self.info = Information()
        self.my_poco = MyPocoObject()


