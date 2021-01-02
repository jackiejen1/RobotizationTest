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


from MyPoco.foundation.information import Information
from MyPoco.game_support.resource_gm_ss2 import ResourceGmSs2


class ResourceGm:

    def __init__(self,game_name,phone_id):
        """
        在if、elif结构中初始化对象
        """
        self.info = Information()
        self.game_name = self.info.get_config(game_name, "app_name")
        if self.game_name == "com.youzu.test.qa":
            self.rgss2 = ResourceGmSs2(game_name,phone_id)
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
            return self.rgss2.get_sever_time_ss2()
        else:
            pass

    def set_play_fuben_num(self, num):
        """
        添加资源，区分不同的游戏走不同的逻辑
        :param add_name_input_dic: {资源名称：数量}
        :return:
        """
        if self.game_name == "com.youzu.test.qa":
            self.rgss2.set_play_fuben_num(num)
        else:
            pass
    def set_play_liezhuan_num(self, num):
        """
        添加资源，区分不同的游戏走不同的逻辑
        :param add_name_input_dic: {资源名称：数量}
        :return:
        """
        if self.game_name == "com.youzu.test.qa":
            self.rgss2.set_play_liezhuan_num(num)
        else:
            pass