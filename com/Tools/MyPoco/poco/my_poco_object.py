# _*_coding:utf-8 _*_
# !/usr/bin/python3
# Reference:********************************
# encoding: utf-8
# @Time: 2019/10/9  10:38
# @Author: 洞洞
# @File: my_poco_object.py
# @Function:可以先初始化该类，但必须启动app之后再初始化poco对象，且需调用set_poco方法
# @Method:
# Reference:********************************
import threading

from airtest.core.api import *
from poco.drivers.std import StdPoco
from poco.drivers.android.uiautomation import AndroidUiautomationPoco

import re, time

from MyPoco.poco.make_poco_dic import MakePocoDic
from information import Information
from unexpected_win import UnexpectedWin


class MyPocoObject():

    def __init__(self):
        """
        创建依赖对象，保存全局信息
        """
        self.make_poco_dic = MakePocoDic()
        self.info = Information()
        self.uw = UnexpectedWin()
        self.poco = None

    def new_poco_obj(self, game_name):
        """
        游戏启动之后启动该方法
        根据游戏不同创建不同的poco对象，用来刷新poco_dic数据
        先运行此方法，然后才能使用其他方法
        """
        if game_name == "com.youzu.test.qa" or game_name == "com.youzu.wgame2":
            self.poco = StdPoco()
        elif game_name == "com.youzu.yztest_nosdk":
            self.poco = AndroidUiautomationPoco(use_airtest_input=True, screenshot_each_action=False)
        self.make_poco_dic.set_poco(self.poco)
        return self.poco

    def my_swipe(self, start_path, end_path, timein=2):
        """
        传入两个坐标进行滑动
        :param start_path:开始点路径
        :param end_path:结束点路径
        :return:起、止点坐标
        """
        self.uw.unexpected_win()
        start, end = self.make_poco_dic.my_swipe(start_path, end_path, duration=timein)
        time.sleep(1)
        return start, end

    def touch_poco(self, poco_path):
        """
        需要查找的控件路径
        :param find_name:需要查找的控件路径
        :return:
        raise：PocoNoSuchNodeException、RpcTimeoutError
        """
        self.uw.unexpected_win()
        self.make_poco_dic.my_touch(poco_path)
        time.sleep(1)

    def touch_poco_obj(self, poco_obj, click_list):
        """
        :param find_poco:查找的poco对象
        :param click_list:控件点击偏移点[0,0]-[1,1]范围
        :return:
        raise：PocoNoSuchNodeException、RpcTimeoutError
        """
        self.uw.unexpected_win()
        poco_obj.click(click_list)
        time.sleep(1)
        self.make_poco_dic.renovate_and_get_poco_dic()

    def is_exist_poco_log(self, poco_path, is_exist_str):
        """
        判断传入的控件是否处于显示状态,在报告中体现，用来验证按钮点击后的状态
        :param poco_path: 需要验证的控件
        :param is_exist_str:"显示"or"隐藏"
        :return: bool  True or False
        """
        bool = self.is_exist_poco(poco_path)
        poco_name = self.make_poco_dic.get_poco_any_value(poco_path, "name")
        if bool:
            isit = 1
        else:
            isit = 0

        if is_exist_str == "隐藏":
            miaoshu = "按钮" + poco_name + "隐藏"
            self.add_log(isit, 0, msg=miaoshu)

        else:
            miaoshu = "按钮" + poco_name + "显示"
            self.add_log(isit, 1, msg=miaoshu)
        return bool

    def is_in_dic(self, poco_path):
        return self.make_poco_dic.is_in_dic(poco_path)

    def is_exist_poco(self, poco_path):
        """
        先判断传入的对象是否存在
        判断传入的控件是否处于显示状态
        :param poco_obj: 需要验证的控件对象
        :return: bool  True or False
        """

        bool = self.make_poco_dic.get_poco_visible(poco_path)
        pos_list = self.make_poco_dic.get_poco_any_value(poco_path, 'pos')
        if bool and pos_list[0] < 1 and pos_list[1] < 1:
            is_exist = True
        else:
            is_exist = False
        return is_exist

    def text_str(self, input_str):
        """
        输入文本，没有回车键，接受汉字
        :param input_str:需要输入的文本
        :return:
        """
        text(input_str)
        keyevent("DEL")

    def add_log(self, first, second, msg=""):
        """
        在报告中添加日志信息，对比两个值，判断是否通过
        :param first: int、str
        :param second: int、str
        :param msg: 描述
        :return:
        """
        try:
            if first == second:
                st = msg + "正常"
            else:
                st = msg + "异常"
            assert_equal(first, second, st)
        except AssertionError:
            pass

    def get_game_number_l(self, poco_path, subscript):
        """
        获取poco对象中text属性中的数字
        :param poco_path:
        :param subscript: 0/1
        :return:
        """
        number_str = self.make_poco_dic.get_poco_any_value(poco_path, "text")
        number_list = number_str.split("/")
        number = number_list[subscript]
        return int(number)

    def get_game_number(self, poco_path):
        """
        只获取poco对象中text属性中的数字
        :param poco_path:
        :return:
        """
        number_str = self.make_poco_dic.get_poco_any_value(poco_path, "text")
        return int(number_str)

    def get_game_number_instr(self, poco_path):
        """
        只获取poco对象中text属性中的数字
        :param poco_path:
        :return:
        """
        number_str = self.make_poco_dic.get_poco_any_value(poco_path, "text")
        number = filter(str.isdigit, number_str)
        return int(number.__next__())

    def get_game_number_c(self, poco_path):
        """
        获取poco对象中text属性中的数字
        :param poco_path: ]int[
        :return:
        """
        number_str = self.make_poco_dic.get_poco_any_value(poco_path, "text")
        number_list = re.findall("\](.*)\[", number_str)
        return int(number_list[0])

    def get_game_number_cc(self, poco_path):
        """
        获取poco对象中text属性中的数字
        :param poco_path: ]int）[
        ps:右括号全/半角区别 ）)
        :return:
        """
        number_str = self.make_poco_dic.get_poco_any_value(poco_path, "text")
        number_str1 = number_str[-20:]
        number_list = re.findall("\](.*)\）", number_str1)
        return int(number_list[0])

    def close_game(self, game_name):
        """关闭游戏"""
        snapshot(msg="关闭游戏")
        stop_app(game_name)
        thread_file_name = str(threading.get_ident())
        self.info.remove_option("Phone_Size", thread_file_name)

    def get_log_path(self, file_name):
        """
        将脚本的__file__属性传入，获取脚本的log存放路径
        :param file_name: __file__
        :param name:文件名称
        :return: log存放路径
        """
        return self.make_poco_dic.get_log_path(file_name)

    def end_log(self, file_name, log_path, outputname):
        """
        生成测试报告，目前限测试使用,todo  后续考虑使用线程号区分
        :param file_name: __file__
        :param log_path: log存放路径，通过get_log_path获得
        :param outputname：文件名称,通过get_log_path获得
        :return:
        """
        self.make_poco_dic.end_log(file_name, log_path, outputname)

    def get_poco_visible(self, poco_path):
        """
        获取游戏visible属性中的值
        :param poco_path:poco路径
        :return True/False
        :raise
        """
        return self.make_poco_dic.get_poco_visible(poco_path)

    def get_poco_any_value(self, poco_path, value_name_str):
        """
        获取游戏poco对象value_name_str属性中的值
        :param poco_path:poco_path
        :return: str value
        """
        return self.make_poco_dic.get_poco_any_value(poco_path, value_name_str)