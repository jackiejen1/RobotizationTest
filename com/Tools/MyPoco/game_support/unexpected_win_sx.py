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
from poco.drivers.std import StdPoco
from time import sleep
from foundation.make_poco_dic import MakePocoDic


class UnexpectedWinSx:
    def __init__(self):
        self.make_poco_dic = MakePocoDic()
        self.poco = StdPoco()
        self.make_poco_dic.set_poco(self.poco)
        self.make_poco_dic.get_poco_dic()
    def unexpected_win(self):
        self.make_poco_dic.renovate_and_get_poco_dic()
        # 战斗结束会出现等级礼包
        if self.make_poco_dic.is_in_dic("少年，我们为你准备了丰富的等级礼包，是否前往购买？"):
            self.make_poco_dic.my_touch("取 消")
            time.sleep(2)
        # 点击挑战的时候会提示包裹满了
        if self.make_poco_dic.is_in_dic("MissionChoseStageScene0/popupRootNode0/popModalLayer0/<Node | Tag = -10/Node0/Panel_info0/Image_bg_nei0/Button_vip"):
            self.make_poco_dic.my_touch("Button_go1/Button_normal")
            time.sleep(2)
            if self.make_poco_dic.is_in_dic("Button_shop"):
                self.make_poco_dic.my_touch("Button_shop")
                time.sleep(1)
            if self.make_poco_dic.is_in_dic("btn_ok"):
                self.make_poco_dic.my_touch("btn_ok")
                time.sleep(1)
            if self.make_poco_dic.is_in_dic("ProjectNode_back"):
                self.make_poco_dic.my_touch("ProjectNode_back")
                time.sleep(1)
        if self.make_poco_dic.is_in_dic("三界速报"):
            self.make_poco_dic.my_touch("Image_bg/Button_close").click()
            time.sleep(1)
        if self.make_poco_dic.is_in_dic("下载点1"):
            self.make_poco_dic.my_touch("下载点1")
            time.sleep(300)
            self.make_poco_dic.renovate_and_get_poco_dic()
        if self.make_poco_dic.is_in_dic("MissionChoseStageScene/popupRootNode/popModalLayer/未命名0/Node/Panel_info/Button_cancel/Text_btn_desc"):
            self.make_poco_dic.my_touch("MissionChoseStageScene/popupRootNode/popModalLayer/未命名0/Node/Panel_info/Button_cancel/Text_btn_desc")
        if self.make_poco_dic.is_in_dic("系统公告"):
            self.make_poco_dic.my_touch("我知道了")
        if self.make_poco_dic.is_in_dic("亲爱的少年："):
            self.make_poco_dic.my_touch("取 消")
            time.sleep(1)

