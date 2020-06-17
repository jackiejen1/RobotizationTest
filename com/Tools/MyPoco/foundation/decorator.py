# _*_coding:utf-8 _*_
#!/usr/bin/python3
#Reference:********************************
# encoding: utf-8
#@Time: 2019/12/31  15:48
#@Author: 洞洞
#@File: decorators.py
#@Function:装饰器类
#@Method:
#Reference:********************************
import threading

from airtest.core.api import *

from MyPoco.foundation.MyException import NotPocoServeException
from MyPoco.foundation.information import Information

class err_close_game(object):
    def __init__(self,func):
        self.info = Information()
        self.func = func
    def __call__(self, *args, **kwargs):
        pass
