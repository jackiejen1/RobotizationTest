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

    shaoxi = {
        "app_name": "com.youzu.wgame2",
        "c2sname": None,
        "s2cname": None,
        "protocolfilepath": None,
        "resource_excelpath": "\gm\少西道具类型表.xlsx",
        "QA1_server_ages": {"server_id": "2246440001", "host": "", "port": "", "gm_url": "qa.test.snxyj.youzu.com"},
        "QA2_server_ages": {"server_id": "2246440002", "host": "", "port": "", "gm_url": "qa.test.snxyj.youzu.com"},
        "QA3_server_ages": {"server_id": "", "host": "", "port": ""},
        "sever_poco": "cocos-lua",
        "close_game_poco_name": "MainCityScene",
    }
    sys_set = {
        "my_poco_path": None,
        "allphnoe_poco_sleep_time": 1
    }
    Information = {
        "性能": xn,
        "少西": shaoxi,
        "设置":sys_set
    }
