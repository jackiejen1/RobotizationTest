# _*_coding:utf-8 _*_
# !/usr/bin/python3
# Reference:********************************
# encoding: utf-8
# @Time: 2020/3/2  10:33
# @Author: 洞洞
# @File: xn_test_tools.py
# @Function:
# @Method:
# Reference:********************************
import os
import re
from time import sleep

from airtest.core.api import *
from foundation.information import Information
from airtest.core.android.adb import *


class XnTest:
    def __init__(self):
        # 创建对象后就获取手机分辨率
        # 先链接手机
        self.phone_size_list_int = None
        self.sleep_time = None
        self.get_size()
        self.set_sleep_time()
        self.dev = connect_device("Android:///")

    def set_sleep_time(self):
        """
        根据手机机型，在配置表里查询该机型的操作间隔时间
        :return:
        """
        self.info = Information()
        phone_name = self.info.get_phone_name()
        model_sleep_time_dic = eval(self.info.get_config("Phone_Model", "model_sleeptime"))
        if phone_name == model_sleep_time_dic["high"][0]:
            self.sleep_time = model_sleep_time_dic["high"][1]
        elif phone_name == model_sleep_time_dic["medium"][0]:
            self.sleep_time = model_sleep_time_dic["medium"][1]
        elif phone_name == model_sleep_time_dic["low"][0]:
            self.sleep_time = model_sleep_time_dic["low"][1]
        else:
            self.sleep_time = 3
            print("当前机型不是性能测试机型")

    def get_size(self):
        """
        获取手机的宽高
        return：[宽，高]
        """
        phone_size_str = os.popen("adb shell wm size").read()
        phone_size_str.replace(" ", "")
        phone_size_list_str = phone_size_str.split(":")
        phone_size_list_str = phone_size_list_str[1].split("x")
        wide = int(phone_size_list_str[0])  # 宽
        tall = int(phone_size_list_str[1])  # 高
        self.phone_size_list_int = [tall, wide]
        print("手机分辨率(%d,%d)" % (tall, wide))
        if wide == 0 or tall == 0:
            print("获取手机分辨率失败")
            raise Exception("获取手机分辨率失败")
        return self.phone_size_list_int

    def xn_touch(self, pos_list_int):
        """
        横屏
        直接调用底层Android框架，只需要执行点击操作，不需要截图添加日志
        根据控件位置在屏幕的百分比进行点击操作
        :param pos_list_int:控件的pos属性
        :return:
        """
        x = int(self.phone_size_list_int[0] * pos_list_int[0])
        y = int(self.phone_size_list_int[1] * pos_list_int[1])
        self.dev.shell("input tap %d %d" % (x, y))
        print("点击坐标(%d,%d)完成" % (x, y))
        sleep(self.sleep_time)

    def xn_swipe(self, start, end):
        """
        直接调用底层Android框架，只需要执行滑动操作，不需要截图添加日志
        根据控件位置在屏幕的百分比进行点击操作
        :param start: 开始控件pos
        :param end: 结束控件pos
        :return:
        """
        start_x = int(self.phone_size_list_int[0] * start[0])
        start_y = int(self.phone_size_list_int[1] * start[1])
        end_x = int(self.phone_size_list_int[0] * end[0])
        end_y = int(self.phone_size_list_int[1] * end[1])
        self.dev.swipe((start_x,start_y), (end_x,end_y), duration=3)
        sleep(self.sleep_time)
