# _*_coding:utf-8 _*_
# !/usr/bin/python3
# Reference:********************************
# encoding: utf-8
# @Time: 2020/6/17  14:14
# @Author: 洞洞
# @File: config.py
# @Function:
# @Method:
# Reference:********************************


class Config:
    xn = {
        "app_name": "com.youzu.yztest_nosdk",
        "sever_poco": "android",
        "yztest2_account": None,
        "model_sleeptime": {"high": ["V1921A", 3], "medium": ["123", 3], "low": ["OPPO_A33", 3]},
    }
    shaosan = {
        "app_name": "com.youzu.android.snsgz",
        "uid": None,
        "sid": None,
        "c2sname": None,
        "s2cname": None,
        "protocolfilepath": None,
        "resource_excelpath": "\gm\少三道具类型表.xlsx",
        "QA1_server_ages": {"server_id": "2013440004", "host": "g1.n.qa.uuzuonline.net", "port": 38422,"gm_url": "10.3.39.187:8088",},
        "QA2_server_ages": {"server_id": "2013440003", "host": "g1.n.qa.uuzuonline.net", "port": 38422,"gm_url": "10.3.39.187:8088",},
        "QA3_server_ages": {"server_id": "2013440005", "host": "g1.n.qa.uuzuonline.net", "port": 38422,"gm_url": "10.3.39.187:8088",},
        "QA4_server_ages": {"server_id": "2013440006", "host": "g1.n.qa.uuzuonline.net", "port": 38422,"gm_url": "10.3.39.187:8088",},
        "QA5_server_ages": {"server_id": "2013440007", "host": "g1.n.qa.uuzuonline.net", "port": 38422,"gm_url": "10.3.39.187:8088",},
        "QA6_server_ages": {"server_id": "2013440008", "host": "g1.n.qa.uuzuonline.net", "port": 38422,"gm_url": "10.3.39.187:8088",},
        "xn_account": None,
        "sever_poco": "cocos-lua",
        "close_game_poco_name": None
    }
    sys_set = {
        "my_poco_path": None,
        "allphnoe_poco_sleep_time": 1
    }
    Information = {
        "性能": xn,
        "少三": shaosan,
        "设置":sys_set
    }
