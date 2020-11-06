# _*_coding:utf-8 _*_
#!/usr/bin/python3
#Reference:********************************
# encoding: utf-8
#@Time: 2020/11/4  15:06
#@Author: 洞洞
#@File: protocol_interface.py
#@Function:
#@Method:
#Reference:********************************

from MyPoco.protocol.protocol_function import ProtocolFunction
from MyPoco.foundation.MyException import *
class ProtocolInterface:
    def __init__(self,game_name_key,server_name,protocol_name,username,is_new_account,ui_path):
        """
        这些参数都要用，底层调用比较深，耦合有点大
        :param game_name_key str: 游戏名，少三2
        :param server_name: 服务器名 QA1，和配置文件对应
        :param protocol_name:
        :param username:
        :param is_new_account:
        :param ui_path:
        """
        self.game_name_key = game_name_key
        self.server_name=server_name
        self.protocol_name=protocol_name
        self.username=username
        self.is_new_account_into=is_new_account
        self.ui_path = ui_path

    def get_pro(self):
        if "少三2" in self.game_name_key:
            protocol = ProtocolFunction(self.game_name_key, self.server_name, self.protocol_name, self.username,
                                    is_new_account=self.is_new_account_into, ui_path=self.ui_path)
        else:
            protocol = ""
        if protocol !="":
            return protocol
        else:
            print("看看是不是没有接入该项目的接口模块")
            raise ProtocolException("没有适用的协议模块，请检查游戏名")