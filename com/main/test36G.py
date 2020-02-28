# _*_coding:utf-8 _*_
#!/usr/bin/python3
#Reference:********************************
# encoding: utf-8
#@Time: 2020/1/15  15:33
#@Author: 洞洞
#@File: test36G.py
#@Function:
#@Method:
#Reference:********************************
import os
import time

from airtest.cli.parser import cli_setup
from airtest.core.api import auto_setup

__author__ = "v.lidd"
__title__ = '登录游戏'
__desc__ = """ 1.
               2.

                """
# from my_poco import *
# my_poco = MyPoco("shaosan2")
# log_path,log_name= my_poco.get_log_path(__file__)
# # my_poco.end_log(__file__,log_path,log_name)
# if not cli_setup():
#     if not os.path.exists(log_path):
#         os.makedirs(log_path)
#     auto_setup(__file__, logdir=log_path, devices=["Android:///", ])
# my_poco.test_touch("")
start_time=time.time()
time.sleep(0.3)
end_time = time.time()
use_time = end_time - start_time
print("poco数据获取用时%f" % use_time)





