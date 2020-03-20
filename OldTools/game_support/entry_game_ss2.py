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
from poco.drivers.std import StdPoco

using("Tools")
from get_info.information import Information
from new_poco.my_poco_object import MyPocoObject
#from Tools.get_info.information import Information
#from Tools.poco.my_poco_object import MyPocoObject


class EntryGameSs2:
    def __init__(self):

        self.info = Information()
        self.my_poco = MyPocoObject()
        self.game_name = self.info.get_config("App_Name", "game_name")
        self.sever_poco = self.info.get_config("Sever_poco", self.game_name)

    def entry_game_ss2(self, sever_name_input, game_account_input):
        """
        ss2的登录游戏，游戏已经启动，到游戏主界面的操作
        :param sever_name_input: 服务器名称，和ini一致
        :param game_account_input: 需要登录的账号，和ini一致
        :return:
        """

        self.poco = StdPoco()
        self.my_poco.set_poco(self.poco)
        game_account = self.info.get_config("Account_Number", game_account_input)
        self.my_poco.find_poco("InputName", find_type="name")
        text(game_account)
        # self.poco("InputName").set_text(game_account)
        self.my_poco.find_poco("确 认")
        self.my_poco.find_poco("公 告", click_name="AnnoCloseBtn", click_type="name")
        self.my_poco.find_poco("点击选服")
        self.my_poco.find_poco(self.poco("List_kind_server").child(text="11 - 20区"), find_type="obj",
                               click_list=[0.95, 0.15])  # todo 不同游戏可能要改
        sever_name = self.info.get_config("Sever_Name", sever_name_input)
        self.my_poco.find_poco(self.poco("List_server").offspring(text=sever_name), find_type="obj")
        self.my_poco.find_poco("Txt_guide", find_type="name")  # 关闭新手引导
        self.my_poco.find_poco("Btn_login", find_type="name")  # 开始游戏
        if self.poco("LoginLawPop").child("__view").child("btn_ok").exists():
            self.poco("LoginLawPop").child("__view").child("btn_ok").click()
            self.my_poco.find_poco("Btn_login", find_type="name")  # 开始游戏

        sleep(15)
        if self.poco("RedPacketRainReceiveLayer").child("__view").child("Comp_effect").exists():  # 红包雨
            self.poco("RedPacketRainReceiveLayer").child("__view").child("Comp_effect").click()
            sleep(2)
            stop_app(self.game_name)
            sleep(1)
            home()
            sleep(1)
            start_app(self.game_name)
            sleep(10)
            self.poco = StdPoco()
            self.my_poco.set_poco(self.poco)
            game_account = self.info.get_config("Account_Number", game_account_input)
            self.my_poco.find_poco("InputName", find_type="name")
            text(game_account)
            # self.poco("InputName").set_text(game_account)
            self.my_poco.find_poco("确 认")
            self.my_poco.find_poco("公 告", click_name="AnnoCloseBtn", click_type="name")
            self.my_poco.find_poco("点击选服")
            self.my_poco.find_poco(self.poco("List_kind_server").child(text="1 - 10区"), find_type="obj",
                                   click_list=[0.95, 0.95])  # todo 不同游戏可能要改
            sever_name = self.info.get_config("Sever_Name", sever_name_input)
            self.my_poco.find_poco(self.poco("List_server").offspring(text=sever_name), find_type="obj")
            self.my_poco.find_poco("Txt_guide", find_type="name")  # 关闭新手引导
            self.my_poco.find_poco("Btn_login", find_type="name")  # 开始游戏
            sleep(15)
        for i in range(15):
            if self.poco("Btn_goto").exists():  # 广告
                self.poco("Btn_close").click()
            if self.poco("Comp_day1").exists():  # 签到
                self.poco("__view").child("n3").child("img0").click()
            if self.poco("RedPacketRainPop").child("__view").child("Btn_close").exists():  # 红包雨锦鲤
                self.poco("RedPacketRainPop").child("__view").child("Btn_close").click()
            if self.poco("GodboxPop").exists():  # 天公赐福
                self.poco("Btn_close").click()
        return self.poco
