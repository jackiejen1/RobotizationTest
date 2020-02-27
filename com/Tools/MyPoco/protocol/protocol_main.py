# _*_coding:utf-8 _*_
# !/usr/bin/python3
# Reference:********************************
# encoding: utf-8
# @Time:
# @Author: 洞洞
# @File:
# @Function:
# @Method:
# Reference:********************************


from protocol_tools import ProtocolTools


class ProtocolMain:
    def __init__(self, game_name):
        self.pt = ProtocolTools(game_name)

    def Login(self):
        pass

    def set_protocol(self, socket, protocol_name):
        """
        传入
        :param socket:socket对象
        :param protocol_name:协议名
        :return:协议参数集 [{},{},{}]
        """
        self.socket = socket
        self.protocol_name=protocol_name
        return self.pt.get_args_list(protocol_name)# 可能有报错
    def send_protocol(self,arg_dic):
        """
        在脚本中遍历协议参数集，然后单独讲参数集合传入，单独分析结果
        :param arg_dic: {} 参数集
        :return: 返回值
        """
        flag, data = self.pt.make_def(self.socket, self.protocol_name, arg_dic)
        return flag, data