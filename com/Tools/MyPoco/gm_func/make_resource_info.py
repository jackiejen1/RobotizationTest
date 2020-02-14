#!/usr/bin/env python
# encoding: utf-8
# @Time : 2020/2/4+' '+ 20:52 
# @Author : 洞洞
# @File : make_resource_info.py 
# @function : 生成GM后台接口所需的信息
from get_resource_type import GetResourceType
from information import Information
import time


class MakeResourceInfo:
    """
    根据资源名获取资源对应type和id，用于辅助GM后台
    """

    def __init__(self, game_name):
        info = Information()
        excel_path = info.get_config("ExcelPath", game_name)
        self.grt = GetResourceType(excel_path)

    def make_type_id(self, resource_name):
        """
        基础方法，调用该方法根据资源名称生成type、id
        :param resource_name:资源名称
        :return:
        """
        self.this_type, self.this_id = self.grt.get_type_id_from_name(resource_name)

    def get_resource_name(self, type_id_dic):
        """
        根据传入的道具type和id，查询道具的名字
        :param type_id_dic: {"type":,"id":}
        :return: str  resource_name
        """
        resource_name = self.grt.get_name_from_type_id(type_id_dic)
        return resource_name

    def get_data_addordel(self, resource_name, num):
        """
        用于添加、删除道具的data
        :param resource_name: 资源名
        :return: {} http所需要的data
        """
        self.make_type_id(resource_name)
        data = {"type": self.this_type, "id": self.this_id, "num": num}
        return data

    def get_data_select(self, resource_name):
        """
        用于道具查询的data
        :param resource_name: 资源名
        :return: {} http所需要的data
        """
        self.make_type_id(resource_name)
        data = {"type": self.this_type, "id": self.this_id, }
        return data

    def get_data_select_money(self, resource_name):
        """
        用于充值补单的data
        :param resource_name: 资源名
        :return: {} http所需要的data
        """
        this_type, this_id, this_money = self.grt.get_type_id_from_name_money(resource_name)
        data = {"type": this_type, "id": this_id, "num": this_money}
        return data

    def day_to_num(self, day_str):
        """
        根据传入的日期，转换成时间戳
        时间样式2013/10/10-23:40:00'
        :param day_str:日期
        :return: int 时间戳
        """
        timeArray = time.strptime(day_str, "%Y/%m/%d-%H:%M:%S")
        timeStamp = int(time.mktime(timeArray))
        return timeStamp

    def num_to_day(self, timeStamp):
        """
        根据传入的时间戳，转换成日期
        时间样式2013/10/10-23:40:00'
        :param timeStamp: int 时间戳
        :return: str 日期
        """
        timeArray = time.localtime(timeStamp)
        day_str = time.strftime("%Y/%m/%d-%H:%M:%S", timeArray)
        return day_str
