# _*_coding:utf-8 _*_
# !/usr/bin/python3
# Reference:********************************
# encoding: utf-8
# @Time: 2019/11/16  15:01
# @Author: 洞洞
# @File: new_account.py
# @Function:
# @Method:
# Reference:********************************
from foundation.information import Information
from game_support.new_account_ss2 import NewAccountSs2


class NewAccount:

    def __init__(self):
        self.info = Information()
        self.game_name = self.info.get_config("App_Name", "game_name")
        if self.game_name == "com.youzu.test.qa":
            self.nas = NewAccountSs2()
        else:
            pass

    def new_game_account(self, dic_input, sever_name_input):  # 接口方法，后期拓展游戏使用
        """
        创建一个新账号
        :param dic_input: 账号要求，字典
        :param sever_name_input: 区服名
        :return:
        """
        if self.game_name == "com.youzu.test.qa":  # ss2
            self.account,self.role_name=self.nas.new_account_ss2(dic_input, sever_name_input)
        else:
            pass
        self.info.set_config("Account_Number", "new_game_account", self.account)
        self.info.add_section(self.account)
        self.info.set_config(self.account, "sever_name", sever_name_input)
        self.info.set_config(self.account,sever_name_input,self.role_name)
        return self.account