# _*_coding:utf-8 _*_
# !/usr/bin/python3
# Reference:********************************
# encoding: utf-8
# @Time: 2019/10/8  16:46
# @Author: 洞洞
# @File: yztest2_performance.py
# @Function:使用YZTest进行性能测试
# @Method:
# Reference:********************************

from airtest.core.api import *
from poco.drivers.android.uiautomation import AndroidUiautomationPoco

from foundation.information import Information
from game_support.entry_game import EntryGame


class YzTest2Performance:
    """
    todo 重构
    性能测试类
    """
    def __init__(self):
        self.info = Information()
        self.phone_name = self.info.get_phone_name()
        self.use_name = self.info.get_config("Account_Number", "YzTest2")
        self.game_name = self.info.get_config("App_Name", "game_name")
        # 获取设备型号
        self.high = self.info.get_config("Phone_Model", "high")
        self.medium = self.info.get_config("Phone_Model", "medium")
        self.low = self.info.get_config("Phone_Model", "low")
        self.test = self.info.get_config("Phone_Model", "test")
        self.high_touch_x = self.info.get_config("Coordinate", "high_start_x")
        self.high_touch_y = self.info.get_config("Coordinate", "high_start_y")
        self.medium_touch_x = self.info.get_config("Coordinate", "medium_start_x")
        self.medium_touch_y = self.info.get_config("Coordinate", "medium_start_y")
        self.low_touch_x = self.info.get_config("Coordinate", "low_start_x")
        self.low_touch_y = self.info.get_config("Coordinate", "low_start_y")
        self.test_touch_x = self.info.get_config("Coordinate", "test_start_x")
        self.test_touch_y = self.info.get_config("Coordinate", "test_start_y")
        self.high_end_x = self.info.get_config("Coordinate", "high_end_x")
        self.high_end_y = self.info.get_config("Coordinate", "high_end_y")
        self.medium_end_x = self.info.get_config("Coordinate", "medium_end_x")
        self.medium_end_y = self.info.get_config("Coordinate", "medium_end_y")
        self.low_end_x = self.info.get_config("Coordinate", "low_end_x")
        self.low_end_y = self.info.get_config("Coordinate", "low_end_y")
        self.test_end_x = self.info.get_config("Coordinate", "test_end_x")
        self.test_end_y = self.info.get_config("Coordinate", "test_end_y")
        self.game_name = self.info.get_config("App_Name", "game_name")
        self.eg = EntryGame(self.game_name)

    def first_open_yztest(self):
        '''
        首次启动时使用该方法,不会因为游戏不同而改变
        :return:
        '''
        clear_app("com.youzu.yztest_nosdk")
        home()
        stop_app("com.youzu.yztest_nosdk")
        sleep(2)
        start_app("com.youzu.yztest_nosdk")
        sleep(10)
        self.poco = AndroidUiautomationPoco(use_airtest_input=True, screenshot_each_action=False)
        sleep(1)
        self.poco("请输入用户名")
        sleep(1)
        os.system("adb shell input text " + self.use_name)  # 没有输入框也执行的话也不影响
        self.poco("登录")
        sleep(3)
        # self.poco("总是允许")  # todo 三挡机
        sleep(3)
        self.poco("选择应用")
        sleep(2)
        self.poco(self.game_name, ynlist="下翻页")
        sleep(2)
        self.poco(name="com.youzu.yztest_nosdk:id/auto_screen_shot")  # 每次打开软件是默认关闭的
        # os.system("start /b adb shell sh /data/local/tmp/yztest_sh.sh") 需要平台启动该服务
        sleep(2)

    def start_test(self, sever_name_input, game_account_input):
        """
        开始测试，游戏启动完毕，并返回一个poco对象，用于用例使用
        :return:
        """
        stop_app(self.game_name)
        sleep(1)
        self.poco = AndroidUiautomationPoco(use_airtest_input=True, screenshot_each_action=False)

        self.poco(name="开始测试")
        phone_name = self.info.get_phone_name()
        phone_name_low = self.info.get_config("Phone_Model", "low")
        if phone_name == phone_name_low:
            sleep(20)
        else:
            sleep(10)
        self.eg.entry_game(sever_name_input, game_account_input)


    # 点击标记测试按钮
    def touch_tab(self):
        """点击开始或结束标记按钮
        """
        sleep(1)
        if self.phone_name == self.low:
            touch([int(self.low_touch_x), int(self.low_touch_y)])
        if self.phone_name == self.medium:
            touch([int(self.medium_touch_x), int(self.medium_touch_y)])
        if self.phone_name == self.high:
            touch([int(self.high_touch_x), int(self.high_touch_y)])
        if self.phone_name == self.test:
            touch([int(self.test_touch_x), int(self.test_touch_y)])

    def end_tab(self):
        """
        会直接结束性能测试，需要先结束标记
        """
        sleep(1)
        # 点击退出测试按钮
        if self.phone_name == self.low:
            touch([int(self.low_end_x), int(self.low_end_y)])
        if self.phone_name == self.medium:
            touch([int(self.medium_end_x), int(self.medium_end_y)])
        if self.phone_name == self.high:
            touch([int(self.high_end_x), int(self.high_end_y)])
        if self.phone_name == self.test:
            touch([int(self.test_end_x), int(self.test_end_y)])

        # 点击弹出的确认框
        self.poco(name="退出")
        os.system(
            "adb shell content insert --uri content://settings/system --bind name:s:accelerometer_rotation --bind value:i:0")
        os.system(
            "adb shell content insert --uri content://settings/system --bind name:s:user_rotation --bind value:i:0")
        self.poco(name="上传报告")
        sleep(10)
        # 返回主界面
        self.poco(name="转到上一层级")
        os.system(
            "adb shell content insert --uri content://settings/system --bind name:s:accelerometer_rotation --bind value:i:1")
        sleep(1)

    def close_test(self):
        """测试结束关闭软件，关闭游戏"""
        stop_app("com.youzu.yztest_nosdk")
        sleep(2)
        stop_app(self.game_name)
