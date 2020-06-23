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
        "resource_excelpath": "\info_tab\少三道具类型表.xlsx",
        "gm_url": "10.3.39.187:8088",
        "QA1_server_ages": {"server_id": "2013440003", "host": "", "port": 0},
        "QA2_server_ages": {"server_id": "2013440004", "host": "", "port": 0},
        "QA3_server_ages": {"server_id": "2013440005", "host": "", "port": 0},
        "QA4_server_ages": {"server_id": "2013440006", "host": "", "port": 0},
        "QA5_server_ages": {"server_id": "2013440007", "host": "", "port": 0},
        "QA6_server_ages": {"server_id": "2013440008", "host": "", "port": 0},
        "xn_account": None,
        "sever_poco": "cocos-lua",
        "close_game_poco_name": None
    }
    shaosan2 = {
        "app_name": "com.youzu.test.qa",
        "uid": None,
        "sid": None,
        "c2sname": "MSG_C2S",
        "s2cname": "MSG_S2C",
        "protocolfilepath": "\protocol_file\cs.txt",
        "resource_excelpath": "\info_tab\少三2道具类型表.xlsx",
        "checkpointl_excelpath": "\info_tab\少三2关卡类型表.xlsx",
        "gm_url": "gmapi.qa.ngame2.youzu.com",
        "QA1_server_ages": {"server_id": "1652440001", "host": "10.3.128.5", "port": 16865},
        "QA2_server_ages": {"server_id": "1652440002", "host": "ft0.n.m.uuzuonline.net", "port": 16865},
        "QA3_server_ages": {"server_id": "1652440003", "host": "ft0.n.m.uuzuonline.net", "port": 16865},
        "QA4_server_ages": {"server_id": "1652440004", "host": "ft0.n.m.uuzuonline.net", "port": 16865},
        "QA5_server_ages": {"server_id": "1652440005", "host": "ft0.n.m.uuzuonline.net", "port": 16865},
        "QA6_server_ages": {"server_id": "1652440006", "host": "ft0.n.m.uuzuonline.net", "port": 16865},
        "QA7_server_ages": {"server_id": "1652440007", "host": "ft0.n.m.uuzuonline.net", "port": 16865},
        "xn_account": "lidong1234",
        "sever_poco": "cocos-lua",
        "close_game_poco_name": "HomeLayer"
    }
    shaoxi = {
        "app_name": "com.youzu.wgame2",
        "c2sname": None,
        "s2cname": None,
        "protocolfilepath": None,
        "resource_excelpath": "\info_tab\少西道具类型表.xlsx",
        "gm_url": "qa.test.snxyj.youzu.com",
        "QA1_server_ages": {"server_id": "2246440001", "host": "", "port": ""},
        "QA2_server_ages": {"server_id": "2246440002", "host": "", "port": ""},
        "QA3_server_ages": {"server_id": "", "host": "", "port": ""},
        "sever_poco": "cocos-lua",
        "close_game_poco_name": None,
    }
    sys_set = {
        "my_poco_path": None,
        "allphnoe_poco_sleep_time": 1
    }
    Information = {
        "少三2": shaosan2,
        "性能": xn,
        "少西": shaoxi,
        "少三": shaosan,
        "设置":sys_set
    }
