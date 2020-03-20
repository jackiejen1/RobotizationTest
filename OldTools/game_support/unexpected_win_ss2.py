# _*_coding:utf-8 _*_
# !/usr/bin/python3
# Reference:********************************
# encoding: utf-8
# @Time: 2019/11/19  18:11
# @Author: 洞洞
# @File: unexpected_win_ss2.py
# @Function:
# @Method:
# Reference:********************************
from poco.exceptions import PocoNoSuchNodeException
from airtest.core.api import *
from poco.utils.simplerpc.simplerpc import RpcTimeoutError
from poco.drivers.std import StdPoco
import configparser
import threading


class UnexpectedWinSs2:

    def set_poco(self, poco_input):
        """
        :param poco_input: 用于设置和切换不同的poco对象
        :return:
        """
        self.poco = poco_input

    def ss2_unexpected_win(self):
        """
        少三2，识别：更新、天公福利、断网、报错
        :return:
        """
        if self.poco(text="未命名").exists():
            pass
        file_name = str(threading.get_ident())
        file_path = "D:\\poco_list_file\\" + file_name + ".txt"
        with open(file_path) as f:
            poco_name_list_str_list = f.readlines()
        poco_name_list_str = poco_name_list_str_list[0]
        poco_name_list = eval(poco_name_list_str)
        # poco_name_list_dic = eval(poco_name_list_str)# 新poco
        # poco_name_list = poco_name_list_dic.keys()

        try:
            if self.poco(text="内更新").exists():  # 点击完下载资源启动游戏
                self.poco(text="下载点2").click()
                sleep(10)
            if self.poco(text="天公福利,限时抢购").exists():  # 天公赐福
                self.poco("Btn_close").child("n4").click()
                sleep(1)
            for poco_name in poco_name_list:
                if "RedPacketRainPop/__view/Btn_close" in poco_name:
                    self.poco("RedPacketRainPop").child("__view").child("Btn_close").click()
            if "未命名/未命名/FloatMessageLayer/未命名/4001" in poco_name_list:
                self.poco("FloatMessageLayer").child("未命名").child("4001").click()
                self.poco("MailLayer").child("__view").child("n0").child("btn0").click()
            if "未命名/未命名/FloatMessageLayer/未命名/1001" in poco_name_list:
                self.poco("FloatMessageLayer").child("未命名").child("1001").click()
                self.poco("btn0").click()
            if "未命名/未命名/FloatMessageLayer/未命名/1002" in poco_name_list:
                self.poco("FloatMessageLayer").child("未命名").child("1002").click()
                self.poco(text="点击屏幕继续").click()
            if "未命名/未命名/FloatMessageLayer/未命名/1003" in poco_name_list:
                self.poco("FloatMessageLayer").child("未命名").child("1003").click()
                self.poco("FloatHotTimePop").child("__view").child("Comp_panel").child("btn0").click()
            if "未命名/未命名/FloatMessageLayer/未命名/1004" in poco_name_list:
                self.poco("FloatMessageLayer").child("未命名").child("1004").click()
                self.poco("FloatHotTimePop").child("__view").child("Comp_panel").child("btn0").click()
            if "未命名/未命名/FloatMessageLayer/未命名/2001" in poco_name_list:
                self.poco("FloatMessageLayer").child("未命名").child("2001").click()
            if "未命名/未命名/FloatMessageLayer/未命名/3002" in poco_name_list:
                self.poco("FloatMessageLayer").child("未命名").child("3002").click()
            if "未命名/未命名/FloatMessageLayer/未命名/4002" in poco_name_list:
                self.poco("FloatMessageLayer").child("未命名").child("4002").click()
                self.poco("Btn_return").click()
            if "未命名/popup/ComAssistPop/__view/Btn_cancel" in poco_name_list:
                self.poco("ComAssistPop").child("__view").child("Btn_cancel").click()
            # 断网
            if "ComAssistPop" in poco_name_list:
                for i in range(3):
                    if self.poco("ComAssistPop").child("__view").child("Btn_confirm").exists():
                        s = self.poco("ComAssistPop").child("__view").child("Label_des").get_text()
                        if "是否" in s:
                            pass
                        else:
                            self.poco("ComAssistPop").child("__view").child("Btn_confirm").click()
                    sleep(5)
                    if i == 2:  # 就当连不上，放弃重连
                        if self.poco("ComAssistPop").child("__view").child("Btn_cancel").exists():
                            self.poco("ComAssistPop").child("__view").child("Btn_cancel").click()
            # 报错 todo
            if "ErrorMessagePop" in poco_name_list:
                snapshot(msg="游戏报错")
                self.poco("Btn_ok").click()
        except RpcTimeoutError:
            snapshot(msg="poco超时异常")
            raise RpcTimeoutError(self)
