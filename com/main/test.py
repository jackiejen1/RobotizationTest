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
import os
import random
import re

from airtest.core.api import *
from airtest.cli.parser import cli_setup

import xlrd
from airtest.core.android.adb import ADB
from MyPoco.my_poco import MyPoco
from MyPoco.protocol_file import cg_pb2

__author__ = "v.lidd"
__title__ = '登录游戏'
__desc__ = """ 1.
               2.

                """

from MyPoco.foundation.information import Information
# from my_poco import *
# my_poco = MyPoco("shaosan2")
# log_path,log_name= my_poco.get_log_path(__file__)
# # my_poco.end_log(__file__,log_path,log_name)
# if not cli_setup():
#     if not os.path.exists(log_path):
#         os.makedirs(log_path)
#     auto_setup(__file__, logdir=log_path, devices=["Android:///", ])
# my_poco.test_touch("")
if __name__ == '__main__':
    mypoco = MyPoco("少三2")
    mypoco.set_xn_test()
    mypoco.xn_touch([0.35678210678211, 0.86624999046326])
