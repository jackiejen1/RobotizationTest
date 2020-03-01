# _*_coding:utf-8 _*_
# !/usr/bin/python3
# Reference:********************************
# encoding: utf-8
# @Time: 2020/1/15  15:33
# @Author: 洞洞
# @File: test.py
# @Function:
# @Method:
# Reference:********************************
import os
import random
import re


from airtest.cli.parser import cli_setup

import xlrd

from MyPoco.my_poco import MyPoco
from MyPoco.protocol_file import cg_pb2

__author__ = "v.lidd"
__title__ = '登录游戏'
__desc__ = """ 1.
               2.

                """
if __name__ == '__main__':
    my_poco = MyPoco("shaosan2")
    my_poco.test_touch("点击任意区域继续")
    # my_poco.test_touch()

    x = {'children': [{'children': [{'name': '<Node | Tag = -1',
                                     'payload': {'rotion': 0, 'size': [0, 0], 'tag': -1, 'visible': True,
                                                 'rotion3D': {'y': 0, 'x': 0, 'z': 0}, 'desc': '<Node | Tag = -1',
                                                 'pos': [0.1218163728714, 0.094335556030273], 'scale': [1, 1],
                                                 'anchorPoint': [0, 1], 'type': 'UBg',
                                                 'zOrders': {'global': 0, 'local': 0},
                                                 'name': '<Node | Tag = -1', 'skew': [0, 0]}, }],
                       'name': '<Node | Tag = -1',
                       'payload': {'rotion': 0, 'size': [0, 0], 'tag': -1, 'visible': True,
                                   'rotion3D': {'y': 0, 'x': 0, 'z': 0},
                                   'desc': '<Node | Tag = -1', 'pos': [0.11484375, 0.0087499618530273], 'scale': [1, 1],
                                   'anchorPoint': [0, 1], 'type': 'UBg', 'zOrders': {'global': 0, 'local': -1},
                                   'name': '<Node | Tag = -1', 'skew': [0, 0]}, '__parent__': 12424},
                      {'children': [{'children': [{'name': '<Sprite | Tag = -1, TextureID = 26>',
                                                   'payload': {'rotion': 0, 'size': [0.0828125, 0.165625],
                                                               'tag': -1, 'visible': True,
                                                               'rotion3D': {'y': 0, 'x': 0, 'z': 0},
                                                               'desc': '<Sprite | Tag = -1, TextureID = 26>',
                                                               'pos': [0.11539061069489, 0.0098440170288085],
                                                               'scale': [1, 1], 'anchorPoint': [0, 0],
                                                               'type': 'USprite',
                                                               'zOrders': {'global': 0, 'local': 0},
                                                               'name': '<Sprite | Tag = -1, TextureID = 26>',
                                                               'skew': [0, 0]}, '__parent__'
                                                   :
                                                       0x000001EFB7870A90}], 'name': '<Node | Tag = -1',
                                     'payload': {'rotion': 0, 'size': [0.084375, 0.16875], 'tag': -1, 'visible': True,
                                                 'rotion3D': {'y': 0, 'x': 0, 'z': 0}, 'desc': '<Node | Tag = -1',
                                                 'pos': [0.14437450170517, 0.067825126647949],
                                                 'scale': [0.18518517911434, 0.18518517911434],
                                                 'anchorPoint': [0.5, 0.5],
                                                 'type': 'UNode', 'zOrders': {'global': 0, 'local': 0},
                                                 'name': '<Node | Tag = -1', 'skew': [0, 0]}, '__parent__'
                                     :

                                         0x000001EFB7870A58}], 'name': '<Node | Tag = -1',
                       'payload': {'rotion': 0, 'size': [0, 0], 'tag': -1,
                                   'visible': True,
                                   'rotion3D': {'y': 0, 'x': 0, 'z': 0},
                                   'desc': '<Node | Tag = -1',
                                   'pos': [0.11484375, 0.0087499618530273],
                                   'scale': [5.3999328613281, 5.4011688232422],
                                   'anchorPoint': [0, 1], 'type': 'UComponent',
                                   'zOrders': {'global': 0, 'local': 0},
                                   'name': '<Node | Tag = -1', 'skew': [0,
                                                                        0]}, '__parent__':

                           0x000001EFB78709B0},
                      {'children': [{'children': [{'name': '<Sprite | Tag = -1, TextureID = 23>',
                                                   'payload': {'rotion': 0, 'size': [0.075, 0.15],
                                                               'tag': -1,
                                                               'visible': True,
                                                               'rotion3D': {'y': 0, 'x': 0, 'z': 0},
                                                               'desc': '<Sprite | Tag = -1, TextureID = 23>',
                                                               'pos': [0.11812498569489,
                                                                       0.015312480926514],
                                                               'scale': [1, 1], 'anchorPoint': [0, 0],
                                                               'type': 'USprite',
                                                               'zOrders': {'global': 0, 'local': 0},
                                                               'name': '<Sprite | Tag = -1, TextureID = 23>',
                                                               'skew': [0, 0]}, '__parent__'
                                                   :
                                                       0x000001EFB7870AC8}],
                                     'name': '<Node | Tag = -1',
                                     'payload': {'rotion': 0, 'size': [0.075, 0.15], 'tag': -1,
                                                 'visible': True,
                                                 'rotion3D': {'y': 0, 'x': 0, 'z': 0},
                                                 'desc': '<Node | Tag = -1',
                                                 'pos': [0.1443751335144, 0.067809772491455],
                                                 'scale': [0.20833332836628, 0.20833332836628],
                                                 'anchorPoint': [0.5, 0.5],
                                                 'type': 'UNode', 'zOrders': {'global': 0, 'local': 0},
                                                 'name': '<Node | Tag = -1', 'skew': [0, 0]},
                                     '__parent__'
                                     :

                                         0x000001EFB7870A20}], 'name': '<Node | Tag = -1', 'payload': {
                          'rotion': 0, 'size': [0, 0], 'tag': -1,
                          'visible': True,
                          'rotion3D': {'y': 0, 'x': 0, 'z': 0},
                          'desc': '<Node | Tag = -1',
                          'pos': [0.11812498569489, 0.015312480926514],
                          'scale': [4.800048828125, 4.7997741699219],
                          'anchorPoint': [0, 1], 'type': 'UComponent',
                          'zOrders': {'global': 0, 'local': 1},
                          'name': '<Node | Tag = -1', 'skew': [0,
                                                               0]}, '__parent__':

                           0x000001EFB78709B0}, {'name': '<Node | Tag = -1',
                                                 'payload': {'rotion': 0, 'size': [0, 0], 'tag': -1, 'visible': True,
                                                             'rotion3D': {'y': 0, 'x': 0, 'z': 0},
                                                             'desc': '<Node | Tag = -1',
                                                             'pos': [0.11484375, 0.014875030517578],
                                                             'scale': [0.69999694824219, 0.69999694824219],
                                                             'anchorPoint': [0, 1],
                                                             'type': 'UView', 'zOrders': {'global': 0, 'local': 1},
                                                             'name': '<Node | Tag = -1', 'skew': [0, 0]}, '__parent__'
                                                 :

                                                     0x000001EFB78709B0}, {
                          'children': [{'children': [{'name': '<Sprite | Tag = -1, TextureID = 78>',
                                                      'payload': {'rotion': 0, 'size': [0.02734375, 0.034375],
                                                                  'tag': -1, 'visible': True,
                                                                  'rotion3D': {'y': 0, 'x': 0, 'z': 0},
                                                                  'desc': '<Sprite | Tag = -1, TextureID = 78>',
                                                                  'pos': [0.11785154342651, 0.015312576293945],
                                                                  'scale': [1, 1], 'anchorPoint': [0, 0],
                                                                  'type': 'USprite',
                                                                  'zOrders': {'global': 0, 'local': 0},
                                                                  'name': '<Sprite | Tag = -1, TextureID = 78>',
                                                                  'skew': [0, 0]}, '__parent__'
                                                      : 0x000001EFB7870B38}], 'name': '<Node | Tag = -1',
                                        'payload': {'rotion': 0, 'size': [0, 0], 'tag': -1, 'visible': True,
                                                    'rotion3D': {'y': 0, 'x': 0, 'z': 0}, 'desc': '<Node | Tag = -1',
                                                    'pos': [0.11785154342651, 0.015312480926514], 'scale': [1, 1],
                                                    'anchorPoint': [0, 1], 'type': 'UImage',
                                                    'zOrders': {'global': 0, 'local': 0},
                                                    'name': '<Node | Tag = -1', 'skew': [0, 0]}, '__parent__'
                                        :

                                            0x000001EFB7870B70}], 'name': '<Node | Tag = -1',
                          'payload': {'rotion': 0, 'size': [0, 0],
                                      'tag': -1,
                                      'visible': True,
                                      'rotion3D': {'y': 0, 'x': 0, 'z': 0},
                                      'desc': '<Node | Tag = -1',
                                      'pos': [0.1274218082428,
                                              0.027343654632568],
                                      'scale': [1, 1],
                                      'anchorPoint': [0, 1],
                                      'type': 'UBg',
                                      'zOrders': {'global': 0, 'local': 3},
                                      'name': '<Node | Tag = -1',
                                      'skew': [0,
                                               0]}, '__parent__':

                0x000001EFB78709B0}, {'children': [{'children': [{'name': '<Sprite | Tag = -1, TextureID = 203>',
                                                                  'payload': {'rotion': 0,
                                                                              'size': [0.0453125, 0.090625],
                                                                              'tag': -1, 'visible': True,
                                                                              'rotion3D': {'y': 0, 'x': 0, 'z': 0},
                                                                              'desc': '<Sprite | Tag = -1, TextureID = 203>',
                                                                              'pos': [0.15968730449677,
                                                                                      9.5367431618421e-08],
                                                                              'scale': [1, 1], 'anchorPoint': [0, 0],
                                                                              'type': 'USprite',
                                                                              'zOrders': {'global': 0, 'local': 0},
                                                                              'name': '<Sprite | Tag = -1, TextureID = 203>',
                                                                              'skew': [0, 0]}, '__parent__'
                                                                  :
                                                                      0x000001EFB7870BA8}], 'name': '<Node | Tag = -1',
                                                    'payload': {'rotion': 0, 'size': [0.0453125, 0.090625], 'tag': -1,
                                                                'visible': True,
                                                                'rotion3D': {'y': 0, 'x': 0, 'z': 0},
                                                                'desc': '<Node | Tag = -1',
                                                                'pos': [0.16843730211258, 0.017500019073486],
                                                                'scale': [0.34482759237289, 0.34482759237289],
                                                                'anchorPoint': [0.5, 0.5],
                                                                'type': 'UNode', 'zOrders': {'global': 0, 'local': 0},
                                                                'name': '<Node | Tag = -1', 'skew': [0, 0]},
                                                    '__parent__'
                                                    :

                                                        0x000001EFB7870B00}], 'name': '<Node | Tag = -1',
                                      'payload': {'rotion': 0, 'size': [0, 0],
                                                  'tag': -1,
                                                  'visible': True,
                                                  'rotion3D': {'y': 0, 'x': 0,
                                                               'z': 0},
                                                  'desc': '<Node | Tag = -1',
                                                  'pos': [0.15968730449677, 0],
                                                  'scale': [1.6000061035156,
                                                            1.6000061035156],
                                                  'anchorPoint': [0, 1],
                                                  'type': 'UComponent',
                                                  'zOrders': {'global': 0,
                                                              'local': 8},
                                                  'name': '<Node | Tag = -1',
                                                  'skew': [0,
                                                           0]}, '__parent__':

                                          0x000001EFB78709B0}, {'name': '<Node | Tag = -1',
                                                                'payload': {'rotion': 0, 'size': [0.1, 0.090625],
                                                                            'tag': -1, 'visible': True,
                                                                            '_instanceId': 'userda: 0x91d19e80',
                                                                            'skew': [0, 0], 'text': '2',
                                                                            'desc': '<Node | Tag = -1',
                                                                            'pos': [0.11921873092651,
                                                                                    0.014218711853027],
                                                                            'scale': [1, 1], 'anchorPoint': [0, 1],
                                                                            'type': 'UHLabel',
                                                                            'zOrders': {'global': 0, 'local': 10},
                                                                            'name': '<Node | Tag = -1',
                                                                            'rotion3D': {'y': 0, 'x': 0, 'z': 0}},
                                                                '__parent__':0x000001EFB78709B0}],
         'payload': {'rotion': 0, 'size': [0, 0], 'tag': -1, 'visible': True,
                     'desc': '<Node | Tag = -1',
                     'pos': [0.11484375, 0.0087499618530273],
                     'scale': [0.69999694824219, 0.69999694824219],
                     'anchorPoint': [0, 1],
                     'type': 'UView', 'zOrders': {'global': 0, 'local': 1},
                     'rotion3D': {'y': 0, 'x': 0, 'z': 0},
                     'skew': [0, 0]}, }

    # todo 兼容平台日志系统
    # simple_report(__file__,logph=log_ph)
