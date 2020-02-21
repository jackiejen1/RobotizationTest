# _*_coding:utf-8 _*_
# !/usr/bin/python3
# Reference:********************************
# encoding: utf-8
# @Time: 2020/1/15  15:33
# @Author: 洞洞
# @File: test.py
# @Function:
# @Method:
# Reference:********************************
import random
import re


import xlrd

from MyPoco.protocol_file import cg_pb2
__author__ = "v.lidd"
__title__ = '登录游戏'
__desc__ = """ 1.
               2.

                """


class test:
    def __init__(self):
        self.recruit_type = 123
    def namegogog(self, s):
        print(s + "进来了")


if __name__ == '__main__':
    test_list_dic = [{},{},{}]
    for dic  in test_list_dic:
        dic["log"] = "1234"
    print(test_list_dic)







    # todo 兼容平台日志系统
# simple_report(__file__,logpath=log_path)
