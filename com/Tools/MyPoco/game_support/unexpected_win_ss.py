# _*_coding:utf-8 _*_
# !/usr/bin/python3
# Reference:********************************
# encoding: utf-8
# @Time: 2019/11/19  18:11
# @Author: 洞洞
# @File: unexpected_win_ss2.py
# @Function:
# @Method:
# Reference:********************************
from time import sleep
from airtest.core.api import *
from MyPoco.foundation.MyException import *
from MyPoco.foundation.make_poco_dic import MakePocoDic


class UnexpectedWinSs:
    def __init__(self, game_name,phone_id):
        self.make_poco_dic = MakePocoDic(game_name,phone_id)

    def unexpected_win(self):
        """
        少三2，识别：更新、天公福利、断网、报错
        :return:
        """
        pass