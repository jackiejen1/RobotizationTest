# _*_coding:utf-8 _*_
# !/usr/bin/python3
# Reference:********************************
# encoding: utf-8
# @Time: 2019/12/13  17:58
# @Author: 洞洞
# @File: first_function_go_run_ss2.py
# @Function:
# @Method:
# Reference:********************************
from airtest.core.api import *
from poco.drivers.std import StdPoco

using("Tools")
from new_poco.my_poco_object import MyPocoObject
# from Tools.poco.my_poco_object import MyPocoObject


class FirstFunctionGoRunSs2:

    def first_function_go_run_ss2(self):
        """
        用来跳过一些功能初次进入的引导动画
        :return:
        """
        my_poco = MyPocoObject()
        poco = StdPoco()
        my_poco.set_poco(poco)
        my_poco.find_poco(poco("Comp_dungeon").child("Btn_dungeon"), find_type="obj")  # 副本
        try:
            for i in range(2):
                sleep(3)
                my_poco.find_poco(poco("ComTopBar").child("Btn_home"), find_type="obj")
        except Exception:
            pass
        my_poco.find_poco("HomeBioBtnComp", find_type="name")  # 列传
        try:
            for i in range(10):
                try:
                    my_poco.find_poco("BtnSkip", find_type="name")
                except Exception:
                    try:
                        my_poco.find_poco("Btn_return", find_type="name")
                    except Exception:
                        pass
            sleep(5)
            my_poco.find_poco(poco("ComTopBar").child("Btn_home"), find_type="obj")

        except Exception:
            pass

        my_poco.find_poco("Btn_pvp", find_type="name")
        my_poco.find_poco("竞技场")
        try:
            for i in range(2):
                sleep(5)
                my_poco.find_poco(poco("ComTopBar").child("Btn_home"), find_type="obj")
        except Exception:
            pass
        my_poco.find_poco("Btn_pvp", find_type="name")
        my_poco.find_poco("无双试炼")
        try:
            for i in range(3):
                sleep(5)
                my_poco.find_poco(poco("ComTopBar").child("Btn_home"), find_type="obj")
        except Exception:
            pass
        my_poco.find_poco("Btn_pvp", find_type="name")
        my_poco.find_poco("讨伐巨兽")
        try:
            for i in range(2):
                sleep(5)
                my_poco.find_poco(poco("ComTopBar").child("Btn_home"), find_type="obj")
        except Exception:
            pass
        my_poco.find_poco("Btn_pvp", find_type="name")
        my_poco.my_swipe(poco(text="讨伐巨兽"), poco(text="竞技场"))
        my_poco.find_poco("秘境寻宝")  # 秘境寻宝
        try:
            for i in range(2):
                sleep(5)
                my_poco.find_poco(poco("ComTopBar").child("Btn_home"), find_type="obj")
        except Exception:
            pass

