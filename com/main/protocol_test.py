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
from MyPoco.foundation.get_poco_dic import GetPocoDic
import threading
import time
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
        print(d)


if __name__ == '__main__':
    # g = GetPocoDic(phone_name="3e1a2b6")
    # d = g.get_poco_dic()
    # print(d)
    #这里尝试使用多线程启动，分别获取多个手机上的poco信息
    # g = GetPocoDic(phone_name="5fbc9c49")
    # d = g.get_poco_dic()
    # print(d)
    # 创建新线程
    thread1 = myThread(1, "Thread-1", "3e1a2b6")
    thread2 = myThread(2, "Thread-2", "5fbc9c49")
    # 开启新线程
    thread1.start()
    thread2.start()
    thread1.join()
    thread2.join()
    print("退出主线程")