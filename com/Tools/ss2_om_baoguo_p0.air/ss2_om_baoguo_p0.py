# _*_coding:utf-8 _*_
# !/usr/bin/python3
# Reference:********************************
# encoding: utf-8
# @Time: 2019/11/21  19:25
# @Author: 敏丽
# @File: ss2_baoguo_p1.py
# @Function:包裹
# @Method:
# Reference:********************************
# __phone_id__ = '4823c41e'
__author__ = "v.zengml"
__title__ = "包裹.p0 欧美"
__desc__ = """
            浏览各个页签
            """
from airtest.core.api import *

auto_setup(__file__)
from MyPoco.my_poco import MyPoco
connect_device("Android:///?cap_method=javacap&touch_method=adb")
__phone_id__ = device().uuid
my_poco = MyPoco("少三2欧美", __phone_id__)
sever_name = "QA2"
resource_dic = {"角色经验": 109990, "体力丹": 1, "进阶石": 1, "培养丹": 1, }
play_dic = {"副本": "副本-10-10"}
account = my_poco.get_random_account()
sever_time = my_poco.make_new_role(sever_name, account)
my_poco.set_account_information_gm(account, sever_name)
my_poco.add_resource(resource_dic)
my_poco.set_checkpoint(sever_name, account, play_dic)
my_poco.add_resource({"贵族经验": 1000000})
my_poco.open_game(sever_name, account)

my_poco.my_touch("未命名0/module/HomeLayer/__view/Comp_bottom/Btn_6/title")#包裹
my_poco.my_touch("tab2")
my_poco.my_touch("tab3")
my_poco.my_touch("tab4")
my_poco.my_touch("tab1")
my_poco.my_touch("未命名0/module/BagLayer/__view/Comp_bg/listView/未命名0/Comp_icon/Comp_base/Img_icon")
my_poco.my_touch("未命名0/module/BagLayer/__view/Comp_bg/listView/未命名18/Comp_icon/Comp_base/Img_icon")
my_poco.my_touch("未命名0/module/BagLayer/__view/Comp_bg/listView/未命名19/Comp_icon/Comp_base/Img_icon")
my_poco.my_touch("Btn_help")
my_poco.my_touch("ComContinue")
my_poco.my_touch("Btn_return")
my_poco.close_game()
