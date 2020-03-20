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
from airtest.core.api import *

using("Tools")
from get_info.information import Information
from game_support.entry_game_ss2 import EntryGameSs2
from game_support.entry_game_sx import EntryGameSx
#from Tools.get_info.information import Information
#from Tools.game_support.entry_game_ss2 import EntryGameSs2
#from Tools.game_support.entry_game_sx import EntryGameSx


class EntryGame:

    def __init__(self):

        self.info = Information()
        self.game_name = self.info.get_config("App_Name", "game_name")
        self.sever_poco = self.info.get_config("Sever_poco", self.game_name)

    def open_game(self, sever_name_input, game_account_input):
        """
        启动游戏并到游戏主界面，返回一个poco对象，用于用例使用
        :return:
        """
        snapshot(msg="上个脚本结束画面")
        home()
        stop_app(self.game_name)
        sleep(2)
        start_app(self.game_name)
        sleep(20)
        poco = self.entry_game(sever_name_input, game_account_input)
        return poco

    def close_game(self):
        """关闭游戏"""
        snapshot(msg="关闭游戏")
        stop_app(self.game_name)


    # 接口方法，后期拓展游戏使用
    def entry_game(self, sever_name_input, game_account_input):
        """
        登录游戏，从游戏启动到进入游戏主界面的一系列操作
        :return:poco
        """
        if self.game_name == "com.youzu.test.qa":  # ss2
            egss2 = EntryGameSs2()
            poco = egss2.entry_game_ss2(sever_name_input, game_account_input)
            return poco
        elif self.game_name == "com.youzu.wgame2":
            egsx = EntryGameSx()
            poco = egsx.entry_game_sx(sever_name_input, game_account_input)
            return poco
        else:
            pass