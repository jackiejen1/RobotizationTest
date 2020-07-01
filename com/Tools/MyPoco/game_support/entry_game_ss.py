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
        self.my_poco_obj.touch_poco("未命名0/未命名1/default/Panel_20/Panel_login/Button_selectServer/Label_titleServer")#点击服务器，尝试打开服务器界面
        self.my_poco_obj.touch_poco("未命名0/未命名1/未命名0/default/Panel_root/Image_bg/Panel_rangeList/default1/Panel_35/Image_bg1/Label_name")#选择服务器页签
        self.my_poco_obj.touch_poco(sever_name_input)#服务器汉字
        self.my_poco_obj.touch_poco("InputName")#需要连续点击两次“已登陆”，用于注销已有账号
        self.my_poco_obj.touch_poco("未命名0/未命名1/default/Panel_20/Panel_login/Button_inputUser/Label_userName")#需要连续点击两次“已登陆”，用于注销已有账号
        sleep(3)
        self.my_poco_obj.touch_poco("未命名0/未命名1/default/Panel_20/Panel_login/Button_inputUser/Label_userName")#再次点击“已登陆”，弹出注销提示框
        sleep(3)
        anpoco(text="确认").click()#确认注销
        anpoco(text="其他账号登录").click()#弹出登陆框，切换账号
        anpoco(text="游族账号").click()#使用 游族账号 进行登陆
        anpoco("android.widget.FrameLayout").offspring("android:id/content").child("android.widget.RelativeLayout").child("android.widget.LinearLayout").child("android.widget.LinearLayout").child("android.widget.RelativeLayout")[0].offspring("android.widget.ImageView").click()
        anpoco(text="请输入游族账号").click()
        text(game_account_input)
        anpoco(text="请输入密码").click()
        text(password)
        anpoco("android.widget.TextView").click()#点击登陆
        if not self.my_poco_obj.get_poco_any_value("未命名0/未命名1/default/Panel_20/Panel_login/Button_login","touchable"):
            self.my_poco_obj.touch_poco("未命名0/未命名1/default/Panel_20/Panel_login/CheckBox_Protocol")
        self.my_poco_obj.touch_poco("未命名0/未命名1/default/Panel_20/Panel_login/Button_login/Image_12")#点击进入游戏
        self.my_poco_obj.touch_poco("未命名0/未命名1/未命名0/default/Panel_root/Panel_recent/Button_9")
        self.my_poco_obj.touch_poco("未命名0/未命名1/未命名0/default/Panel_root/Panel_recent/Button_5")
        self.my_poco_obj.touch_poco("未命名0/未命名1/未命名0/default/Panel_root/Panel_recent/Button_2")
        self.my_poco_obj.touch_poco("未命名0/未命名1/未命名0/default/Panel_root/Panel_recent/Button_7")#以上9527为进入QA服的密码，输入完毕自动进入游戏
        time.sleep(15)