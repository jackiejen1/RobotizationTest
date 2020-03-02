# _*_coding:utf-8 _*_
#!/usr/bin/python3
#Reference:********************************
# encoding: utf-8
#@Time: 2020/3/2  15:39
#@Author: 洞洞
#@File: poco_pos.py
#@Function:
#@Method:
#Reference:********************************
from poco.drivers.std import StdPoco
from airtest.core.api import *

from MyPoco.foundation.information import Information


class PocoPos:
    def __init__(self):
        """
        sleep_time: 点击操作的间隔时间，以手机性能和游戏界面加载速度为准，宁可长，不可短
        在配置文件中配置
        """
        self.info = Information()
        self.sleep_time = self.info.get_config("Poco_Ages","sleep_time")
        self.poco = None
    def set_poco(self):
        self.poco = StdPoco()
        self.phone_size_list_int = self.poco.get_screen_size()
    def touch_pos(self,pos_list_int):
        """
        点击方法
        :param pos_list_int: 控件坐标，控件的pos属性
        :return:
        """
        if self.poco==None:
            self.set_poco()
        x = int(self.phone_size_list_int[0] * pos_list_int[0])
        y = int(self.phone_size_list_int[1] * pos_list_int[1])
        touch([x,y])
        sleep(self.sleep_time)
    def swipe_pos(self,start_pos_list,end_pos_list):
        """
        滑动方法
        :param start_pos_list: 滑动起始控件坐标
        :param end_pos_list: 滑动结束控件坐标
        :param duration_input: 滑动过程持续时间
        :return:
        """
        if self.poco==None:
            self.set_poco()
        start_x = int(self.phone_size_list_int[0] * start_pos_list[0])
        start_y = int(self.phone_size_list_int[1] * start_pos_list[1])
        end_x = int(self.phone_size_list_int[0] * end_pos_list[0])
        end_y = int(self.phone_size_list_int[1] * end_pos_list[1])
        swipe([start_x,start_y],[end_x,end_y],duration =3)
        sleep(self.sleep_time)
