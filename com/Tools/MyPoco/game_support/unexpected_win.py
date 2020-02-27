# _*_coding:utf-8 _*_
# !/usr/bin/python3
# Reference:********************************
# encoding: utf-8
# @Time: 2019/11/16  14:19
# @Author: 洞洞
# @File: unexpected_win.py
# @Function:
# @Method:
# Reference:********************************
from MyPoco.foundation.information import Information
from MyPoco.game_support.unexpected_win_ss2 import UnexpectedWinSs2
from MyPoco.game_support.unexpected_win_sx import UnexpectedWinSx


class UnexpectedWin:
    def __init__(self,game_name):
        self.info = Information()
        self.game_name = game_name

    def unexpected_win(self):
        """
        异常弹窗跳过，区分不同的游戏走不同的逻辑
        :param poco_input: poco对象
        :return:
        """

        if self.game_name == "com.youzu.wgame2":
            sxuw = UnexpectedWinSx()
            sxuw.sx_unexpected_win()
        elif self.game_name == "com.youzu.test.qa":
            ss2uw = UnexpectedWinSs2()
            ss2uw.ss2_unexpected_win()
        else:
            pass
