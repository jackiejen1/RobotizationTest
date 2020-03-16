# _*_coding:utf-8 _*_
# !/usr/bin/python3
# Reference:********************************
# encoding: utf-8
# @Time: 2019/11/19  10:14
# @Author: 洞洞
# @File: entry_game_ss2.py
# @Function:
# @Method:
# Reference:********************************

from airtest.core.api import *

from foundation.information import Information
from poco.my_poco_object import MyPocoObject


class EntryGameSs2:
    def __init__(self,game_name):
        self.game_name=game_name
        self.info = Information()
        self.my_poco_obj = MyPocoObject(self.game_name)

    def entry_game_ss2(self, sever_name_input, game_account_input):
        """
        ss2的登录游戏，游戏已经启动，到游戏主界面的操作
        :param sever_name_input: 服务器名称，和ini一致
        :param game_account_input: 需要登录的账号，和ini一致
        :return:
        """
        snapshot(msg="上个脚本结束画面")
        home()
        stop_app(self.game_name)
        sleep(2)
        start_app(self.game_name)
        sleep(16)
        poco = self.my_poco_obj.new_poco_obj()
        game_account = self.info.get_config("Account_Number", game_account_input)
        self.my_poco_obj.touch_poco("InputName")
        text(game_account)
        # self.poco("InputName").set_text(game_account)
        self.my_poco_obj.touch_poco("确 认")
        sleep(1)
        self.my_poco_obj.touch_poco("AnnoCloseBtn")
        self.my_poco_obj.touch_poco("点击选服")
        self.my_poco_obj.touch_poco("11 - 20区")  # todo 不同游戏可能要改
        sever_name = self.info.get_config("Sever_Name", sever_name_input)
        self.my_poco_obj.touch_poco(sever_name)
        self.my_poco_obj.touch_poco("Txt_guide")  # 关闭新手引导
        self.my_poco_obj.touch_poco("Btn_login")  # 开始游戏
        if self.my_poco_obj.is_in_dic("LoginLawPop/__view/btn_ok"):
            self.my_poco_obj.touch_poco("LoginLawPop/__view/btn_ok")
            self.my_poco_obj.touch_poco("Btn_login")  # 开始游戏

        sleep(15)
        if self.my_poco_obj.is_in_dic("RedPacketRainReceiveLayer/__view/Comp_effect"):  # 红包雨
            self.my_poco_obj.touch_poco("RedPacketRainReceiveLayer/__view/Comp_effect")
            sleep(2)
            stop_app(self.game_name)
            sleep(2)
            start_app(self.game_name)
            sleep(20)
            poco = self.my_poco_obj.new_poco_obj()
            game_account = self.info.get_config("Account_Number", game_account_input)
            self.my_poco_obj.touch_poco("InputName")
            text(game_account)
            self.my_poco_obj.touch_poco("确 认")
            self.my_poco_obj.touch_poco("AnnoCloseBtn")
            self.my_poco_obj.touch_poco("点击选服")
            self.my_poco_obj.touch_poco_obj(poco("List_kind_server").child(text="11 - 20区"),
                                            click_list=[0.95, 0.15])  # todo 不同游戏可能要改
            sever_name = self.info.get_config("Sever_Name", sever_name_input)
            self.my_poco_obj.touch_poco(sever_name)
            self.my_poco_obj.touch_poco("Txt_guide")  # 关闭新手引导
            self.my_poco_obj.touch_poco("Btn_login")  # 开始游戏
            if self.my_poco_obj.is_in_dic("LoginLawPop/__view/btn_ok"):
                self.my_poco_obj.touch_poco("LoginLawPop/__view/btn_ok")
                self.my_poco_obj.touch_poco("Btn_login")  # 开始游戏
            sleep(15)
        for i in range(15):
            print("开始关闭广告")
            if self.my_poco_obj.is_in_dic("Btn_goto"):  # 广告
                print("关闭广告")# todo 没有进来
                self.my_poco_obj.touch_poco("Btn_close")
            if self.my_poco_obj.is_in_dic("Comp_day1"):  # 签到
                self.my_poco_obj.touch_poco("LoginRewardPop/__view/n3/img0")
            if self.my_poco_obj.is_in_dic("RedPacketRainPop/__view/Btn_close"):  # 红包雨锦鲤
                self.my_poco_obj.touch_poco("RedPacketRainPop/__view/Btn_close")

