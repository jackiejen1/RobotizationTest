# _*_coding:utf-8 _*_
# !/usr/bin/python3
# Reference:********************************
# encoding: utf-8
# @Time: 2019/11/20  11:12
# @Author: 洞洞
# @File: protocol.py
# @Function:
# @Method:
# Reference:********************************

from airtest.core.api import *

using("Tools")
from get_info.information import Information
from game_support.protocol_ss2 import ProtocolSs2
# from Tools.get_info.information import Information
# from Tools.game_support.protocol_ss2 import ProtocolSs2


class Protocol:
    def __init__(self):
        self.info = Information()
        self.game_name = self.info.get_config("App_Name", "game_name")
        if self.game_name == "com.youzu.test.qa":
            pass
        else:
            pass
