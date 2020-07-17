#!/usr/bin/env python
# encoding: utf-8
# @Time : 2020/2/4+' '+ 20:52 
# @Author : 洞洞
# @File : make_resource_body.py
# @function : 生成GM后台接口所需的信息
import json

import math

from MyPoco.foundation.information import Information
import time
from MyPoco.airtestide_lack_packages import xlrd
from MyPoco.foundation.MyException import *


class MakeResourceBody:
    """
    根据资源名获取资源对应type和id，用于辅助GM后台
    """

    def __init__(self, game_name_into):
        info = Information()
        self.game_name = info.get_config(game_name_into, "app_name")
        excel_path = info.get_config(game_name_into, "resource_excelpath")
        MyPocoPath = info.get_config("设置", "my_poco_path")
        all_path = MyPocoPath + excel_path
        self.xl = xlrd.open_workbook(all_path)
        # if self.game_name == "com.youzu.test.qa":
        #     checkpoint_excel_path = info.get_config(game_name_into, "checkpointl_excelpath")
        #     all_checkpoint_excel_path = MyPocoPath+checkpoint_excel_path
        #     self.checkpoint_xl= xlrd.open_workbook(all_checkpoint_excel_path)
        if game_name_into == "少三2":#少三2特有需求
            checkpoint_excel_path = info.get_config(game_name_into, "checkpointl_excelpath")
            all_checkpoint_excel_path = MyPocoPath + checkpoint_excel_path
            self.checkpoint_xl = xlrd.open_workbook(all_checkpoint_excel_path)

    def get_num_from_name(self, checkpoint_name):
        """
        根据玩法章节返回该资源在表中对应的id
        :param resource_name: str 功能名+大章节数+小关卡数
        """
        table = self.checkpoint_xl.sheets()[0]
        col = table.col_values(0)
        if checkpoint_name in col:
            row = table.row_values(col.index(checkpoint_name))
            checkpoint_id = int(row[1])
        else:
            raise GmException(checkpoint_name + "关卡编号不存在")
        return checkpoint_id

    def get_num_list_from_name(self, checkpoint_num):
        """
        根据玩法章节返回该资源在表中对应的id
        :param checkpoint_num: str 大章节代号1.2.3
        :return:num_lists[[id,type],[id,type]]
        """
        num_lists = []
        table = self.checkpoint_xl.sheets()[1]
        col = table.col_values(0)#列
        col_list = col[1:]
        for i in range(checkpoint_num+1)[1:]:
            is_id =i*1000
            for ii in range(len(col_list)):#整个表的长度
                is_id = is_id + 1
                if is_id in col_list:
                    row = table.row_values(col.index(is_id))
                    num_list = []
                    num_list.append(int(row[1]))
                    num_list.append(int(row[2]))
                    num_lists.append(num_list)
                else:
                    break
        return num_lists

    def get_type_id_from_name(self, resource_name):
        """
        根据资源名返回该资源在表中对应的type、id
        :param resource_name: str 资源名
        :return: resource_type:  int 资源的type
        :return: resource_id:  int 资源的id
        """
        # 根据资源名查询该资源对应的type、id
        # 读取的整数出来是小数，所以要取整
        table = self.xl.sheets()[0]
        col = table.col_values(0)
        if resource_name in col:
            row = table.row_values(col.index(resource_name))
            resource_type = int(row[1])
            resource_id = int(row[2])
        else:
            raise GmException(resource_name + "道具不存在")
        return resource_type, resource_id

    def get_type_id_from_name_money(self, resource_name):
        """
        根据资源名返回该资源在表中对应的type、id、金额
        用于充值补单
        :param resource_name: str 资源名
        :return: resource_type:  int 资源的type
        :return: resource_id:  int 资源的id
        :return: resource_money:  int 资源的金额
        """
        # 根据资源名查询该资源对应的type、id
        # 读取的整数出来是小数，所以要取整
        table = self.xl.sheets()[0]
        col = table.col_values(0)
        if resource_name in col:
            row = table.row_values(col.index(resource_name))
            resource_type = int(row[1])
            resource_id = int(row[2])
            resource_money = int(row[3])
        else:
            raise GmException(resource_name + "道具不存在")
        return resource_type, resource_id, resource_money

    def get_name_from_type_id(self, type_id_dic):
        """
        根据传入的道具type和id，查询道具的名字
        :param type_id_dic: {"type":,"id":}
        :return: str  resource_name
        """
        table = self.xl.sheets()[0]
        col = table.col_values(1)
        type_num = type_id_dic["type"]
        id = type_id_dic["id"]
        resource_name = ""
        for i in range(1, len(col)):
            if type_num == int(col[i]):
                row = table.row_values(i)
                if id == int(row[2]):
                    resource_name = row[0]
        if resource_name == "":
            raise GmException("type:" + str(type_num) + ",id:" + str(id) + "的道具不存在")
        else:
            return resource_name

    def make_type_id(self, resource_name):
        """
        基础方法，调用该方法根据资源名称生成type、id
        :param resource_name:资源名称
        :return:
        """
        self.this_type, self.this_id = self.get_type_id_from_name(resource_name)

    def get_resource_name(self, type_id_dic):
        """
        根据传入的道具type和id，查询道具的名字
        :param type_id_dic: {"type":,"id":}
        :return: str  resource_name
        """
        resource_name = self.get_name_from_type_id(type_id_dic)
        return resource_name

    def get_resource_id(self, resource_name):
        """
        根据资源名称查询id
        :param resource_name:资源名称
        :return:int id
        """
        this_type, this_id = self.get_type_id_from_name(resource_name)
        return int(this_id)

    def get_data_addordel(self, resource_name, num):
        """
        用于添加、删除道具的data
        :param resource_name: 资源名
        :return: {} http所需要的data
        """
        self.make_type_id(resource_name)
        data = {"type": self.this_type, "id": self.this_id, "num": num}
        # data = json.dumps(data,ensure_ascii=False)
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
        this_type, this_id, this_money = self.get_type_id_from_name_money(resource_name)
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
