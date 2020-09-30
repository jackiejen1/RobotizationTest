# _*_coding:utf-8 _*_
#!/usr/bin/python3
#Reference:********************************
# encoding: utf-8
#@Time: 2020/9/26  14:21
#@Author: 洞洞
#@File: tools.py
#@Function:
#@Method:
#Reference:********************************
import xlwt

def new_excel_tab(name_tab, log_str_z, tongji_str_z, shijiancishu):
    """
    给少三2的几个活动创建的日志表格
    :param name_tab: 表格名称
    :param value_str:
    :return:
    """
    # 创建表格
    workbook = xlwt.Workbook()  # 注意Workbook的开头W要大写
    sheet1 = workbook.add_sheet('sheet1', cell_overwrite_ok=True)
    # 初始化表格，向sheet页中写入数据
    sheet1.write(0, 0, '道具名称')
    sheet1.write(0, 1, '道具数量')
    sheet1.write(0, 2, '抽到次数')
    # 解析数据
    value_str_list = log_str_z.split("\r\n")
    rows_num = 1
    for line_str in value_str_list:
        if "结果" in line_str:
            continue
        line_str_list = line_str.split("，")
        name_str = line_str_list[0]
        name_list = name_str.split("：")
        name = name_list[1]
        num_str = line_str_list[1]
        num_list = num_str.split("：")
        num = num_list[1]
        cishu_str = line_str_list[2]
        cishu_list=cishu_str.split("：")
        cishu = cishu_list[1]
        cishu = cishu[:-1]
        sheet1.write(rows_num, 0, name)
        sheet1.write(rows_num, 1, num)
        sheet1.write(rows_num, 2, cishu)
        rows_num = rows_num+1
    sheet1.write(rows_num, 0, '总计:')
    rows_num = rows_num + 1
    #还有一个循环
    tongji_list = tongji_str_z.split("\r\n")
    for tongji in tongji_list:
        if "结果" in tongji:
            continue
        tongji_str_list = tongji.split("：")
        name  = tongji_str_list[0]
        num_str = tongji_str_list[1]
        num = num_str[:-1]
        sheet1.write(rows_num, 0,name)
        sheet1.write(rows_num, 1, num)
        rows_num = rows_num + 1
    sheet1.write(rows_num, 0, shijiancishu)
    workbook.save('D:\\'+name_tab+'.xls')
    # 保存文件
