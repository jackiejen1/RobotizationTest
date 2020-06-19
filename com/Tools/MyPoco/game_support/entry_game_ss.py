# _*_coding:utf-8 _*_
# !/usr/bin/python3
# Reference:********************************
# encoding: utf-8
# @Time: 2019/11/19  10:25
# @Author: 洞洞&晓春
# @File: entry_game_sx.py
# @Function:
# @Method:
# Reference:********************************

from MyPoco.foundation.information import Information
from MyPoco.poco.my_poco_object import MyPocoObject
from airtest.core.api import *
from poco.drivers.android.uiautomation import AndroidUiautomationPoco
class EntryGameSs:

    def __init__(self,phone_id):
        self.game_name="com.youzu.android.snsgz"
        self.info = Information()
        self.my_poco_obj = MyPocoObject("少三",phone_id)
        self.phone_id = phone_id

    def entry_game_ss(self, sever_name_input, game_account_input,password):
        """
        sx的登录游戏，游戏已经启动，到游戏主界面的操作
        :param sever_name_input: 服务器名称，和ini中一致
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
        anpoco = AndroidUiautomationPoco(use_airtest_input=True, screenshot_each_action=False)
        self.my_poco_obj.touch_poco("InputName")
        self.my_poco_obj.touch_poco("未命名0/未命名1/default/Panel_20/Panel_login/Button_inputUser/Label_userName")
        sleep(3)
        self.my_poco_obj.touch_poco("未命名0/未命名1/default/Panel_20/Panel_login/Button_inputUser/Label_userName")
        sleep(3)
        anpoco(text="确认").click()
        anpoco(text="其他账号登录").click()
        anpoco(text="游族账号").click()
        anpoco("android.widget.FrameLayout").offspring("android:id/content").child("android.widget.RelativeLayout").child("android.widget.LinearLayout").child("android.widget.LinearLayout").child("android.widget.RelativeLayout")[0].offspring("android.widget.ImageView").click()
        anpoco(text="请输入游族账号").click()
        text(game_account_input)
        anpoco(text="请输入密码").click()
        text(password)
        anpoco("android.widget.TextView").click()
        #todo 选服
        self.my_poco_obj.touch_poco("服务器总表")
        self.my_poco_obj.touch_poco(sever_name_input)
        self.my_poco_obj.touch_poco("未命名0/未命名1/default/Panel_20/Panel_login/Button_login/Image_12")
        self.my_poco_obj.touch_poco("未命名0/未命名1/未命名0/default/Panel_root/Panel_recent/Button_9")
        self.my_poco_obj.touch_poco("未命名0/未命名1/未命名0/default/Panel_root/Panel_recent/Button_5")
        self.my_poco_obj.touch_poco("未命名0/未命名1/未命名0/default/Panel_root/Panel_recent/Button_2")
        self.my_poco_obj.touch_poco("未命名0/未命名1/未命名0/default/Panel_root/Panel_recent/Button_7")
        time.sleep(15)