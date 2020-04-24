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
import time
from MyPoco.poco.my_poco_object import MyPocoObject


class FirstFunctionGoRunSs2:

    def first_function_go_run_ss2(self,phone_id):
        """
        用来跳过一些功能初次进入的引导动画
        :return:
        """
        
        my_poco = MyPocoObject("com.youzu.test.qa",phone_id)

        my_poco.touch_poco("Comp_dungeon/Btn_dungeon") # 副本
        try:
            for i in range(2):
                time.sleep(3)
                my_poco.touch_poco("ComTopBar/Btn_home")
        except:
            pass
        my_poco.touch_poco("HomeBioBtnComp")  # 列传
        try:
            for i in range(4):
                try:
                    my_poco.touch_poco("BtnSkip")
                except:
                    pass
                time.sleep(5)
                my_poco.touch_poco("ComTopBar/Btn_home")
        except:
            pass

        my_poco.touch_poco("Btn_pvp")
        if my_poco.is_this_text("未命名0/module/CampaignLayer/__view/CampainBgLayer/parallaxNode/pvpTitle/title","个人竞技"):
            my_poco.touch_poco("pvpTitle")
            my_poco.touch_poco("竞技场")
        else:
            my_poco.touch_poco("pvpTitle")
        try:
            for i in range(2):
                time.sleep(5)
                my_poco.touch_poco("ComTopBar/Btn_home")
        except:
            pass
        my_poco.touch_poco("Btn_pvp")
        my_poco.touch_poco("无双试炼")
        try:
            for i in range(3):
                time.sleep(5)
                my_poco.touch_poco("ComTopBar/Btn_home")
        except:
            pass
        my_poco.touch_poco("Btn_pvp")
        my_poco.touch_poco("讨伐巨兽")
        try:
            for i in range(2):
                time.sleep(5)
                my_poco.touch_poco("ComTopBar/Btn_home")
        except:
            pass
        my_poco.touch_poco("Btn_pvp")
        my_poco.my_swipe("rebelTitle","pvpTitle")
        my_poco.touch_poco("秘境寻宝")  # 秘境寻宝
        try:
            for i in range(2):
                time.sleep(5)
                my_poco.touch_poco("ComTopBar/Btn_home")
        except:
            pass

