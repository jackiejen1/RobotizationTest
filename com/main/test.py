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
import json

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
import requests
from MyPoco.poco.my_poco_object import MyPocoObject
from MyPoco.poco.my_poco_object import MakePocoDic

if __name__ == '__main__':
    # 少西
    # url = "http://qa.test.snxyj.youzu.com/api/gm/resources/add"
    # payload = {"account": "_mxq777","role_id":40001004231 ,"server": "2246440002","level":103}
    # response = requests.request("POST", url, data=payload)
    # print(response.text.encode('utf8'))
    # data = {"type": 1, "id": 0, "num": 1}
    # data = {"data": [data]}
    # data = json.dumps(data, ensure_ascii=False)
    # payload = {"account": "_mxq777", "role_id": 40001004231, "server": "2246440002", "data": data}
    # response = requests.request("POST", url, data=payload)
    # print(response.text.encode('utf8'))
    # 少西
    # url = "http://qa.test.snxyj.youzu.com/api/gm/role_id"
    # payload = {"account": "_mxq777", "server": "2246440002"}
    # response = requests.request("POST", url, data=payload)
    # print(response.text.encode('utf8'))

    # 少三
    url = "http://192.168.240.179:8088/api/gm/role_id"
    payload = {"account": "testls001", "role": "九天", "server": "2013440005"}
    response = requests.request("POST", url, data=payload)
    print(response.text.encode('utf8'))

    # 少三
    # url_add = "http://192.168.240.179:8088/api/gm/resources/add"
    # data = {"type": 3, "id": 5777, "num": 1}
    # data = {"data": [data]}
    # data = json.dumps(data, ensure_ascii=False)
    # payload = {"account": "_mxq777", "role_id": 40001004231, "server": "2246440002", "data": data}
    # response = requests.request("POST", url, data=payload)
    # print(response.text.encode('utf8'))
