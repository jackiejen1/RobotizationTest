#!/usr/bin/env python
# encoding: utf-8
# @Time : 2020/2/6+' '+ 18:03 
# @Author : 洞洞
# @File : get_protocol_args.py 
# @function :
import re

from foundation.information import Information
import xlrd


class GetProtocolArgs:
    def __init__(self, game_name):
        self.info = Information()
        # 通过游戏名字获取表格路径
        excel_path = self.info.get_config("ProtocolExcelPath", game_name)
        self.excel = xlrd.open_workbook(excel_path)
        # 协议文件路径，需要将后端给的协议文件从proto类型改为txt
        self.protocol_file_path = self.info.get_config("ProtocolFilePath", game_name)

    def get_args_list(self, protocol_name):
        """
        根据传入的协议名字，查询协议所需要的参数列表
        :param protocol_name: 协议名字
        :return:list[{},{}]  协议用例的所有参数组合dic
        """
        # 根据协议名获取其参数列表,第三个表格
        table = self.excel.sheets()[2]
        col = table.col_values(0)  # 这个0参数也要变，根据协议名字那一列的索引 todo
        if protocol_name in col:
            row = table.row_values(col.index(protocol_name))
        else:
            print("名字为" + protocol_name + "的协议不存在")
            raise Exception
        num = 0  # 参数启始位置 todo 具体减几看表格
        arglist_len = len(row) - num
        argdiclist = []
        for i in range(arglist_len):
            key = row[i + num]
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

    def get_id_protocol(self, name):
        """
        根据传入的协议名查找对应的协议ID
        :param name: 协议名称，和配置文件ProtocolFilePath中连起来是完整的协议名
        :return C2SID: 客户端发包协议ID
        :return S2CID: 客户端收包协议ID
        """
        C2Sname = self.info.get_config("ProtocolFilePath", "C2Sname") + name
        S2Cname = self.info.get_config("ProtocolFilePath", "S2Cname") + name
        C2SID = None
        S2CID = None
        with open(self.protocol_file_path, 'r+', encoding="utf-8") as fw:
            filelist = fw.readlines()
        for f in filelist:
            f.strip("\\n")
            if C2Sname in f:
                C2SID = re.findall(" = ([\s\S]*);", f)
            if S2Cname in f:
                S2CID = re.findall(" = ([\s\S]*);", f)
        return C2SID, S2CID
