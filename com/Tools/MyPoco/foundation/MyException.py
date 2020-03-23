# _*_coding:utf-8 _*_
#!/usr/bin/python3
#Reference:********************************
# encoding: utf-8
#@Time: 2020/1/14  16:54
#@Author: 洞洞
#@File: MyException.py
#@Function:
#@Method:
#Reference:********************************
from airtest.core.api import *
class NoneException(Exception):
    snapshot(msg="找不到控件")



class NoneStrException(Exception):
    print("")


class NotHaveGameException(Exception):
    print("")


class NotPocoServeException(Exception):
    print("")


class PocoVverstepBoundaryException(Exception):
    print("")