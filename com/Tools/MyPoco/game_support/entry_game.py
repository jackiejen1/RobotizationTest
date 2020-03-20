# _*_coding:utf-8 _*_
# !/usr/bin/python3
# Reference:********************************
# encoding: utf-8
# @Time: 2019/11/16  14:47
# @Author: 洞洞
# @File: entry_game.py
# @Function:
# @Method:
# Reference:********************************
from foundation.information import Information
from game_support.entry_game_ss2 import EntryGameSs2
from game_support.entry_game_sx import EntryGameSx


class EntryGame:

    def __init__(self,game_name):

        self.info = Information()
        self.game_name=game_name

    # 接口方法，后期拓展游戏使用
    def entry_game(self, sever_name_input, game_account_input,red_info):
        """
        登录游戏，从游戏启动到进入游戏主界面的一系列操作
        :return:poco
        """
        if self.game_name == "com.youzu.test.qa":  # ss2
            egss2 = EntryGameSs2()
            egss2.entry_game_ss2(sever_name_input, game_account_input,red_info)
        elif self.game_name == "com.youzu.wgame2":
            egsx = EntryGameSx(self.game_name)
            egsx.entry_game_sx(sever_name_input, game_account_input,red_info)
        else:
            pass