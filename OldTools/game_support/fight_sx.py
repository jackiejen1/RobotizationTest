# _*_coding:utf-8 _*_
#!/usr/bin/python3
#Reference:********************************
# encoding: utf-8
#@Time: 2019/11/19  12:00
#@Author: 洞洞
#@File: fight_sx.py
#@Function:
#@Method:
#Reference:********************************
from airtest.core.api import *
from poco.exceptions import PocoNoSuchNodeException
from poco.drivers.std import StdPoco

using("Tools")
from get_info.information import Information
from new_poco.my_poco_object import MyPocoObject
# from Tools.get_info.information import Information
#from Tools.poco.my_poco_object import MyPocoObject


class FightSx:
    def __init__(self):
        self.info = Information()
        self.my_poco = MyPocoObject()
        self.game_name = self.info.get_config("App_Name", "game_name")
        self.poco = StdPoco()
        self.my_poco.set_poco(self.poco)

    def sx_fight(self, sections_name, find_type1="text", click_name1=None, ynlist1="不翻", click_type1=None,
                 number_of_times=1, find_level=None):
        # 仅适用于少西
        # 循环
        for i in range(number_of_times):
            # 开始点击战斗之前，判断体力是否足够
            physical_strength_int = 100
            if self.poco("Node_top_res1").offspring("Label_res_amount").exists():
                physical_strength_str = self.poco("Node_top_res1").offspring("Label_res_amount").get_text()
                physical_strength_list = physical_strength_str.split("/")
                physical_strength = physical_strength_list[0]
                physical_strength_int = int(physical_strength)
            # 体力小于10，吃体力丹
            if physical_strength_int <= 10:
                self.my_poco.find_poco("Image_top_bar", find_type="name")
                self.poco("Node_vit").child("Button_add").click()
                sleep(1)
                # self.MyPoco.find_poco(self.poco("Panel_6").child("Node_confirm").child("Text_btn_desc"), find_type="obj")
                self.my_poco.find_poco("购 买")
                sleep(1)
                # self.MyPoco.find_poco(self.poco("Panel_6").child("Node_cancel").child("Text_btn_desc"), find_type="obj")
                self.my_poco.find_poco("使 用")
                sleep(1)
                # self.MyPoco.find_poco(self.poco("Panel_info").child("Node_confirm").child("Text_btn_desc"), find_type="obj")
                self.my_poco.find_poco("确 认")
                sleep(1)
                self.my_poco.find_poco("Button_close", find_type="name")  # 回到关卡界面 todo

            self.my_poco.find_poco(sections_name, find_type=find_type1, click_name=click_name1, ynlist=ynlist1,
                                   click_type=click_type1)
            sleep(1)
            self.my_poco.find_poco("挑战")
            sleep(3)
            # self.MyPoco.find_poco(self.poco("<Layer | Tag = -1>").child("<Menu | Tag = -1>")[0].child("<MenuItem | tag = -1>")[0],click_type="obj")
            self.poco("<Layer | Tag = -1>").child("<Menu | Tag = -1>")[0].child("<MenuItem | tag = -1>")[1].click()
            sleep(5)
            # 在结算界面可看到等级
            number_str = self.poco("Text_level").get_text()
            number_list = number_str.split("：")
            number = number_list[1]
            level =  int(number)

            try:
                for i in range(3):
                    sleep(1)
                    self.my_poco.find_poco("点击屏幕继续")
            except PocoNoSuchNodeException:
                pass
            # 判断等级，终止循环
            if level == find_level:
                break