# _*_coding:utf-8 _*_
#!/usr/bin/python3
#Reference:********************************
# encoding: utf-8
#@Time: 2020/4/24  16:50
#@Author: 洞洞
#@File: tools.py
#@Function:
#@Method:
#Reference:********************************
import re

import xlrd
import xlwt


def handle_excel(path_input,path_output):
    """
    处理excel表格的数据，用以生成副本关卡ID表
    :param path_input:策划的ID表
    :param path_output:指定一个空表
    :return:
    """
    checkpoint_xl = xlrd.open_workbook(path_input)#打开指定表格
    table = checkpoint_xl.sheets()[0]#选取第一个表
    book = xlwt.Workbook()#生产表格对象缓存器
    sheet = book.add_sheet('test01')#在表格对象中生产一个表
    for i in range(1, table.nrows):
        row = table.row_values(i)#按行读取表格
        checkpoint_id = row[2]
        # 剔除所有汉字
        checkpoint_id = re.findall(r"\d+\-?\d*", checkpoint_id)
        if len(checkpoint_id) == 0:
            pass
        else:
            row[0] = "副本" +'-'+ str(checkpoint_id[0])
            row[1] = int(row[1])
            row.pop()
        sheet.write(i, 0, row[0])#写入缓存器 i行 0列  内容
        sheet.write(i, 1, row[1])
    book.save(path_output)#保存表格