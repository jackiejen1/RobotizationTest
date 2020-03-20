# _*_coding:utf-8 _*_
# !/usr/bin/python3
# Reference:********************************
# encoding: utf-8
# @Time: 2019/11/6  14:58
# @Author: 洞洞
# @File: information.py
# @Function:
# @Method:
# Reference:********************************
import configparser
import re
from airtest.core.api import *
import datetime


class Information:
    def __init__(self):
        self.cf = configparser.ConfigParser()
        # 获取当前文件所在目录的上一级目录，即项目所在目录
        root_dir = os.path.abspath(os.path.dirname(__file__))
        # 拼接得到config.ini文件的路径，直接使用
        self.root_dir_path = root_dir + "\\config.ini"
        self.cf.read(self.root_dir_path)

    def remove_section(self, section_name):
        '''
        删除配置文件中的项
        :param section_name:项名称
        :return:
        '''
        self.cf.remove_section(section_name)
        self.cf.write(open(self.root_dir_path, "w"))

    def is_section_exist(self, section_name):
        '''
        判断配置文件中模块是否存在
        :param section_name:模块名称
        :return:True/False
        '''
        sections_list = self.cf.sections()
        if section_name in sections_list:
            return True
        else:
            return False

    def add_section(self, section_name):
        '''
        在配置文件中添加模块
        :param section_name:模块名称
        :return:
        '''
        self.cf.add_section(section_name)
        self.cf.write(open(self.root_dir_path, "w"))

    def get_config(self, list_name, key):
        """
        从配置文件中读取信息
        :param list_name: 模块名
        :param key: key
        :return: value
        """
        value = self.cf.get(list_name, key)
        return value

    def get_options(self, list_name):
        """
        从配置文件中读取模块下所有key
        :param list_name: 模块名
        :return: keys_list
        """
        keys_list = self.cf.options(list_name)
        return keys_list

    def set_config(self, list_name, key, value):
        """
        设置配置文件中模块下key-value
        :param list_name: 模块名
        :param key: key
        :param value: value
        :return:
        """
        self.cf.set(list_name, key, value)
        self.cf.write(open(self.root_dir_path, "w"))

    def get_time_str(self, str_time_input):
        """
        根据时间戳字符串换算日期和星期
        :param poco_time_input:包含时间戳text的poco对象
        :return: [int(ymd),int(hms),int(week)]
        """
        game_time_int = int(str_time_input)
        dateArray = datetime.datetime.fromtimestamp(game_time_int)
        ymd = dateArray.strftime("%Y%m%d")
        hms = dateArray.strftime("%H%M%S")
        week = dateArray.strptime(ymd, "%Y%m%d").weekday()
        return [int(ymd), int(hms[:-2]), int(week) + 1]

    def get_game_number_l(self, find_number_poco, subscript):
        """
        获取poco对象中text属性中的数字
        :param find_number_poco:
        :param subscript: 0/1
        :return:
        """
        number_str = find_number_poco.get_text()
        number_list = number_str.split("/")
        number = number_list[subscript]
        return int(number)

    def get_game_number(self, find_number_poco):
        """
        只获取poco对象中text属性中的数字
        :param find_number_poco:
        :return:
        """
        number_str = find_number_poco.get_text()
        return int(number_str)

    def get_game_number_instr(self, find_number_poco):
        """
        只获取poco对象中text属性中的数字
        :param find_number_poco:
        :return:
        """
        number_str = find_number_poco.get_text()
        number = filter(str.isdigit, number_str)
        return int(number.__next__())

    def get_game_number_c(self, find_number_poco):
        """
        获取poco对象中text属性中的数字
        :param find_number_poco: ]int[
        :return:
        """
        number_str = find_number_poco.get_text()
        number_list = re.findall("\](.*)\[", number_str)
        return int(number_list[0])

    def get_game_number_cc(self, find_number_poco):
        """
        获取poco对象中text属性中的数字
        :param find_number_poco: ]int）[
        ps:右括号全/半角区别 ）)
        :return:
        """
        number_str = find_number_poco.get_text()
        number_str1 = number_str[-20:]
        number_list = re.findall("\](.*)\）", number_str1)
        return int(number_list[0])

    # def get_poco_pos(self, find_pos_poco):
    #     """
    #     识别手机分辨率，换算ui控件的坐标
    #     :param find_pos_poco:
    #     :return:
    #     """
    #     # [x,y]
    #     pos_list = find_pos_poco.get_position()
    #     # [宽,高]
    #     phone_list = self.get_phone_size()
    #     x = int(phone_list[1] * pos_list[0])
    #     y = int(phone_list[0] * pos_list[1])
    #     return [x, y]

    def get_phone_name(self):
        """
        获取手机的名字，主要用于区分高中端机
        :return:
        """
        lines = os.popen("adb devices -l").readlines()
        total = "model"
        for line in lines:
            if re.findall(total, line):
                # 将这一行，按空格分割成一个list
                lis = line.split(" ")
                #         print(lis)
                for li in lis:
                    if re.findall(total, li):
                        li1 = li.split(":")
                        st = li1[1]
                        phone_name = st
                        return phone_name

    def get_phone_size(self):  # 逐渐废弃
        """获取手机的宽高，分辨率
        return：list_int[宽，高]
        """
        phone_size_str = os.popen("adb shell wm size").read()
        phone_size_str.replace(" ", "")
        phone_size_list_str = phone_size_str.split(":")
        phone_size_list_str = phone_size_list_str[1].split("x")
        wide = phone_size_list_str[0]
        tall = phone_size_list_str[1]
        phone_size_list_int = [int(wide), int(tall)]
        return phone_size_list_int

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

    def text(self, input_str):  # 逐渐废弃
        """
        输入文本，没有回车键，不接受汉字
        :param input_str:需要输入的文本
        :return:
        """
        os.system("adb shell input text " + input_str)

    def text_str(self, input_str):
        """
        输入文本，没有回车键，接受汉字
        :param input_str:需要输入的文本
        :return:
        """
        text(input_str)
        keyevent("DEL")

    def get_poco_visible(self, find_visible_poco):
        """
        获取游戏visible属性中的str值
        :param find_number_poco:poco对象
        :return:str true/false
        """
        visible_value_bool = find_visible_poco.attr("getVisible")
        # visible_value_str = str(visible_value_bool)
        return visible_value_bool

    def get_poco_anyvalue(self, find_name_poco, value_name_str):
        """
        获取游戏poco对象value_name_str属性中的值，需要自行判断类型
        :param find_number_poco:poco对象
        :return:value
        """
        visible_value_bool = find_name_poco.attr(value_name_str)
        # visible_value_str = str(visible_value_bool)
        return visible_value_bool

    def is_exist_poco_log(self, poco_obj, is_exist_str):
        """
        判断传入的控件是否处于显示状态,在报告中体现，用来验证按钮点击后的状态
        :param poco_obj: 需要验证的控件对象
        :param is_exist_str:"显示"or"隐藏"
        :return: bool  True or False
        """

        bool = self.get_poco_visible(poco_obj)
        pos_list = poco_obj.get_position()
        poco_name = poco_obj.get_name()
        if bool and pos_list[0] < 1 and pos_list[1] < 1:
            isit = 1
            is_exist = True
        else:
            isit = 0
            is_exist = False

        if is_exist_str == "隐藏":
            miaoshu = "按钮" + poco_name + "隐藏"
            self.add_log(isit, 0, msg=miaoshu)

        else:
            miaoshu = "按钮" + poco_name + "显示"
            self.add_log(isit, 1, msg=miaoshu)
        return is_exist
    def is_exist_poco(self, poco_obj):
        """
        先判断传入的对象是否存在
        判断传入的控件是否处于显示状态
        :param poco_obj: 需要验证的控件对象
        :return: bool  True or False
        """

        bool = self.get_poco_visible(poco_obj)
        pos_list = poco_obj.get_position()
        if bool and pos_list[0] < 1 and pos_list[1] < 1:
            is_exist = True
        else:
            is_exist = False
        return is_exist

    def game_is_running(self):
        """
        判断游戏还在不在了，判断是否闪退
        :return:
        """
        sleep(3)
        game_name = self.get_config("App_Name", "game_name")
        islist = os.popen("adb shell pidof " + game_name).readlines()
        if len(islist) == 0:
            is_run = False
        else:
            is_run = True
        return is_run
