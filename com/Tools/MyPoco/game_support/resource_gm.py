# _*_coding:utf-8 _*_
# !/usr/bin/python3
# Reference:********************************
# encoding: utf-8
# @Time: 2019/11/16  15:28
# @Author: 洞洞
# @File: resource_gm.py
# @Function:
# @Method:
# Reference:********************************

from airtest.core.api import *

using("Tools")
from get_info.information import Information
from new_poco.my_poco_object import MyPocoObject
from game_support.resource_gm_ss2 import ResourceGmSs2
#from Tools.get_info.information import Information
#from Tools.poco.my_poco_object import MyPocoObject
#from Tools.game_support.resource_gm_ss2 import ResourceGmSs2


class ResourceGm:

    def __init__(self):
        """
        在if、elif结构中初始化对象
        """
        self.info = Information()
        self.my_poco = MyPocoObject()
        self.game_name = self.info.get_config("App_Name", "game_name")
        if self.game_name == "com.youzu.test.qa":
            self.rgss2 = ResourceGmSs2()
        else:
            pass
    def add_resource(self, add_name_input_dic):
        """
        添加资源，区分不同的游戏走不同的逻辑
        :param add_name_input_dic: {资源名称：数量}
        :return:
        """
        if self.game_name == "com.youzu.test.qa":
            self.rgss2.add_resource_ss2(add_name_input_dic)
        else:
            pass

    def delete_resource(self, del_name_input_dic):
        """
        添加资源，区分不同的游戏走不同的逻辑
        :param add_name_input_dic: {资源名称：数量}
        :return:
        """
        if self.game_name == "com.youzu.test.qa":
            self.rgss2.delete_resource_ss2(del_name_input_dic)
        else:
            pass
    def get_resource_num(self, get_name_input_list):
        """
        查询资源，区分不同的游戏走不同的逻辑
        :param get_name_input_list: [资源名称]
        :return: {资源名称：数量}
        """
        if self.game_name == "com.youzu.test.qa":
            dic_res = self.rgss2.get_resource_num_ss2(get_name_input_list)
            return dic_res
        else:
            pass
    def get_sever_time(self):
        """
        获取服务器时间，区分不同的游戏走不同的逻辑
        :return:
        """
        if self.game_name == "com.youzu.test.qa":
            time_list = self.rgss2.get_sever_time_ss2()
            return time_list
        else:
            pass
    def test_game_protocol(self, add_name_input_list):
        """
        发送协议，发送后会回到当前界面，只发一条，发完查看结果
        主要用于协议测试
        :param add_name_input_list: list [协议编号，arges....] 编号查询协议用例表
        :return:
        """
        if self.game_name == "com.youzu.test.qa":  # ss2
            self.rgss2.test_protocol_ss2(add_name_input_list)
        else:
            pass
    def send_game_protocol(self, send_protocol_dic,find_name):
        """
        发送后会回到当前界面，只发一条，
        :param add_name_input_list: list [协议id，arges....]
        :param find_name:协议返回值中需要查询值的key，可以为none
        :return:value
        """
        if self.game_name == "com.youzu.test.qa":  # ss2
            find_name_value = self.rgss2.send_game_protocol(send_protocol_dic,find_name)
            return find_name_value
        else:
            pass