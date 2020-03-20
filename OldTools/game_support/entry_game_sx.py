# _*_coding:utf-8 _*_
# !/usr/bin/python3
# Reference:********************************
# encoding: utf-8
# @Time: 2019/11/19  10:25
# @Author: 洞洞
# @File: entry_game_sx.py
# @Function:
# @Method:
# Reference:********************************
from airtest.core.api import *
from poco.drivers.std import StdPoco

using("Tools")
from get_info.information import Information
from new_poco.my_poco_object import MyPocoObject
#from Tools.get_info.information import Information
#from Tools.poco.my_poco_object import MyPocoObject


class EntryGameSx:

    def __init__(self):
        self.info = Information()
        self.my_poco = MyPocoObject()
        self.game_name = self.info.get_config("App_Name", "game_name")
        self.sever_poco = self.info.get_config("Sever_poco", self.game_name)

    def entry_game_sx(self, sever_name_input, game_account_input):
        """
        sx的登录游戏，游戏已经启动，到游戏主界面的操作
        :param sever_name_input: 服务器名称，和ini中一致
        :param game_account_input: 需要登录的账号，和ini中一致
        :return:
        """
        poco = StdPoco()
        self.my_poco.set_poco(poco)
        game_account = self.info.get_config("Account_Number", game_account_input)
