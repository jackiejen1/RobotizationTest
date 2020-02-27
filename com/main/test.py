# _*_coding:utf-8 _*_
#!/usr/bin/python3
#Reference:********************************
# encoding: utf-8
#@Time: 2020/1/15  15:33
#@Author: 洞洞
#@File: test.py
#@Function:
#@Method:
#Reference:********************************

# encoding: utf-8
#@Time: ${DATE}  ${TIME}
#@Author: 洞洞
#@File: ${NAME}.py
#@Function:
#@Method:
from airtest.cli.parser import cli_setup

__author__ = "v.lidd"
__title__ = '登录游戏'
__desc__ = """ 1.
               2.

                """
from my_poco import *
my_poco = MyPoco("shaosan2")
log_path,log_name= my_poco.get_log_path(__file__)
# my_poco.end_log(__file__,log_path,log_name)
if not cli_setup():
    if not os.path.exists(log_path):
        os.makedirs(log_path)
    auto_setup(__file__, logdir=log_path, devices=["Android:///", ])

# my_poco.test_touch("Btn_bag0")
# my_poco.end_log(__file__,log_path,log_name)

poco = my_poco.open_game("sever_name","game_account1")
# my_poco.first_function_go_run()
my_poco.my_touch("HomeBioBtnComp0")
my_poco.my_touch("knight20")
my_poco.my_touch("Btn_lineup0")  # 布阵
my_poco.my_touch("btn00")
my_poco.my_touch("no_task20")# 传记
my_poco.my_touch("btn00")
my_poco.my_touch("Txt_branch_task20")#奇遇
my_poco.my_touch("btn00")
my_poco.my_touch("Btn_achieve0")
my_poco.my_touch("点击屏幕继续")
my_poco.my_touch("Btn_fast0")# 传记扫荡
my_poco.my_touch("中流砥柱")
my_poco.my_touch("list_mission0/未命名0/btn_fast0")#扫荡
sleep(1)
my_poco.my_touch("ComBtn_10")#再次扫荡
sleep(1)
my_poco.my_touch("ComBtn_back0")
my_poco.my_touch("btn00")
my_poco.my_touch("Btn_bag0")#背包
my_poco.my_touch("btn00")
my_poco.my_touch("Comp_biographie0")
my_poco.my_touch("点击屏幕继续")
my_poco.my_touch("Btn_return0")
my_poco.my_touch("btn_fast0")#传记扫荡
my_poco.my_touch("中流砥柱")
my_poco.my_touch("list_mission0/未命名0/btn_fast0")
sleep(1)
my_poco.my_touch("ComBtn_10")
sleep(1)
my_poco.my_touch("ComBtn_back0")
my_poco.my_touch("btn00")
my_poco.my_touch("btn_bioteam0")#组队战役
my_poco.my_touch("list0/未命名0/ComBtnMiddle0")
my_poco.my_touch("btn_create0")
my_poco.my_touch("comp_invite0/txt_team_chapter0")
my_poco.my_touch("btn00")
my_poco.my_touch("btn_invite0")
my_poco.my_touch("btn_lineup0")
my_poco.my_touch("btn00")
my_poco.my_touch("btn_start0")# 战斗
sleep(20)
my_poco.my_touch("点击屏幕继续")
sleep(6)
my_poco.my_touch("点击屏幕继续")
my_poco.my_touch("Btn_return0")
my_poco.my_touch("ok0")
my_poco.my_touch("btn_join0")#加入队伍
my_poco.my_touch("btn00")
my_poco.my_touch("comp_tnum0")
# my_poco.my_touch("点击屏幕继续")
my_poco.my_touch("Btn_close0")
my_poco.my_touch("btn_acheive0")
my_poco.my_touch("btn00")
my_poco.my_touch("Btn_return0")
my_poco.my_touch("btn_boss0")#名将录
my_poco.my_touch("btn_reward0")
my_poco.my_touch("点击屏幕继续")
my_poco.my_touch("Btn_return0")
my_poco.my_touch("btn_invite0")#邀请函
my_poco.my_touch("btn_close0")
my_poco.my_touch("comp_list0/Comp_btn0")
my_poco.my_touch("comp_list0/Comp_btn0")
my_poco.my_touch("Comp_biographie0")
my_poco.my_touch("点击屏幕继续")
my_poco.touch_poco_obj(poco("btn_left"),click_list=[0,0.5])
my_poco.touch_poco_obj(poco("btn_right"),click_list=[0,0.5])
my_poco.my_touch("Btn_return0")
my_poco.close_game()
my_poco.end_log(__file__,log_path,log_name)


























# todo 兼容平台日志系统
# simple_report(__file__,logpath=log_path)