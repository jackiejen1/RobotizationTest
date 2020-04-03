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
    def __init__(self):
        self.thread_file_name = str(threading.get_ident())
        self.info = Information()
        path, name = script_dir_name(__file__)
        self.logpath = path + "/" + name[:-3] + "/" + name
        self.complete_poco_path = None

    def set_poco(self, poco):
        self.poco = poco
        self.phone_size_list = self.poco.get_screen_size()
        # self.info.set_config("Phone_Size", self.thread_file_name, str(self.phone_size_list))
        self.renovate_and_get_poco_dic()

    # todo 这里会报错，断开连接的错误
    def renovate_and_get_poco_dic(self):#逐渐废弃
        """
        基础方法
        根据线程ID，刷新并读取对应本地的poco_dic,调用此方法前需要先调用set_poco()
        目前只适配poco—lua ，安卓、unity后续添加
        :return: poco_dic
        """
        time.sleep(1)
        try:
            self.poco("未命名").exists()
        except Exception:#后续可能需要优化，修改整体框架
            self.poco = StdPoco()
            self.poco("未命名").exists()
        file_path = "D:\\poco_list_file\\" + self.thread_file_name + ".txt"
        with open(file_path) as f:
            poco_name_dic_str_list = f.readlines()
        self.poco_dic = eval(poco_name_dic_str_list[0])
        print("本地poco数据刷新完成")
        return self.poco_dic

        # g = GetPocoDic()# 新规则，还差指定手机名称
        # self.poco_dic = g.get_poco_dic()
        # return self.poco_dic

    def get_poco_dic(self):
        file_path = "D:\\poco_list_file\\" + self.thread_file_name + ".txt"
        with open(file_path) as f:
            poco_name_dic_str_list = f.readlines()
        self.poco_dic = eval(poco_name_dic_str_list[0])
        print("本地poco数据获取完成")
        return self.poco_dic

        # g = GetPocoDic()# 新规则，还差指定手机名称
        # self.poco_dic = g.get_poco_dic()
        # return self.poco_dic

    def get_poco_name_path_list(self):
        print("获取列表，刷新poco")
        self.renovate_and_get_poco_dic()
        poco_name_path_list = self.poco_dic.keys()
        return poco_name_path_list

    def is_in_dic(self, poco_path):
        # 先判断在不在地址表里面
        if poco_path in self.poco_dic.keys():
            print("找到路径")
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
        for i in range(3):
            if self.is_in_dic(poco_path):
                print(self.complete_poco_path)
                pos_list = self.poco_dic[self.complete_poco_path]['pos']
                # [宽,高]
                # phone_list_str = self.info.get_config("Phone_Size", self.thread_file_name)
                # phone_list = eval(phone_list_str)
                # 取整
                print(poco_path+"pos属性为"+str(pos_list))
                x = int(self.phone_size_list[0] * pos_list[0])
                y = int(self.phone_size_list[1] * pos_list[1])
                print(poco_path+"坐标为"+str([x, y]))
                return [x, y]
            else:
                time.sleep(3)
                print("第" + str(i + 1) + "次未找到，再次查找" + poco_path)
                self.renovate_and_get_poco_dic()
                if i >= 2:
                    snapshot(msg="poco未找到")
                    raise NoneException(poco_path)

    def my_touch(self, poco_path):
        self.renovate_and_get_poco_dic()
        touch_int_list = self.get_poco_pos(poco_path)
        touch(touch_int_list)
        print("点击坐标" + str(touch_int_list) + "完成")
        # x, y = self.get_poco_pos(poco_path)
        # os.system("adb input tap %d %d" % (x, y))
        # print("点击坐标(%d,%d)完成" % (x, y))
        self.renovate_and_get_poco_dic()

    def touch(self,pos_list):
        """
        输入坐标，使用airtest框架的touch点击
        :param pos_list: [123,123]
        :return:
        """
        self.renovate_and_get_poco_dic()
        touch(pos_list)
        print("点击坐标" + str(pos_list) + "完成")
        self.renovate_and_get_poco_dic()

    def touch_poco_obj(self, poco_path,click_list):
        if self.is_in_dic(poco_path):
            try:
                print("以name属性查找对象")
                self.poco(name = self.complete_poco_path).click(click_list)
            except Exception:
                print("name属性未找到，改为text属性查找")
                self.poco(text=self.complete_poco_path).click(click_list)
        else:
            print("未找到节点"+poco_path)
            snapshot(msg="未找到节点"+poco_path)
            raise NoneException
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
            visible_value_bool = self.poco_dic[self.complete_poco_path]["getVisible"]
            return visible_value_bool
        else:
            snapshot(msg="未找到节点")
            raise NoneException

    def get_poco_text(self, poco_path):
        """
        获取游戏visible属性中的str值
        :param poco_path:poco对象
        :return:True/False
        """
        if self.is_in_dic(poco_path):
            visible_value_bool = self.poco_dic[self.complete_poco_path]["text"]
            return visible_value_bool
        else:
            snapshot(msg="未找到节点")
            raise NoneException

    def get_poco_any_value(self, poco_path, value_name_str):
        """
        获取游戏poco对象value_name_str属性中的值
        :param poco_path:poco_path
        :param value_name_str:属性的key
        :return: str value
        """
        if self.is_in_dic(poco_path):
            visible_value_bool = self.poco_dic[self.complete_poco_path][value_name_str]
            # visible_value_str = visible_value_bool
            if visible_value_bool == "":
                snapshot(msg=poco_path+"没有str属性")
                raise NoneStrException
            return visible_value_bool
        else:
            snapshot(msg="未找到节点")
            raise NoneException

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
