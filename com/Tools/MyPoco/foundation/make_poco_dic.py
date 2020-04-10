# _*_coding:utf-8 _*_
# !/usr/bin/python3
# Reference:********************************
# encoding: utf-8
# @Time: 2020/1/14  17:08
# @Author: 洞洞
# @File: make_poco_dic.py
# @Function:框架基础类，不要直接在脚本中调用，编写辅助脚本使用MyPocoObject类
#           用于拓展框架函数使用
# @Method:
# Reference:********************************
import threading

from airtest.core.api import *

from airtest.report.report import simple_report

from airtestide_lack_packages.compat import script_dir_name

from foundation.MyException import *
from foundation.information import Information


class MakePocoDic:
    def __init__(self, phone_id):
        self.thread_file_name = str(threading.get_ident())
        self.info = Information()
        path, name = script_dir_name(__file__)
        self.logpath = path + "/" + name[:-3] + "/" + name
        self.complete_poco_path = None
        self.gpd = GetPocoDic(phone_id)
        self.phone_size_list = self.gpd.phone_size
        # 处理一下横竖屏
        if self.phone_size_list['orientation'] == 0 or 2 :
            self.phone_size_list = [self.phone_size_list["width"], self.phone_size_list["height"]]  # 竖屏[x,y]
        else:
            self.phone_size_list = [self.phone_size_list["height"], self.phone_size_list["width"]]  # 横屏[x,y]
        self.poco_dic = None

    # def set_poco(self, poco):
    #     self.poco = poco
    #     self.phone_size_list = self.poco.get_screen_size()
    #     # self.info.set_config("Phone_Size", self.thread_file_name, str(self.phone_size_list))
    #     self.renovate_and_get_poco_dic()

    # def renovate_and_get_poco_dic(self):  # 废弃
    #     """
    # 基础方法
    # 根据线程ID，刷新并读取对应本地的poco_dic,调用此方法前需要先调用set_poco()
    # 目前只适配poco—lua ，安卓、unity后续添加
    # :return: poco_dic
    # """

    # try:
    #     self.poco("未命名").exists()
    # except Exception:#后续可能需要优化，修改整体框架
    #     self.poco = StdPoco()
    #     self.poco("未命名").exists()
    # file_path = "D:\\poco_list_file\\" + self.thread_file_name + ".txt"
    # with open(file_path) as f:
    #     poco_name_dic_str_list = f.readlines()
    # self.poco_dic = eval(poco_name_dic_str_list[0])
    # print("本地poco数据刷新完成")
    # return self.poco_dic
    # time.sleep(1)
    # self.poco_dic = self.gpd.get_poco_dic()
    # return self.poco_dic

    def get_poco_dic(self):
        # file_path = "D:\\poco_list_file\\" + self.thread_file_name + ".txt"
        # with open(file_path) as f:
        #     poco_name_dic_str_list = f.readlines()
        # self.poco_dic = eval(poco_name_dic_str_list[0])
        # print("本地poco数据获取完成")
        # return self.poco_dic

        # g = GetPocoDic()# 新规则，还差指定手机名称
        # self.poco_dic = g.get_poco_dic()
        time.sleep(0.8)
        self.poco_dic = self.gpd.get_poco_dic()
        if self.poco_dic == {}:
            print("未获得任何节点信息")
        return self.poco_dic

    def get_poco_name_path_list(self):
        self.get_poco_dic()
        print("获取列表，刷新poco")
        poco_name_path_list = self.poco_dic.keys()
        return poco_name_path_list

    def is_in_dic(self, poco_path):
        # 先判断在不在地址表里面
        if self.poco_dic == None:
            # 点击之后会清空，unexpected会直接调用该方法，所以需要刷一下最新的UI树
            self.get_poco_dic()
        if poco_path in self.poco_dic.keys():
            print("找到路径"+poco_path)
            self.complete_poco_path = poco_path
            return True
        # 看看某些唯一路径存不存在简写
        for dic_key in self.poco_dic.keys():
            if poco_path in dic_key:
                # 是简写路径的话就把完整路径传递出去
                self.complete_poco_path = dic_key
                # print("获取完整路径"+self.complete_poco_path+"完成")
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
        self.get_poco_dic()
        for i in range(3):
            if self.is_in_dic(poco_path):
                print("待点击路径："+self.complete_poco_path)
                pos_list = self.poco_dic[self.complete_poco_path]['pos']
                # [宽,高]
                # phone_list_str = self.info.get_config("Phone_Size", self.thread_file_name)
                # phone_list = eval(phone_list_str)
                # 取整
                print(poco_path + "pos属性为：" + str(pos_list))
                x = int(self.phone_size_list[0] * pos_list[0])
                y = int(self.phone_size_list[1] * pos_list[1])
                print(poco_path + "坐标为：" + str([x, y]))
                return [x, y]
            else:
                time.sleep(3)
                print("第" + str(i + 1) + "次未找到，再次查找" + poco_path)
                self.get_poco_dic()
                if i >= 2:
                    snapshot(msg="poco节点未找到")
                    raise NoneException(poco_path)

    def my_touch(self, poco_path):
        touch_int_list = self.get_poco_pos(poco_path)
        self.touch(touch_int_list)

    def touch(self, pos_list):
        """
        输入坐标，使用airtest框架的touch点击
        :param pos_list: [123,123]
        :return:
        """
        touch(pos_list)
        print("点击坐标" + str(pos_list) + "完成")
        self.poco_dic = None

    def touch_poco_obj(self, poco_path, click_list):

        self.get_poco_dic()
        if self.is_in_dic(poco_path):
            shifting_x = click_list[0] - 0.5
            shifting_y = click_list[1] - 0.5
            poco_path_pos = self.poco_dic[poco_path]['pos']
            poco_path_size = self.poco_dic[poco_path]['size']
            posx = poco_path_pos[0] + poco_path_size[0] * shifting_x
            posy = poco_path_pos[1] + poco_path_size[1] * shifting_y
            phone_x = self.phone_size_list[0]
            phone_y = self.phone_size_list[1]
            x = int(posx * phone_x)
            y = int(posy * phone_y)
            self.touch([x, y])
        else:
            print("未找到节点" + poco_path)
            snapshot(msg="未找到节点" + poco_path)
            raise NoneException

    def my_swipe(self, start_path, end_path, duration=2):
        start = self.get_poco_pos(start_path)
        end = self.get_poco_pos(end_path)
        swipe(start, end, duration=duration)
        print(str(start) + "滑动至" + str(end) + "完成")
        return start, end

    # def get_poco_visible(self, poco_path):
    #     """
    #     获取游戏visible属性中的str值
    #     :param poco_path:poco路径
    #     :return:True/False
    #     """
    #     if self.is_in_dic(poco_path):
    #         visible_value_bool = self.poco_dic[self.complete_poco_path]["getVisible"]
    #         return visible_value_bool
    #     else:
    #         snapshot(msg="未找到节点")
    #         raise NoneException

    # def get_poco_text(self, poco_path):
    #     """
    #     获取游戏visible属性中的str值
    #     :param poco_path:poco对象
    #     :return:True/False
    #     """
    #     if self.is_in_dic(poco_path):
    #         visible_value_bool = self.poco_dic[self.complete_poco_path]["text"]
    #         return visible_value_bool
    #     else:
    #         snapshot(msg="未找到节点")
    #         raise NoneException

    def get_poco_any_value(self, poco_path, value_name_str):
        """
        获取游戏poco对象value_name_str属性中的值
        :param poco_path:poco_path
        :param value_name_str:属性的key
        :return: str value
        """
        self.get_poco_dic()
        if self.is_in_dic(poco_path):
            visible_value_bool = self.poco_dic[self.complete_poco_path][value_name_str]
            if visible_value_bool == "":
                snapshot(msg=poco_path + "没有" + value_name_str + "属性")
                raise NoneStrException
            return visible_value_bool
        else:
            snapshot(msg="未找到节点")
            raise NoneException
    def get_game_number_instr(self, poco_path):
        """
        只获取poco对象中text属性中的数字
        :param poco_path:
        :return:
        """
        number_str = self.get_poco_any_value(poco_path, "text")
        number = filter(str.isdigit, number_str)
        return int(number.__next__())

    # def get_log_path(self, file_name):
    #     """
    #     将脚本的__file__属性传入，获取脚本的log存放路径
    #     :param file_name: __file__
    #     :param name:文件名称
    #     :return: log存放路径
    #     """
    #     self.input_file_name = file_name
    #     path, name = script_dir_name(file_name)
    #     self.log_path = path + "/" + name[:-3] + ".air/log"
    #     self.file_name = name[:-3]
    #     return self.log_path, self.file_name
    #
    # def end_log(self):
    #     """
    #     生成测试报告，目前限测试使用,todo  后续考虑使用线程号区分
    #     :param file_name: __file__
    #     :return:
    #     """
    #     outputname = self.file_name + "_log.html"
    #     simple_report(self.input_file_name, logpath=self.log_path, output=outputname)
