# _*_coding:utf-8 _*_
# !/usr/bin/python3
# Reference:********************************
# encoding: utf-8
# @Time: 2020/2/28  18:04
# @Author: 洞洞
# @File: protocol_test.py
# @Function:使用协议快速准备账号
# @Method:
# Reference:********************************
import os
import threading
import time
# from airtest.core.api import *
# auto_setup(__file__)
# __phone_id__=device().uuid
from MyPoco.my_poco import MyPoco
__phone_id__ = None
import sqlite3
from MyPoco.foundation.tools import *

def new_sql():
    conn = sqlite3.connect('GVG_account.db')
    cursor = conn.cursor()
    cursor.execute('create table user(account varchar(20) primary key,is_login varchar(20),sever_name varchar(20))')  # 创建表
    cursor.close()
    conn.commit()
    conn.close()

def set_account_sql(account_into,sever_name):
    """
    保存账号，用于创建账号使用
    :param account_into:
    :return:
    """
    sever_name = sever_name[-1:]
    account_into = str(account_into) + sever_name
    conn = sqlite3.connect('GVG_account.db')
    cursor = conn.cursor()
    cursor.execute('insert into user (account, is_login) values (' + account_into + ',0)')
    cursor.close()
    conn.commit()
    conn.close()

def get_account_sql():
    """
    获取账号，然后设置账号登录状态
    :return:
    """
    conn = sqlite3.connect('GVG_account.db')
    cursor = conn.cursor()
    cursor.execute('select *from user where is_login=0')
    values = cursor.fetchall()
    account = values[0][0]
    cursor.execute('UPDATE user SET is_login =1  WHERE account = ' + account)  # 更新登录状态
    cursor.close()
    conn.commit()
    conn.close()
    return account

def login():

    for i in range(500):
        my_poco = MyPoco("少三2",__phone_id__)
        account_sever_name = get_account_sql()
        if len(account_sever_name)==7:
            sever_name =account_sever_name[-1:]
            sever_name = "新QA"+sever_name
            account = account_sever_name[:-1]
            sever_time = my_poco.make_new_role(sever_name, account,)#创建或登录已有账号
            my_poco.protocol.Debate_EnterInfo()  # 进入
            my_poco.protocol.Debate_BattleStart(2)

def new_account(sever_name):
    # new_sql()
    for i in range(100):
        my_poco = MyPoco("少三2",__phone_id__)
        account = my_poco.get_random_account()[2:]#随机账号
        sever_time = my_poco.make_new_role(sever_name, account,)#创建或登录已有账号
        set_account_sql(account,sever_name)
        my_poco.set_account_information_gm(account, sever_name)#先这个，才能添加资源，海外暂不支持
        my_poco.add_resource({"角色经验": 4099909990,"测试属性": 1,"银币": 999999,})#添加资源，海外暂不支持
        my_poco.set_checkpoint(account, sever_name, {"副本": "副本-220-10"})#通关副本，海外暂不支持
        my_poco.GM_yijian_chuanzhuangbei()
        my_poco.protocol.Debate_EnterInfo()#进入
        my_poco.protocol.Debate_LineUp()#布阵
        my_poco.protocol.Debate_RefreshMatch()#手动匹配




if __name__ == '__main__':
    # sever_name = "新QA5"
    # new_account(sever_name)
    # login()
    # for a in range(7):
    #     dengji_dic = {0:20,1:59,2:60,3:80,4:81,5:120,}
    #     cishu =300
    #     dengji = dengji_dic[a]
    #     excel_tab_name = str(dengji) + "级启阵结果"
    #     zong_choujiang_log = ""
    #     for i in range(cishu):
    #         my_poco = MyPoco("少三2",__phone_id__)
    #         sever_name = "QA4"
    #         account = my_poco.get_random_account()#随机账号
    #         account = "1"+account
    #         sever_time = my_poco.make_new_role(sever_name, account,)
    #         my_poco.set_account_information_gm(account, sever_name)
    #         my_poco.add_resource({"角色经验": 4099909990,"测试属性": 1,"银币": 999999,})
    #         my_poco.set_checkpoint(account, sever_name, {"副本": "副本-120-10"})
    #         choujiang_log = my_poco.dongfengxunbao(dengji)
    #         if i == 0:
    #             zong_choujiang_log = choujiang_log
    #         else:
    #             zong_choujiang_log =zong_choujiang_log +"\r\n"+choujiang_log
    #     new_excel_tab_dongfeng(excel_tab_name, zong_choujiang_log)
    for i in range(7):
        my_poco = MyPoco("少三2日本", __phone_id__)
        sever_name = "QA2"
        account = my_poco.get_random_account()  # 随机账号
        account = "1" + account
        sever_time = my_poco.make_new_role(sever_name, account, )
        my_poco.set_account_information_gm(account, sever_name)
        my_poco.add_resource({"角色经验": 4099909990, "测试属性": 1, "银币": 999999, })
        my_poco.set_checkpoint(account, sever_name, {"副本": "副本-120-10"})
        my_poco.GM_yijian_chuanzhuangbei()
        my_poco.shangzhenshenshou(1,"碧水麒麟")
        my_poco.shangzhenshenshou(2, "神木青鸾")
        my_poco.shangzhenshenshou(3, "九天应龙")
        my_poco.shangzhenshenshou(4, "狱火穷奇")
        my_poco.shangzhenshenshou(5, "巨猿")
        my_poco.shangzhenshenshou(6, "撼地灵犀")
    # my_poco.xue_gong_lun_zhan()



    # # my_poco.protocol.Flush()
    # my_poco.taofamojiang()
    # my_poco.GM_new_join_guild(account[2:], 5, False)
    # my_poco.shangzhenwujiang(2, "陆逊")
    # my_poco.GM_new_join_guild("sdasa",5,True)
    # my_poco.GM_fengkuang_shenbingxilian("倚天剑",100000)
    # my_poco.GM_wangzhejingji()
    # my_poco.del_all_resource_pb()
    # my_poco.GM_yijian_fuben(4)#通关副本，海外用这个
    # my_poco.GM_yijian_chuanzhuangbei()
    # my_poco.GM_yijian_mingjiangzhuan(10)
    # my_poco.GM_fengkuang_fuben("副本-195-9",5)
    # my_poco.quit_Guild()
    # my_poco.GM_fengkuang_haoling("sfasf",99999999,"")
    # log_str_z, tongji_str_z, shijiancishu = my_poco.GM_fengkuang_fujia(580,2,10000)
    # my_poco.GM_fengkuang_shikongzhaohuan(582, 10000)
    my_poco.GM_fengkuang_xianshijinjiang(602,"紫金2双卡池","紫金1-2",10000,"紫金将8选1箱")
    log_str_z, tongji_str_z, shijiancishu = my_poco.GM_fengkuang_huashen(555,10000)
    log_str_z, tongji_str_z, shijiancishu = my_poco.GM_fengkuang_hengsaoqianjun(553,10000)
    # my_poco.GM_fengkuang_haoyou(50,sever_name_into=sever_name,)
    # my_poco.GM_yijian_account_v1(account)
    # my_poco.GM_yijian_account_v2(account)
    # my_poco.del_all_resource_pb()
    # my_poco.GM_yijian_wushaungshilian(20)
    # my_poco.GM_huoyue_mingjiangzhuan()
    # my_poco.GM_shop_shopping(105, 10)  # 买10个银币
    # my_poco.GM_shop_shopping(101, 4)  # 买4个体力丹
    # my_poco.GM_yijian_guanai()  # 通关关隘
    # my_poco.GM_huoyue_lianyufuben()  # 炼狱副本
    # my_poco.GM_huoyue_taofajushou()  # 讨伐巨兽
    # my_poco.GM_huoyue_friend_send_gift()  # 好友送礼
    # my_poco.GM_huoyue_mijingduobao()
    # my_poco.GM_huoyue_jingjichang()
    # for i in range(5):
    #     account = my_poco.get_random_account()  # 随机账号
    #     sever_time = my_poco.make_new_role(sever_name, account)  # 创建或登录已有账号
    #     my_poco.GM_fengkuang_haoyou(50, sever_name_into=sever_name, )
    # my_poco.protocol.add_resource_pb(999,0,1)





