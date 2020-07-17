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

from airtest.core.api import *
from MyPoco.foundation.information import Information
from MyPoco.poco.my_poco_object import MyPocoObject
from MyPoco.airtestide_lack_packages.poco.drivers.android.uiautomation import AndroidUiautomationPoco

class EntryGameSx:

    def __init__(self,phone_id):
        self.game_name="com.youzu.wgame2"
        self.info = Information()
        self.my_poco_obj = MyPocoObject("少西",phone_id)
        self.phone_id = phone_id

    def entry_game_sx(self, sever_name_input, game_account_input):
        """
        sx的登录游戏，游戏已经启动，到游戏主界面的操作
        :param sever_name_input: 服务器名称，和ini中一致,少西默认二服
        :param game_account_input: 需要登录的账号，和ini中一致
        :return:
        """
        home()
        snapshot()
        stop_app(self.game_name)
        time.sleep(2)
        start_app(self.game_name)
        if ("emulator" in self.phone_id) or ("127.0.0.1:"in self.phone_id):
            time.sleep(40)
        else:
            time.sleep(25)
        poco_android = AndroidUiautomationPoco(use_airtest_input=True, screenshot_each_action=False)
        if poco_android("android.widget.LinearLayout").child("android.widget.LinearLayout").exists():
            poco_android("android.widget.LinearLayout").child("android.widget.LinearLayout")[0].click()
        self.my_poco_obj.touch_poco("我知道了") 
        self.my_poco_obj.touch_poco("账号登录")
        self.my_poco_obj.touch_poco("LoginScene/未命名4/Node/holder/input_user")
        time.sleep(1)
        text(game_account_input)
        # self.my_poco_obj.touch_poco("LoginScene/未命名4/Node/holder/input_pwd")
        # text(newUser)
        self.my_poco_obj.touch_poco("确 认")
        time.sleep(1)
        self.my_poco_obj.touch_poco("点击选服")
        self.my_poco_obj.touch_poco(
            "LoginScene/popupRootNode/popModalLayer/未命名0/Node/Panel_content/Panel_server_group/未命名0/未命名0/未命名0/未命名1/Panel_myserver/Text_server_name")
        time.sleep(1)
        self.my_poco_obj.touch_poco(
            "LoginScene/popupRootNode/popModalLayer/未命名0/Node/Panel_content/Panel_server_show/Node0/btn_bg_right/label_name")
        self.my_poco_obj.touch_poco("LoginScene/未命名3/Layer/Node_agree/check_agree")
        self.my_poco_obj.touch_poco("开始游戏")
        time.sleep(6)
        self.my_poco_obj.touch_poco("点击屏幕继续")
        time.sleep(75)
        # 男性
        self.my_poco_obj.touch_poco("Panel_layoutContent/Node_male/Button_avatar")
        time.sleep(1)
        #  随机角色名
        self.my_poco_obj.touch_poco("Panel_layoutContent/Node_bottom/Button_random")
        time.sleep(1)
        # 输入角色名 （需退格）
        self.my_poco_obj.touch_poco("Node_input")
        for i in range(7):
            keyevent("DEL")
        text(game_account_input[3:])
        keyevent("ENTER")
        # 开始游戏
        self.my_poco_obj.touch_poco("txt_sys_createrole_button_2")
        time.sleep(30)