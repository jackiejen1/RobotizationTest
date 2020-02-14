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

from airtest.core.api import *
from poco.drivers.std import StdPoco

using("Tools")
from get_info.information import Information
from new_poco.my_poco_object import MyPocoObject
from game_support.message_ss2 import MessageSs2
from game_support.protocol_dic_test_ss2 import ProtocolDicTestSs2

# from Tools.get_info.information import Information
# from Tools.poco.my_poco_object import MyPocoObject
# from Tools.game_support.message_ss2 import MessageSs2
# from Tools.game_support.protocol_dic_test_ss2 import ProtocolDicTestSs2

class ResourceGmSs2:
    def __init__(self):
        self.info = Information()
        self.my_poco = MyPocoObject()

    def add_resource_ss2(self, add_name_input_dic):  # todo
        """
        从开始到结束都在当前界面,添加一些资源
        :return:
        """
        self.poco = StdPoco()
        self.my_poco.set_poco(self.poco)
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
        self.my_poco.find_poco("Comp_res3", find_type="name")  # 点击元宝进入gm
        self.my_poco.find_poco("自动测试")
        self.my_poco.find_poco("input1", find_type="name")
        self.info.text_str(order_str)
        self.my_poco.find_poco("btn1", find_type="name")
        self.my_poco.find_poco("close", find_type="name")
        self.my_poco.find_poco("close1", find_type="name")  # 回到主界面

    def delete_resource_ss2(self, del_name_input_dic):
        """
        从开始到结束都在当前界面,删除一些资源
        :return:
        """
        self.poco = StdPoco()
        self.my_poco.set_poco(self.poco)
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
        self.my_poco.find_poco("Comp_res3", find_type="name")  # 点击元宝进入gm
        self.my_poco.find_poco("自动测试")
        self.my_poco.find_poco("input1", find_type="name")
        self.info.text_str(order_str)
        self.my_poco.find_poco("btn1", find_type="name")
        self.my_poco.find_poco("close", find_type="name")
        self.my_poco.find_poco("close1", find_type="name")  # 回到主界面

    def get_resource_num_ss2(self, get_name_input_list):
        """
        从开始到结束都在当前界面,查询身上的资源数量
        :return:返回字典，道具的名称和数量
        """
        self.poco = StdPoco()
        self.my_poco.set_poco(self.poco)
        mes = MessageSs2()
        s = "["
        for key_num in range(len(get_name_input_list)):
            s = s + "{" + mes.get_resource_value(get_name_input_list[key_num]) + "}"
            if key_num == len(get_name_input_list) - 1:
                pass
            else:
                s = s + ","
        s = s + "]"
        self.my_poco.find_poco("Comp_res3", find_type="name")
        self.my_poco.find_poco("自动测试")
        self.my_poco.find_poco("input2", find_type="name")
        self.info.text_str(s)
        self.my_poco.find_poco("btn2", find_type="name")
        str_txt = self.poco("txt").get_text()
        number_list = str_txt.split(",")  # 将获取到的字符串解析成列表
        resource_dic = {}
        for i in range(len(number_list)):
            key_name = get_name_input_list[i]
            value_name = int(number_list[i])
            resource_dic.update({key_name: value_name})

        self.my_poco.find_poco("close", find_type="name")
        self.my_poco.find_poco("close1", find_type="name")
        return resource_dic

    def get_sever_time_ss2(self):
        """
        从开始到结束都在当前界面,服务器时间
        :return: int [日期，时间，星期]
        """
        self.poco = StdPoco()
        self.my_poco.set_poco(self.poco)
        sleep(2)
        self.my_poco.find_poco("Comp_res3", find_type="name")
        self.my_poco.find_poco("自动测试")
        game_time_str = self.poco("time").get_text()
        time_list = self.info.get_time_str(game_time_str)
        self.my_poco.find_poco("close", find_type="name")
        self.my_poco.find_poco("close1", find_type="name")
        return time_list
    def get_resource_id_ss2(self, get_name_input_list):# todo
        """
        从开始到结束都在当前界面,查询身上的资源数量
        :return:返回字典，道具的名称和id
        """
        self.poco = StdPoco()
        self.my_poco.set_poco(self.poco)
        mes = MessageSs2()
        s = "["
        for key_num in range(len(get_name_input_list)):
            s = s + "{" + mes.get_resource_value(get_name_input_list[key_num]) + "}"
            if key_num == len(get_name_input_list) - 1:
                pass
            else:
                s = s + ","
        s = s + "]"
        self.my_poco.find_poco("Comp_res3", find_type="name")
        self.my_poco.find_poco("自动测试")
        self.my_poco.find_poco("input2", find_type="name")
        self.info.text_str(s)
        self.my_poco.find_poco("btn2", find_type="name")
        str_txt = self.poco("txt").get_text()




        number_list = str_txt.split(",")  # 将获取到的字符串解析成列表
        resource_dic = {}
        for i in range(len(number_list)):
            key_name = get_name_input_list[i]
            value_name = int(number_list[i])
            resource_dic.update({key_name: value_name})

        self.my_poco.find_poco("close", find_type="name")
        self.my_poco.find_poco("close1", find_type="name")
        return resource_dic

    def test_protocol_ss2(self, add_name_input_list):
        """
        只发一条，发完查看结果,用于协议测试
        :param add_name_input_list: [协议id，arges....]
        :return:
        """
        self.poco = StdPoco()
        self.my_poco.set_poco(self.poco)
        mes = ProtocolDicTestSs2()
        value_list = mes.get_protocol_value(add_name_input_list[0])
        protocol_str = value_list[0]
        for i in range(1, len(add_name_input_list)):
            protocol_str = protocol_str + value_list[i] + str(add_name_input_list[i])
        protocol_str = protocol_str + value_list[len(value_list) - 1]
        self.my_poco.find_poco("Comp_res3", find_type="name")  # 点击元宝进入gm
        self.my_poco.find_poco("自动测试")
        self.my_poco.find_poco("input1", find_type="name")
        self.info.text_str(protocol_str)
        self.my_poco.find_poco("btn1", find_type="name")
        self.my_poco.find_poco("close", find_type="name")
        self.my_poco.find_poco("close1", find_type="name")  # 回到主界面

    def send_game_protocol(self, send_protocol_dic,find_name):# todo
        """
        使用协议对游戏进行操作，例如穿戴装备，强化装备等
        发送后会回到当前界面，只发一条
        :param add_name_input_list: list [协议id，arges....]
        :param find_name:协议返回值中需要查询值的key，可以为none
        :return:value
        """
        self.poco = StdPoco()
        self.my_poco.set_poco(self.poco)
        self.my_poco.find_poco("Comp_res3", find_type="name")  # 点击元宝进入gm
        self.my_poco.find_poco("自动测试")
        self.my_poco.find_poco("input2", find_type="name")
        protocol_str = str(send_protocol_dic).replace(" ","").replace("'",'''"''') # 要发送的协议
        self.info.text_str(protocol_str)
        s = self.poco("Comp_scroll").get_text()  # 获取到的返回值
        s = s[6:]
        s1 = re.sub('(\w+) = ([^\{ ]+)', "\"\\1\":\\2,", s)
        s1 = s1.replace("false", "False")
        s1 = s1.replace("ture", "Ture")
        s2 = re.sub("\s{2,}", "", s1)
        s3 = re.sub("(\w+) = {", "\"\\1\" : {", s2)
        s4 = re.sub("}", "},", s3)
        s = s4[0:-1]
        ret_dic = eval(s) # todo
        self.my_poco.find_poco("btn2", find_type="name")
        self.my_poco.find_poco("close", find_type="name")
        self.my_poco.find_poco("close1", find_type="name")  # 回到主界面
        if find_name != None:
            find_name_value = None #todo
            return find_name_value