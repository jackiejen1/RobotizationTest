#!/usr/bin/env python
# encoding: utf-8
# @Time : 2020/2/4+' '+ 19:54 
# @Author : 洞洞
# @File : get_resource_type.py 
# @function :根据道具名字，读取excel表，获取资源的type、id

import xlrd


class GetResourceType:
    def __init__(self, excel_path):
        """
        根据传入路径读取excel文件
        :param game_name:
        """
        self.xl = xlrd.open_workbook(excel_path)

    def get_type_id(self, resource_name):
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
            print(resource_name + "道具不存在")
            raise Exception
        return resource_type, resource_id
    def get_name_from_type_id(self,type_id_dic):
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
        if resource_name=="":
            print("type："+str(type_num)+"id："+str(id)+"的道具不存在")
            raise Exception
        else:
            return resource_name
