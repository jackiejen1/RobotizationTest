# _*_coding:utf-8 _*_
#!/usr/bin/python3
#Reference:********************************
# encoding: utf-8
#@Time: 2020/8/25  15:01
#@Author: 洞洞
#@File: shaoxi_proto_test.py
#@Function:
#@Method:
#Reference:********************************
import time

import requests

from gm.gm_method import GmMethod
from proto_tool.proto_recv import ProtocolFunction

if __name__ == '__main__':
    version = 50010#版本号
    account = str(int(time.time()))[-6:]
    game_name ="少西"
    server_name="QA2"
    pr = ProtocolFunction(game_name,server_name,account)
    gm = pr.Login(version)
    gm.add_resources({"元宝":1})

