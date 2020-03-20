# _*_coding:utf-8 _*_
#!/usr/bin/python3
#Reference:********************************
# encoding: utf-8
#@Time: 2019/11/19  11:58
#@Author: 洞洞
#@File: fight_ss2.py
#@Function:
#@Method:
#Reference:********************************
from airtest.core.api import *
from poco.exceptions import PocoNoSuchNodeException
from poco.drivers.std import StdPoco

using("Tools")
from get_info.information import Information
from new_poco.my_poco_object import MyPocoObject
#from Tools.get_info.information import Information
#from Tools.poco.my_poco_object import MyPocoObject

class FightSs2:
    def __init__(self):
        self.info = Information()
        self.my_poco = MyPocoObject()
        self.game_name = self.info.get_config("App_Name", "game_name")
        self.poco = StdPoco()
        self.my_poco.set_poco(self.poco)
    def ss2_fight(self, sections_name, find_type1, click_name1, ynlist1, click_type1,
                  number_of_times, find_level):

        # 循环
        for i in range(number_of_times):
            # 开始点击战斗之前，判断体力是否足够
            physical_strength_str = self.poco("Comp_res1").child("Label_vit").get_text()
            physical_strength_int = int(physical_strength_str)
            if physical_strength_int <= 10:
                self.my_poco.find_poco(self.poco("Comp_res1").child("Label_vit"), find_type="obj")
                tld_str = self.poco("Comp_base").child("Txt_Num").get_text()
                tld_int = int(tld_str)
                if tld_int == 0:
                    self.my_poco.find_poco("购 买")
                    self.my_poco.find_poco("购 买")
                else:
                    self.my_poco.find_poco("使 用")
            self.my_poco.find_poco(sections_name, find_type=find_type1, click_name=click_name1, ynlist=ynlist1,
                                   click_type=click_type1)
            sleep(1)
            # 点击挑战
            self.my_poco.find_poco(self.poco("Btn_battle").child("icon"), find_type="obj")
            sleep(4)
            if self.poco("tiaoguo").exists():
                self.poco("tiaoguo").click()
                sleep(1)
            else:
                sleep(20)

            try:
                for i in range(3):
                    sleep(1)
                    self.my_poco.find_poco("点击屏幕继续")
            except PocoNoSuchNodeException:
                pass

            before_level = None  # todo
            if before_level == find_level:
                break