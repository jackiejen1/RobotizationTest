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

if __name__ == '__main__':
    g = GetPocoDic()
    d = g.get_poco_dic()
    print(d)