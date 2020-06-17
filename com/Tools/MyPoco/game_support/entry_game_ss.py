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
from MyPoco.foundation.information import Information
from MyPoco.poco.my_poco_object import MyPocoObject

class EntryGameSs:

    def __init__(self,phone_id):
        self.game_name="com.youzu.android.snsgz"
        self.info = Information()
        self.my_poco = MyPocoObject("少三",phone_id)
        self.phone_id = phone_id

    def entry_game_ss(self, sever_name_input, game_account_input):
        """
        sx的登录游戏，游戏已经启动，到游戏主界面的操作
        :param sever_name_input: 服务器名称，和ini中一致
        :param game_account_input: 需要登录的账号，和ini中一致
        :return:
        """

        game_account = game_account_input
