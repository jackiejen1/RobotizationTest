# _*_coding:utf-8 _*_
# !/usr/bin/python3
# Reference:********************************
# encoding: utf-8
# @Time: 2019/11/19  10:31
# @Author: 洞洞
# @File: resource_gm_ss2.py
# @Function:
# @Method:
# Reference:********************************
import re
import time

from MyPoco.foundation.information import Information
from MyPoco.game_support.message_ss2 import MessageSs2
from MyPoco.game_support.unexpected_win_ss2 import UnexpectedWinSs2
from MyPoco.poco.my_poco_object import MyPocoObject


class ResourceGmSs2:
    def __init__(self,game_name):
        self.info = Information()
        self.my_poco_obj = MyPocoObject(game_name)


    def add_resource_ss2(self, add_name_input_dic):  # todo
        """
        从开始到结束都在当前界面,添加一些资源
        :return:
        """
        self.poco = self.my_poco_obj.new_poco_obj()
        mes = MessageSs2()
        # 将传入的字典的key转换成列表
        keys_list = list(add_name_input_dic.keys())
        order_str = """{"message":10140,"awards":["""
        counter_num = 0
        for key in keys_list:
            if counter_num == 0:
                pass
            else:
                order_str = order_str + ","
            size = add_name_input_dic.get(key)
            value = mes.get_resource_value(key)
            order_str = order_str + "{" + value + ""","size":""" + str(size) + "}"
            counter_num += 1
        order_str = order_str + "]}"
        order_str.replace(" ", "")
        self.my_poco_obj.touch_poco("Comp_res3")  # 点击元宝进入gm
        self.my_poco_obj.touch_poco("自动测试")
        self.my_poco_obj.touch_poco("input1")
        self.my_poco_obj.text_str(order_str)
        self.my_poco_obj.touch_poco("btn1")
        time.sleep(4)
        self.my_poco_obj.touch_poco("未命名0/popup/AutoTestLayer/__view/close")
        self.my_poco_obj.touch_poco("未命名0/popup/AddItemLayer/__view/close1")  # 回到主界面

    def delete_resource_ss2(self, del_name_input_dic):
        """
        从开始到结束都在当前界面,删除一些资源
        :return:
        """

        self.poco = self.my_poco_obj.new_poco_obj()
        mes = MessageSs2()
        # 将传入的字典的key转换成列表
        keys_list = list(del_name_input_dic.keys())
        order_str = """{"message":10140,"consumes":["""
        counter_num = 0
        for key in keys_list:
            if counter_num == 0:
                pass
            else:
                order_str = order_str + ","
            size = del_name_input_dic.get(key)
            value = mes.get_resource_value(key)
            order_str = order_str + "{" + value + ""","size":""" + str(size) + "}"
            counter_num += 1
        order_str = order_str + "]}"
        order_str.replace(" ", "")
        self.my_poco_obj.touch_poco("Comp_res3")  # 点击元宝进入gm
        self.my_poco_obj.touch_poco("自动测试")
        self.my_poco_obj.touch_poco("input1")
        self.my_poco_obj.text_str(order_str)
        self.my_poco_obj.touch_poco("btn1")
        time.sleep(4)
        self.my_poco_obj.touch_poco("未命名0/popup/AutoTestLayer/__view/close")
        self.my_poco_obj.touch_poco("未命名0/popup/AddItemLayer/__view/close1")  # 回到主界面

    def get_resource_num_ss2(self, get_name_input_list):
        """
        从开始到结束都在当前界面,查询身上的资源数量
        :return:返回字典，道具的名称和数量
        """

        self.poco = self.my_poco_obj.new_poco_obj()
        mes = MessageSs2()
        s = "["
        for key_num in range(len(get_name_input_list)):
            s = s + "{" + mes.get_resource_value(get_name_input_list[key_num]) + "}"
            if key_num == len(get_name_input_list) - 1:
                pass
            else:
                s = s + ","
        s = s + "]"
        self.my_poco_obj.touch_poco("Comp_res3")
        self.my_poco_obj.touch_poco("自动测试")
        self.my_poco_obj.touch_poco("input2")
        self.my_poco_obj.text_str(s)
        self.my_poco_obj.touch_poco("btn2")
        str_txt = self.poco("txt").get_text()
        number_list = str_txt.split(",")  # 将获取到的字符串解析成列表
        resource_dic = {}
        for i in range(len(number_list)):
            key_name = get_name_input_list[i]
            value_name = int(number_list[i])
            resource_dic.update({key_name: value_name})

        time.sleep(4)
        self.my_poco_obj.touch_poco("未命名0/popup/AutoTestLayer/__view/close")
        self.my_poco_obj.touch_poco("未命名0/popup/AddItemLayer/__view/close1")
        return resource_dic

    def get_sever_time_ss2(self):
        """
        从开始到结束都在当前界面,服务器时间
        :return: int [日期，时间，星期]
        """

        self.poco = self.my_poco_obj.new_poco_obj()
        time.sleep(2)
        self.my_poco_obj.touch_poco("Comp_res3")
        self.my_poco_obj.touch_poco("自动测试")
        game_time_str = self.poco("time").get_text()
        time_list = self.info.get_time_str(game_time_str)
        time.sleep(4)
        self.my_poco_obj.touch_poco("未命名0/popup/AutoTestLayer/__view/close")
        self.my_poco_obj.touch_poco("未命名0/popup/AddItemLayer/__view/close1")
        return time_list
    def get_resource_id_ss2(self, get_name_input_list):# todo
        """
        从开始到结束都在当前界面,查询身上的资源数量
        :return:返回字典，道具的名称和id
        """

        self.poco = self.my_poco_obj.new_poco_obj()
        mes = MessageSs2()
        s = "["
        for key_num in range(len(get_name_input_list)):
            s = s + "{" + mes.get_resource_value(get_name_input_list[key_num]) + "}"
            if key_num == len(get_name_input_list) - 1:
                pass
            else:
                s = s + ","
        s = s + "]"
        self.my_poco_obj.touch_poco("Comp_res3")
        self.my_poco_obj.touch_poco("自动测试")
        self.my_poco_obj.touch_poco("input2")
        self.my_poco_obj.text_str(s)
        self.my_poco_obj.touch_poco("btn2")
        str_txt = self.poco("txt").get_text()
        number_list = str_txt.split(",")  # 将获取到的字符串解析成列表
        resource_dic = {}
        for i in range(len(number_list)):
            key_name = get_name_input_list[i]
            value_name = int(number_list[i])
            resource_dic.update({key_name: value_name})

        time.sleep(4)
        self.my_poco_obj.touch_poco("未命名0/popup/AutoTestLayer/__view/close")
        self.my_poco_obj.touch_poco("未命名0/popup/AddItemLayer/__view/close1")
        return resource_dic

    def set_play_fuben_num(self, num):
        self.poco = self.my_poco_obj.new_poco_obj()
        print("开始一键功能")
        nums = str(num)
        self.my_poco_obj.touch_poco("Comp_res3")
        self.my_poco_obj.touch_poco("一键功能")
        self.my_poco_obj.touch_poco("OnekeyLayer/__view/n21")
        self.my_poco_obj.text_str(nums)
        pos_list = self.my_poco_obj.get_poco_position("OnekeyLayer/__view/btn_challenge")#一键主线
        if num>10:
            num = int(num/7*3.5)
        for i in range(num):
            time.sleep(8)
            self.my_poco_obj.touch(pos_list)#一键主线
        self.my_poco_obj.touch_poco("OnekeyLayer/__view/btn0")
        self.my_poco_obj.touch_poco("未命名0/popup/AddItemLayer/__view/close1")

    def set_play_liezhuan_num(self, num):
        poco = self.my_poco_obj.new_poco_obj()
        print("开始一键名将")
        nums = str(num)
        self.my_poco_obj.touch_poco("Comp_res3")
        self.my_poco_obj.touch_poco("一键功能")
        self.my_poco_obj.touch_poco("一键名将")
        self.my_poco_obj.touch_poco("OnekeyLayer/__view/n21")
        self.my_poco_obj.text_str(nums)
        pos_list = self.my_poco_obj.get_poco_position("OnekeyLayer/__view/btn_challenge")
        for i in range(num*11):
            self.my_poco_obj.touch(pos_list)#一键主线
            time.sleep(1.5)
            print("列传")
        # self.my_poco_obj.touch_poco("btn_challenge", )  # 一键主线
        # sleep(num * 4)
        self.my_poco_obj.touch_poco("OnekeyLayer/__view/btn0")
        self.my_poco_obj.touch_poco("未命名0/popup/AddItemLayer/__view/close1")
