# _*_coding:utf-8 _*_
#!/usr/bin/python3
#Reference:********************************
# encoding: utf-8
#@Time: 2020/9/28  12:10
#@Author: 洞洞
#@File: shaosan_proto_test.py
#@Function:
#@Method:
#Reference:********************************
import time

from ss_proto_tool.proto_method import ProtocolFunction

if __name__ == '__main__':
    account = str(int(time.time()))[-6:]
    server_name = "QA2"
    pr = ProtocolFunction(server_name, account)
    gm = pr.Login()
    # gm.add_resources({"战将令": 1})