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

    def gorun(self, socket, protocol_name):
        """
        传入
        :param socket:
        :param protocol_name:
        :return:
        """
        args_list_dic = self.pt.get_args_list(protocol_name)
        for arg_dic in args_list_dic:
            flag, data = self.pt.make_def(socket, protocol_name, arg_dic)
            arg_dic["log"] = [flag, data]
        return args_list_dic# 可能有报错