# _*_coding:utf-8 _*_
# !/usr/bin/python3
# Reference:********************************
# encoding: utf-8
# @Time: 2019/11/19  18:06
# @Author: 洞洞
# @File: unexpected_win_sx.py
# @Function:
# @Method:
# Reference:********************************


from make_poco_dic import *

class UnexpectedWinSx:
    def __init__(self):

        self.make_poco_dic = MakePocoDic()
    def sx_unexpected_win(self,poco_name_list):

        # 战斗结束会出现等级礼包
        if self.make_poco_dic.is_in_dic("<Label | Tag = -1, Label = >少年，我们为你准备了丰富的等级礼包，是否前往购买？0"):
            self.make_poco_dic.my_touch("取 消")
            sleep(2)
        # 点击挑战的时候会提示包裹满了
        if self.make_poco_dic.is_in_dic("MissionChoseStageScene0/popupRootNode0/popModalLayer0/<Node | Tag = -10/Node0/Panel_info0/Image_bg_nei0/Button_vip0"):
            self.make_poco_dic.my_touch("Button_go10/Button_normal0")
            sleep(2)
            if self.make_poco_dic.is_in_dic("Button_shop0"):
                self.make_poco_dic.my_touch("Button_shop0")
                sleep(1)
            if self.make_poco_dic.is_in_dic("btn_ok0"):
                self.make_poco_dic.my_touch("btn_ok0")
                sleep(1)
            if self.make_poco_dic.is_in_dic("ProjectNode_back0"):
                self.make_poco_dic.my_touch("ProjectNode_back0")
                sleep(1)
        if self.make_poco_dic.is_in_dic("三界速报"):

            self.make_poco_dic.my_touch("ProjectNode_full0").offspring("Image_bg0").child("Button_close0").click()
            sleep(1)
        if self.make_poco_dic.is_in_dic("下载点1"):
            self.make_poco_dic.my_touch("下载点1")
            sleep(300)

        if self.make_poco_dic.is_in_dic("系统公告"):
            self.make_poco_dic.my_touch("Text_btn_desc0")
        if self.make_poco_dic.is_in_dic("亲爱的少年："):
            self.make_poco_dic.my_touch("取 消")
            sleep(1)

