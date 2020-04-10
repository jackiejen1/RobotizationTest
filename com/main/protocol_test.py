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
import os

from MyPoco.foundation.get_poco_dic import GetPocoDic
import threading
import time

from MyPoco.my_poco import MyPoco

exitFlag = 0

class myThread(threading.Thread):
    def __init__(self, threadID, name, phone_name):
        threading.Thread.__init__(self)
        self.threadID = threadID
        self.name = name
        self.counter = phone_name

    def run(self):
        g = GetPocoDic(self.counter)
        d = g.get_poco_dic()
        # print(g.phone_size)
        # print(type(g.phone_size))
        print(d)

{'width': 1080, 'height': 2160, 'density': 3.0, 'orientation': 0, 'rotation': 0, 'max_x': 1079, 'max_y': 2159}
{'width': 1080, 'height': 2160, 'density': 3.0, 'orientation': 1, 'rotation': 90, 'max_x': 1079, 'max_y': 2159}
if __name__ == '__main__':
    thread1 = myThread(1, "Thread-1", "3e1a2b6")
    # thread2 = myThread(2, "Thread-2", "5fbc9c49")
    # # 开启新线程
    thread1.start()
    # thread2.start()
    thread1.join()
    # thread2.join()
    # print("退出主线程")
    # my_poco = MyPoco("少三2","3e1a2b6")
    # my_poco.my_touch("未命名0/popup/LoginAccountPop/__view/ButtonConfirm/title",click_list=[0,0])
