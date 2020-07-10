# _*_coding:utf-8 _*_
# !/usr/bin/python3
# Reference:********************************
# encoding: utf-8
# @Time: 2020/2/28  18:04
# @Author: 洞洞
# @File: protocol_test.py
# @Function:
# @Method:
# Reference:********************************
import datetime
import io
import json
import os
import re
import struct

import xlrd
import xlwt as xlwt

from MyPoco.airtestide_lack_packages.compat import script_dir_name
from airtest.report.report import simple_report

from MyPoco.foundation.get_poco_dic import GetPocoDic
import threading
import time
from poco.drivers.std import StdPoco

from MyPoco.my_poco import MyPoco
from MyPoco.protocol.make_resource_body import MakeResourceBody

from MyPoco.foundation.information import Information

from airtest.core.api import *

# from MyPoco.my_poco import MyPoco

exitFlag = 0


class myThread(threading.Thread):
    def __init__(self, threadID, name, phone_name, game_name):
        threading.Thread.__init__(self)
        self.threadID = threadID
        self.name = name
        self.counter = phone_name
        self.game_name = game_name

    def run(self):
        g = GetPocoDic(self.game_name, self.counter)
        d = g.get_poco_dic()
        # print(g.phone_size)
        # print(type(g.phone_size))
        print(d)


# {'width': 1080, 'height': 2160, 'density': 3.0, 'orientation': 0, 'rotation': 0, 'max_x': 1079, 'max_y': 2159}
# {'width': 1080, 'height': 2160, 'density': 3.0, 'orientation': 1, 'rotation': 90, 'max_x': 1079, 'max_y': 2159}
from airtest.core.api import device
# auto_setup(__file__)
import lupa
__phone_id__ = ""
if __name__ == '__main__':
    my_poco = MyPoco("少三2",__phone_id__)
    sever_name = "新马QA2"
    # account = my_poco.get_random_account()
    # sever_time = my_poco.make_new_role(sever_name, account)
    # my_poco.set_account_information_gm(account, sever_name)
    # my_poco.add_resource({"角色经验": 49909990,"测试属性":999999999 ,"贵族经验":500000,"元宝":500000})
    # my_poco.set_checkpoint(account, sever_name, {"副本": "副本-80-10"})
    my_poco.GM_fengkuanghaoyou(sever_name,50)




