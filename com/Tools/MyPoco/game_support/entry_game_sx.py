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
from foundation.information import Information
from poco.my_poco_object import MyPocoObject


class EntryGameSx:

    def __init__(self,game_name):
        self.game_name=game_name
        self.info = Information()
        self.my_poco = MyPocoObject(self.game_name)


    def entry_game_sx(self, sever_name_input, game_account_input,red_info):
        """
        sx的登录游戏，游戏已经启动，到游戏主界面的操作
        :param sever_name_input: 服务器名称，和ini中一致
        :param game_account_input: 需要登录的账号，和ini中一致
        :return:
        """
        if red_info:
            game_account = self.info.get_config(self.game_name, game_account_input)
        else:
            game_account = game_account_input
