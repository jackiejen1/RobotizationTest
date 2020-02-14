# _*_coding:utf-8 _*_
# !/usr/bin/python3
# Reference:********************************
# encoding: utf-8
# @Time: 2020/1/14  17:08
# @Author: 洞洞
# @File: make_poco_dic.py
# @Function:
# @Method:
# Reference:********************************
import threading
from information import Information
from airtest.core.api import *
from MyException import *
from airtest.report.report import simple_report
from airtest.utils.compat import script_dir_name


class MakePocoDic:
    def __init__(self):
        self.thread_file_name = str(threading.get_ident())
        self.info = Information()
        path, name = script_dir_name(__file__)
        self.logpath = path + "/" + name[:-3] + "/" + name
        self.complete_poco_path = None

    def set_poco(self, poco):
        self.poco = poco
        self.phone_size_list = self.poco.get_screen_size()
        self.info.set_config("Phone_Size", self.thread_file_name, str(self.phone_size_list))
        self.renovate_and_get_poco_dic()

    # todo 这里会报错，断开连接的错误
    def renovate_and_get_poco_dic(self):
        """
        基础方法
        根据线程ID，刷新并读取对应本地的poco_dic,调用此方法前需要先调用set_poco()
        目前只适配poco—lua ，安卓、unity后续添加
        :return: poco_dic
        """
        sleep(1)
        self.poco("未命名").exists()
        file_path = "D:\\poco_list_file\\" + self.thread_file_name + ".txt"
        with open(file_path) as f:
            poco_name_dic_str_list = f.readlines()
        self.poco_dic = eval(poco_name_dic_str_list[0])
        print("刷新数据完成")
        return self.poco_dic

    def get_poco_dic(self):
        file_path = "D:\\poco_list_file\\" + self.thread_file_name + ".txt"
        with open(file_path) as f:
            poco_name_dic_str_list = f.readlines()
        self.poco_dic = eval(poco_name_dic_str_list[0])
        print("获取数据完成")
        return self.poco_dic

    def get_poco_name_path_list(self):
        print("获取列表，刷新poco")
        self.renovate_and_get_poco_dic()
        poco_name_path_list = self.poco_dic["ui_path_list"]
        return poco_name_path_list

    def is_in_dic(self, poco_path):
        # 先判断在不在地址表里面
        if poco_path in self.poco_dic["ui_path_list"]:
            print("找到路径")
            return True
        # 再判断在不在路径里面
        if poco_path in self.poco_dic.keys():
            print("找到路径")
            return True
        # 看看某些唯一路径存不存在简写
        for dic_key in self.poco_dic.keys():
            if poco_path in dic_key:
                # 是简写路径的话就把完整路径传递出去
                self.complete_poco_path = dic_key
                print("获取完整路径完成")
                return True
        return False

    def get_poco_pos(self, poco_path):
        """
        基础方法
        识别手机分辨率，换算ui控件的坐标
        :param poco_path:
        :return:[x, y]
        """
        for i in range(3):
            if self.is_in_dic(poco_path):
                # [x,y]
                # 判断poco_path是否是简写路径
                if self.complete_poco_path == None:
                    pos_list = self.poco_dic[poco_path]['pos']
                else:
                    # 是简写路径就采用完整路径
                    pos_list = self.poco_dic[self.complete_poco_path]['pos']
                    self.complete_poco_path = None
                # [宽,高]
                phone_list_str = self.info.get_config("Phone_Size", self.thread_file_name)
                phone_list = eval(phone_list_str)
                # 取整
                print(poco_path)
                print(pos_list)
                x = int(phone_list[0] * pos_list[0])
                y = int(phone_list[1] * pos_list[1])
                print([x, y])
                return [x, y]
            else:  # 还是有问题
                sleep(3)
                print("第" + str(i + 1) + "次未找到，再次查找" + poco_path)
                self.renovate_and_get_poco_dic()
                if i >= 2:
                    raise NoneException(poco_path)

    def my_touch(self, poco_path):
        touch_int_list = self.get_poco_pos(poco_path)
        touch(touch_int_list)
        print("点击坐标" + str(touch_int_list) + "完成")
        self.renovate_and_get_poco_dic()

    def my_swipe(self, start_path, end_path, duration=2):
        start = self.get_poco_pos(start_path)
        end = self.get_poco_pos(end_path)
        swipe(start, end, duration=duration)
        print(str(start) + "滑动至" + str(end) + "完成")
        self.renovate_and_get_poco_dic()
        return start, end

    def get_poco_visible(self, poco_path):
        """
        获取游戏visible属性中的str值
        :param poco_path:poco路径
        :return:True/False
        """
        if self.is_in_dic(poco_path):
            visible_value_bool = self.poco_dic[poco_path]["getVisible"]
            return visible_value_bool
        else:
            raise NoneException

    def get_poco_text(self, poco_path):
        """
        获取游戏visible属性中的str值
        :param poco_path:poco对象
        :return:True/False
        """
        if self.is_in_dic(poco_path):
            if self.complete_poco_path != None:
                visible_value_bool = self.poco_dic[self.complete_poco_path]["text"]
                self.complete_poco_path = None
            else:
                visible_value_bool = self.poco_dic[poco_path]["text"]
            if visible_value_bool == "":
                raise NoneStrException
            return visible_value_bool
        else:
            raise NoneException

    def get_poco_any_value(self, poco_path, value_name_str):
        """
        获取游戏poco对象value_name_str属性中的值
        :param poco_path:poco_path
        :return: str value
        """
        if self.is_in_dic(poco_path):
            visible_value_bool = self.poco_dic[poco_path][value_name_str]
            # visible_value_str = visible_value_bool
            if visible_value_bool == "":
                raise NoneStrException
            return visible_value_bool
        else:
            raise NoneException

    def get_log_path(self, file_name):
        """
        将脚本的__file__属性传入，获取脚本的log存放路径
        :param file_name: __file__
        :param name:文件名称
        :return: log存放路径
        """
        self.input_file_name = file_name
        path, name = script_dir_name(file_name)
        self.log_path = path + "/" + name[:-3] + ".air/log"
        self.file_name = name[:-3]
        return self.log_path, self.file_name

    def end_log(self):
        """
        生成测试报告，目前限测试使用,todo  后续考虑使用线程号区分
        :param file_name: __file__
        :return:
        """
        outputname = self.file_name + "_log.html"
        simple_report(self.input_file_name, logpath=self.log_path, output=outputname)
