# _*_coding:utf-8 _*_
# !/usr/bin/python3
# Reference:********************************
# encoding: utf-8
# @Time: 2019/11/16  15:18
# @Author: 洞洞
# @File: fight.py
# @Function:
# @Method:
# Reference:********************************

from airtest.core.api import *

using("Tools")
from get_info.information import Information
from game_support.fight_ss2 import FightSs2
from game_support.fight_sx import FightSx
#from Tools.game_support.fight_ss2 import FightSs2
#from Tools.game_support.fight_sx import FightSx
#from Tools.get_info.information import Information


class Fight:
    """
    后续需要废弃，改为gm后台发送经验进行升级，不需要循环打副本
    """
    def __init__(self):
        self.info = Information()
        self.game_name = self.info.get_config("App_Name", "game_name")


    def to_fight(self, sections_name, find_type1, click_name1, ynlist1, click_type1,
                 number_of_times, find_level):
        """
        重复战斗功能，用于练级等需要手动提升等级的操作
        :param 参数列表同find_poco，但不含click_list
        :param number_of_times: 战斗几次
        :param find_level: 到什么等级停止
        :return:
        """
        if self.game_name == "com.youzu.test.qa":
            fgss2 = FightSs2()
            fgss2.ss2_fight(sections_name, find_type1, click_name1, ynlist1, click_type1, number_of_times, find_level)
        elif self.game_name == "com.youzu.wgame2":
            fgsx = FightSx()
            fgsx.sx_fight(sections_name, find_type1, click_name1, ynlist1, click_type1, number_of_times, find_level)

        else:
            pass


