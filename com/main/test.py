# _*_coding:utf-8 _*_
#!/usr/bin/python3
#Reference:********************************
# encoding: utf-8
#@Time: 2020/1/15  15:33
#@Author: 洞洞
#@File: test.py
#@Function:
#@Method:
#Reference:********************************
from get_resource_type import GetResourceType

__author__ = "v.lidd"
__title__ = '登录游戏'
__desc__ = """ 1.
               2.

                """
if __name__ == '__main__':
    filte=GetResourceType(r"E:\object\RobotizationTest\com\Tools\MyPoco\excel_tab\少三2道具类型表.xlsx")
    name = filte.get_name_from_type_id({"type":1,"id":30})
    print(name)
























# todo 兼容平台日志系统
# simple_report(__file__,logpath=log_path)