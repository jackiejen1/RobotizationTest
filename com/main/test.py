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
import os
import re
import time

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
# from MyPoco.my_poco import MyPoco

if __name__ == '__main__':
    # s = os.popen("adb shell LD_LIBRARY_PATH=/data/local/tmp /data/local/tmp/minicap -i ; echo ---$?---")
    # s = s.readlines()
    # m = re.findall(r"{.*?}", str(s))
    # s = str(m[0])
    # width=re.findall(r"width.*?,", str(s))
    # height = re.findall(r"height.*?,", str(s))
    # width = '''{"'''+width[0][:-1]+"}"
    # height = '''{"'''+height[0][:-1]+"}"
    # width = json.loads(width)
    # height= json.loads(height)
    # print(width)
    # print(height)
    pass
    # print(str(m))
    # print(re.findall(r"width:.*?,", str(m)))
    # print(re.findall(r"height:.*?,", str(m)))
    # my_poco = MyPoco("少西")
    # poco = my_poco.set_poco()
    # my_poco.set_account_information_gm("_15854", "QA1")
    # my_poco.set_level(7)
    # 少西
    # url = "http://qa.test.snxyj.youzu.com/api/gm/level"
    # payload = {"account": "_15854","role_id":30001018283 ,"server": "2246440001","level":6}
    # response = requests.request("POST", url, data=payload)
    # print(response.text.encode('utf8'))

    # url = "http://qa.test.snxyj.youzu.com/api/gm/resources/add"
    # data = {"type": 1, "id": 0, "num": 1}
    # data = [data,data,data]
    # data = json.dumps(data, ensure_ascii=False)
    # payload = {"account": "_mxq777", "role_id": 40001004231, "server": "2246440002", "data": data}
    # response = requests.request("POST", url, data=payload)
    # print(response.text.encode('utf8'))

    # 少西
    # url = "http://qa.test.snxyj.youzu.com/api/gm/role_id"
    # payload = {"account": "_1585721665", "server": "2246440002"}
    # response = requests.request("POST", url, data=payload)
    # print(response.json(encoding = "utf-8")['data'])
    # print(response.text.encode('utf8'))

    #少三
    # url = "http://10.3.39.187:8088/api/gm/role_id"
    # payload = {"account": "testls001", "role": "九天", "server": "2013440005"}
    # response = requests.request("POST", url, data=payload)
    # print(response.text.encode('utf8'))
    # a = response.json(encoding = "utf-8")
    # print(a)

    # 少三
    # url_add = "http://10.3.39.187:8088/api/gm/resources/add"
    # data = {"type": 3, "id": 5777, "num": 1}
    # data = [data,data,data]
    # data = json.dumps(data, ensure_ascii=False)
    # payload = {"account": "testls001", "role_id": 10000, "server": "2013440005", "data": data}
    # response = requests.request("POST", url_add, data=payload)
    # print(response.text.encode('utf8'))

    # 少三2
    # url_role_id = "http://10.3.39.187:8088/api/gm/role_id"
    # payload = {"account": "6947763", "role": "", "server": "17"}
    # response = requests.request("POST", url_role_id, data=payload)
    # print(response.text.encode('utf8'))
    # a = response.json(encoding = "utf-8")
    # print(a)

    # url_add = "http://gmapi.qa.ngame2.youzu.com/api/gm/resources/add"
    # data_list = [{"type": 3, "id": 1, "num": 1000}, {"type": 999, "id": 0, "num": 500000},  {"type": 1, "id": 33, "num": 10}, {"type": 1, "id": 2, "num": 9999}]
    # data = json.dumps(data_list, ensure_ascii=False)
    # print(type(data))
    # print(data)
    # payload = {"account": "93499947", "role_id": 206158440283, "server": "1652440002", "data": data}
    # response = requests.request("POST", url_add, data=payload)
    # data_json = response.json()
    # print(type(data_json))
    # print(data_json)


    # url_add = "http://gmapi.qa.ngame2.youzu.com/api/gm/resources/query"
    # data = {"type":999, "id": 0}
    # data1 = {"type": 1, "id": 1}
    # data2 = {"type": 1, "id": 3}
    # data = [data,data1,data2]
    # # data = [data1,data2]
    # data = json.dumps(data, ensure_ascii=False)
    # payload = {"account": "6947763", "role_id": 68719487192, "server": "1652440001", "data": data}
    # response = requests.request("POST", url_add, data=payload)
    # print(response.text.encode('utf8'))
    # url_add = "http://gmapi.qa.ngame2.youzu.com/api/gm/checkpoint"
    # payload = {"account": "6947763", "role_id": 68719487192, "server": "1652440001", "function": "2","checkpoint":3}
    # response = requests.request("POST", url_add, data=payload)
    # print(response.text.encode('utf8'))
    # url_add = "http://gmapi.qa.ngame2.youzu.com/api/gm/checkpoint"
    # payload = {"account": "6947763", "role_id": 68719487192, "server": "1652440001", "function": "3","checkpoint":2}
    # response = requests.request("POST", url_add, data=payload)
    # print(response.text.encode('utf8'))