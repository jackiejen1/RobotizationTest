#!/usr/bin/env python
# encoding: utf-8
# @Time : 2020/2/6+' '+ 18:03 
# @Author : 洞洞
# @File : get_protocol_args.py 
# @function :
from foundation.information import Information
import xlrd
class GetProtocolArgs:
    def __init__(self,game_name):
        info = Information()
        # 通过游戏名字获取表格路径
        excel_path = info.get_config("ExcelPath", game_name)
        self.excel = xlrd.open_workbook(excel_path)

    def get_args_list(self,protocol_name):
        """
        根据传入的协议名字，查询协议所需要的参数列表
        :param protocol_name: 协议名字
        :return:list  协议用例的所有参数组合dic
        """
        # 根据协议名获取其参数列表,第三个表格
        table = self.excel.sheets()[2]
        col = table.col_values(0)# 这个0参数也要变，根据协议名字那一列的索引 todo
        if protocol_name in col:
            row = table.row_values(col.index(protocol_name))
        else:
            print("名字为" + protocol_name + "的协议不存在")
            raise Exception
        num = 0# 参数启始位置 todo 具体减几看表格
        arglist_len = len(row)-num
        argdiclist=[]
        for i in range(arglist_len):
            key = row[i+num]
            keyk = {}
            keysval = key.split(",")
            for keyv in keysval:
                kl = keyv.split("=")
                if kl[1].isdigit():
                    keyk[kl[0]] = int(kl[1])
                else:
                    keyk[kl[0]] = kl[1]
            argdiclist.append(keyk)
        return argdiclist