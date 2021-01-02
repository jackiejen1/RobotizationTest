# _*_coding:utf-8 _*_
#!/usr/bin/python3
#Reference:********************************
# encoding: utf-8
#@Time: 2019/11/21  18:37
#@Author: 敏丽
#@File: ss2_bianqiang_p0.py
#@Function:
#@Method:
#Reference:********************************

# __phone_id__ = '4823c41e'
__author__ = "v.zengml"
__title__ = "变强.p0 日本"
__desc__ = """
            切换页签，浏览变强方式列表，功能前往
            """
from airtest.core.api import *
auto_setup(__file__)
from MyPoco.my_poco import MyPoco
connect_device("Android:///")
__phone_id__ =device().uuid
my_poco = MyPoco("少三2日本", __phone_id__)
sever_name = "QA1"
resource_dic = {"角色经验": 49909990,}
play_dic = {"副本": "副本-210-10"}
account = my_poco.get_random_account()
sever_time = my_poco.make_new_role(sever_name, account)
my_poco.set_account_information_gm(account, sever_name)
my_poco.add_resource(resource_dic)
my_poco.set_checkpoint(sever_name, account, play_dic)
my_poco.add_resource({"贵族经验": 1000000})
my_poco.open_game(sever_name, account)

my_poco.my_touch("未命名0/module/HomeLayer/__view/Comp_topleft_btn/Btn_more",func_text="更多")
my_poco.my_touch("Btn_strong")
my_poco.my_touch("未命名0/module/StrongMainLayer/__view/ComTabPopCell2")#我要資源
my_poco.my_touch("未命名0/module/StrongMainLayer/__view/ComTabPopCell3")#推薦陣容
my_poco.my_touch("未命名0/module/StrongMainLayer/__view/ComTabPopCell1")#推荐养成
my_poco.my_touch("List_content/未命名0/Btn_goto")#1
my_poco.my_touch("n70")
my_poco.my_touch("Btn_return")
my_poco.my_touch("List_content/未命名1/Btn_goto")#2
my_poco.my_touch("Btn_return")
my_poco.my_touch("List_content/未命名2/Btn_goto")#3
my_poco.my_touch("Btn_return")
my_poco.my_touch("List_content/未命名3/Btn_goto")#4
my_poco.my_touch("Btn_return")
my_poco.my_swipe("List_content/未命名3","List_content/未命名0",5)
my_poco.my_touch("List_content/未命名1/Btn_goto")#5
my_poco.my_touch("Btn_return")
my_poco.my_touch("List_content/未命名2/Btn_goto")#6
my_poco.my_touch("Btn_return")
my_poco.my_touch("List_content/未命名3/Btn_goto")#7
my_poco.my_touch("Btn_return")
my_poco.my_swipe("List_content/未命名3","List_content/未命名0",5)
my_poco.my_touch("List_content/未命名1/Btn_goto")#8
my_poco.my_touch("Btn_return")
my_poco.my_touch("List_content/未命名2/Btn_goto")#9
my_poco.my_touch("Btn_return")
my_poco.my_touch("List_content/未命名3/Btn_goto")#10
my_poco.my_touch("Btn_return")
my_poco.my_swipe("List_content/未命名3","List_content/未命名0",5)
my_poco.my_touch("List_content/未命名1/Btn_goto")#11
my_poco.my_touch("Btn_return")
my_poco.my_touch("List_content/未命名2/Btn_goto")#12
my_poco.my_touch("Btn_return")
my_poco.my_touch("List_content/未命名3/Btn_goto")#13
my_poco.my_touch("Btn_return")
my_poco.my_swipe("List_content/未命名3","List_content/未命名0",5)
my_poco.my_touch("List_content/未命名1/Btn_goto")#14
my_poco.my_touch("Btn_return")
my_poco.my_touch("List_content/未命名2/Btn_goto")#15
my_poco.my_touch("Btn_return")
my_poco.my_touch("List_content/未命名3/Btn_goto")#16
my_poco.my_touch("Btn_return")
my_poco.my_swipe("List_content/未命名3","List_content/未命名0",5)
my_poco.my_touch("List_content/未命名1/Btn_goto")#17
my_poco.my_touch("Btn_return")
my_poco.my_touch("List_content/未命名2/Btn_goto")#18
my_poco.my_touch("Btn_return")
my_poco.my_touch("List_content/未命名3/Btn_goto")#19
my_poco.my_touch("Btn_return")
my_poco.my_touch("未命名0/module/StrongMainLayer/__view/ComTabPopCell2")#我要資源
my_poco.my_touch("List_content/未命名0/Btn_goto")#1
my_poco.my_touch("GotoPop/__view/n17/btn0")
my_poco.my_touch("List_content/未命名1/Btn_goto")#2
my_poco.my_touch("ComContinue",click_list=[0.5,1])
my_poco.my_touch("List_content/未命名2/Btn_goto")#3
my_poco.my_touch("GotoPop/__view/n17/btn0")
my_poco.my_touch("List_content/未命名3/Btn_goto")#4
my_poco.my_touch("GotoPop/__view/n17/btn0")
my_poco.my_swipe("List_content/未命名3","List_content/未命名0",5)
my_poco.my_touch("List_content/未命名1/Btn_goto")#5
my_poco.my_touch("GotoPop/__view/n17/btn0")
my_poco.my_touch("List_content/未命名2/Btn_goto")#6
my_poco.my_touch("GotoPop/__view/n17/btn0")
my_poco.my_touch("List_content/未命名3/Btn_goto")#7
my_poco.my_touch("GotoPop/__view/n17/btn0")
my_poco.my_swipe("List_content/未命名3","List_content/未命名0",5)
my_poco.my_touch("List_content/未命名1/Btn_goto")#8
my_poco.my_touch("GotoPop/__view/n17/btn0")
my_poco.my_touch("List_content/未命名2/Btn_goto")#9
my_poco.my_touch("GotoPop/__view/n17/btn0")
my_poco.my_touch("List_content/未命名3/Btn_goto")#10
my_poco.my_touch("GotoPop/__view/n17/btn0")
my_poco.my_swipe("List_content/未命名3","List_content/未命名0",5)
my_poco.my_touch("List_content/未命名1/Btn_goto")#11
my_poco.my_touch("GotoPop/__view/n17/btn0")
my_poco.my_touch("List_content/未命名2/Btn_goto")#12
my_poco.my_touch("GotoPop/__view/n17/btn0")
my_poco.my_touch("List_content/未命名3/Btn_goto")#13
my_poco.my_touch("GotoPop/__view/n17/btn0")
my_poco.my_swipe("List_content/未命名3","List_content/未命名0",5)
my_poco.my_touch("List_content/未命名1/Btn_goto")#14
my_poco.my_touch("GotoPop/__view/n17/btn0")
my_poco.my_touch("List_content/未命名2/Btn_goto")#15
my_poco.my_touch("GotoPop/__view/n17/btn0")
my_poco.my_touch("List_content/未命名3/Btn_goto")#16
my_poco.my_touch("GotoPop/__view/n17/btn0")
my_poco.my_swipe("List_content/未命名3","List_content/未命名0",5)
my_poco.my_touch("List_content/未命名3/Btn_goto")#17
my_poco.my_touch("GotoPop/__view/n17/btn0")
my_poco.my_touch("未命名0/module/StrongMainLayer/__view/ComTabPopCell3")#推薦陣容
my_poco.my_touch("btn0",func_text="魏")
my_poco.my_touch("Comp_place1")
my_poco.my_touch("InfoNewKnightPop/__view/n25/btn0")
my_poco.my_touch("Comp_place2")
my_poco.my_touch("InfoNewKnightPop/__view/n25/btn0")
my_poco.my_touch("Comp_place3")
my_poco.my_touch("InfoNewKnightPop/__view/n25/btn0")
my_poco.my_touch("Comp_place4")
my_poco.my_touch("InfoNewKnightPop/__view/n25/btn0")
my_poco.my_touch("Comp_place5")
my_poco.my_touch("InfoNewKnightPop/__view/n25/btn0")
my_poco.my_touch("Comp_place6")
my_poco.my_touch("InfoNewKnightPop/__view/n25/btn0")
my_poco.my_touch("btn1",func_text="蜀")
my_poco.my_touch("Comp_place1")
my_poco.my_touch("InfoNewKnightPop/__view/n25/btn0")
my_poco.my_touch("Comp_place2")
my_poco.my_touch("InfoNewKnightPop/__view/n25/btn0")
my_poco.my_touch("Comp_place3")
my_poco.my_touch("InfoNewKnightPop/__view/n25/btn0")
my_poco.my_touch("Comp_place4")
my_poco.my_touch("InfoNewKnightPop/__view/n25/btn0")
my_poco.my_touch("Comp_place5")
my_poco.my_touch("InfoNewKnightPop/__view/n25/btn0")
my_poco.my_touch("Comp_place6")
my_poco.my_touch("InfoNewKnightPop/__view/n25/btn0")
my_poco.my_touch("btn2",func_text="吴")
my_poco.my_touch("Comp_place1")
my_poco.my_touch("InfoNewKnightPop/__view/n25/btn0")
my_poco.my_touch("Comp_place2")
my_poco.my_touch("InfoNewKnightPop/__view/n25/btn0")
my_poco.my_touch("Comp_place3")
my_poco.my_touch("InfoNewKnightPop/__view/n25/btn0")
my_poco.my_touch("Comp_place4")
my_poco.my_touch("InfoNewKnightPop/__view/n25/btn0")
my_poco.my_touch("Comp_place5")
my_poco.my_touch("InfoNewKnightPop/__view/n25/btn0")
my_poco.my_touch("Comp_place6")
my_poco.my_touch("InfoNewKnightPop/__view/n25/btn0")
my_poco.my_touch("btn3",func_text="群")
my_poco.my_touch("Comp_place1")
my_poco.my_touch("InfoNewKnightPop/__view/n25/btn0")
my_poco.my_touch("Comp_place2")
my_poco.my_touch("InfoNewKnightPop/__view/n25/btn0")
my_poco.my_touch("Comp_place3")
my_poco.my_touch("InfoNewKnightPop/__view/n25/btn0")
my_poco.my_touch("Comp_place4")
my_poco.my_touch("InfoNewKnightPop/__view/n25/btn0")
my_poco.my_touch("Comp_place5")
my_poco.my_touch("InfoNewKnightPop/__view/n25/btn0")
my_poco.my_touch("Comp_place6")
my_poco.my_touch("InfoNewKnightPop/__view/n25/btn0")
my_poco.my_touch("Btn_return")
my_poco.close_game()