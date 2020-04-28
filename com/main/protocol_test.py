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
import io
import json
import os
import re

import xlrd
import xlwt as xlwt

from MyPoco.airtestide_lack_packages.compat import script_dir_name
from airtest.report.report import simple_report

from MyPoco.foundation.get_poco_dic import GetPocoDic
import threading
import time

from MyPoco.foundation.information import Information

from airtest.core.api import *

from MyPoco.my_poco import MyPoco

exitFlag = 0

class myThread(threading.Thread):
    def __init__(self, threadID, name, phone_name,game_name):
        threading.Thread.__init__(self)
        self.threadID = threadID
        self.name = name
        self.counter = phone_name
        self.game_name=game_name

    def run(self):
        g = GetPocoDic(self.game_name,self.counter)
        d = g.get_poco_dic()
        # print(g.phone_size)
        # print(type(g.phone_size))
        print(d)

{'width': 1080, 'height': 2160, 'density': 3.0, 'orientation': 0, 'rotation': 0, 'max_x': 1079, 'max_y': 2159}
{'width': 1080, 'height': 2160, 'density': 3.0, 'orientation': 1, 'rotation': 90, 'max_x': 1079, 'max_y': 2159}
from airtest.core.api import device
auto_setup(__file__)
if __name__ == '__main__':

    # com.youzu.g36.yz.qa 36计
    # thread1 = myThread(1, "Thread-1", "","com.youzu.test.qa")
    # thread2 = myThread(2, "Thread-2", "3e1a2b6","com.youzu.test.qa")
    # # 开启新线程
    # thread1.start()
    # thread2.start()
    # thread1.join()
    # thread2.join()
    # print("退出主线程")
    # my_poco = MyPoco("少三2","")
    # my_poco.my_touch("InputName")
    # ss = os.system("adb -s 3e1a2b6 logcat -v time")
    # aa = ss.readlines()
    # print(aa)
    #
    # my_poco = MyPoco("少三2", "")
    # # my_poco.set_account_information_gm('6947763', "QA1", 68719487192)
    # # my_poco.add_resource({"元宝":5})
    # print(my_poco.my_poco_obj.make_poco_dic.gpd.device())
    # print(device().uuid)
    from poco.drivers.std import StdPoco
    poco=StdPoco()
    poco()

