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
import threading

from poco.exceptions import PocoNoSuchNodeException
from airtest.core.api import *
from poco.drivers.std import StdPoco
import configparser

class UnexpectedWinSx:
    def __init__(self):
        self.poco = StdPoco()

    def sx_unexpected_win(self):
        """
        少西的，识别：背包满、等级礼包、三界速报、更新、系统公告、亲爱的少年（？）
        :return:
        """
        if self.poco(text="未命名").exists():
            pass
        # root_dir = os.path.abspath(os.path.dirname(os.path.dirname(os.path.dirname(os.path.dirname(__file__)))))
        # root_dir_path = root_dir + "\\Tools\\poco_ui_list.txt"
        # root_dir_path = root_dir + "\\Tools\\poco_ui_list.ini"
        # cf = configparser.ConfigParser()
        # cf.read(root_dir_path)
        # poco_name_list_str = cf.get("PocoUIList", "finduilist")
        file_name = str(threading.get_ident())
        file_path = "D:\\poco_list_file\\" + file_name + ".txt"
        with open(file_path) as f:
            poco_name_list_str_list = f.readlines()
        poco_name_list_str=str(poco_name_list_str_list[0])
        poco_name_list = eval(poco_name_list_str)


        # 战斗结束会出现等级礼包
        if "<Label | Tag = -1, Label = >少年，我们为你准备了丰富的等级礼包，是否前往购买？" in poco_name_list:
        # if self.poco("popModalLayer").child("Node").child("ProjectNode_1").child("btn_cancel").child("Text_btn_desc").exists():
            self.poco(text="取 消").click()
            sleep(2)
        # 点击挑战的时候会提示包裹满了
        if "MissionChoseStageScene/popupRootNode/popModalLayer/<Node | Tag = -1/Node/Panel_info/Image_bg_nei/Button_vip" in poco_name_list:
        # if self.poco("ProjectNode_small_bg").child("ProjectNode_title").child("Image_title_bg").exists():
            self.poco("Button_go1").child("Button_normal").click() #todo
            sleep(2)
            if self.poco(name="Button_shop").exists():
                self.poco(name="Button_shop").click()
                sleep(1)
            if self.poco(name="btn_ok").exists():
                self.poco(name="btn_ok").click()
                sleep(1)
            if self.poco(name="ProjectNode_back").exists():
                self.poco(name="ProjectNode_back").click()
                sleep(1)
        if "三界速报" in poco_name_list:
        # if self.poco("ProjectNode_full").offspring("ProjectNode_title").child(text="三界速报").exists():
            self.poco("ProjectNode_full").offspring("Image_bg").child("Button_close").click()
            sleep(1)
        if "下载点1" in poco_name_list:
        # if self.poco(text="下载点1").exists():
            self.poco(text="下载点1").click()
            sleep(300)
        # if self.poco(text="系统公告").exists():# todo 游戏内
        #     self.poco(text="同 意").click()
        if "系统公告" in poco_name_list:
            self.poco("Text_btn_desc").click()
        if "亲爱的少年：" in poco_name_list:
        # if self.poco(text="亲爱的少年：").exists():
            self.poco(text="取 消").click()
            sleep(1)

        # todo 维护 杀掉游戏重新登录，效果一样 if

