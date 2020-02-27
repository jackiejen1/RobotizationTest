# _*_coding:utf-8 _*_
#!/usr/bin/python3
#Reference:********************************
# encoding: utf-8
#@Time: 2019/11/19  11:52
#@Author: 洞洞
#@File: new_account_ss2.py
#@Function:使用协议登录游戏创建账号
#@Method:
#Reference:********************************
from MyPoco.foundation.information import Information


class NewAccountSs2:

    def __init__(self):
        self.info = Information()
        self.game_name = self.info.get_config("App_Name", "game_name")

    def new_account_ss2(self, dic_input, sever_name_input):
        """
        创建一个符合要求的账号，时间戳账号记录在config.ini.new_game_account字段
        :param dic_input: 字典，账号的数据
        :param sever_name_input: 区服名
        :return:账号、角色名
        """

        account =str(self.info.get_now_tiem_num())
        role_name=account[:4]

        return account,role_name
