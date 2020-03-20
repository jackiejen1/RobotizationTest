# _*_coding:utf-8 _*_
#!/usr/bin/python3
#Reference:********************************
# encoding: utf-8
#@Time: 2019/12/13  17:57
#@Author: 洞洞
#@File: first_function_go_run.py
#@Function:
#@Method:
#Reference:********************************



from airtest.core.api import *
using("Tools")
from get_info.information import Information
from game_support.first_function_go_run_ss2 import FirstFunctionGoRunSs2

# from Tools.game_support.first_function_go_run_ss2 import FirstFunctionGoRunSs2
#from Tools.get_info.information import Information


class FirstFunctionGoRun:
    def __init__(self):
        self.info = Information()
        self.game_name = self.info.get_config("App_Name", "game_name")

    def first_function_go_run(self):
        """
        用来跳过一些功能初次进入的引导动画
        :return:
        """
        if self.game_name == "com.youzu.test.qa":
            ffgrs2 = FirstFunctionGoRunSs2()
            ffgrs2.first_function_go_run_ss2()
        else:
            pass