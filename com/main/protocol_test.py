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
import threading
import time
from MyPoco.my_poco import MyPoco
__phone_id__ = None

class myThread (threading.Thread):
    def __init__(self, sever_name_into, account_into):
        threading.Thread.__init__(self)
        self.sever_name = sever_name_into
        self.account = account_into

    def run(self):
        my_poco = MyPoco("少三2", None)
        my_poco.make_new_role(self.sever_name, self.account,is_new_account_into=True)  # 创建或登录已有账号
        my_poco.GM_yijian_account_v2(self.account)

if __name__ == '__main__':
    for i in range(30):

        my_poco = MyPoco("少三2",__phone_id__)
        sever_name = "QA3"
        account = my_poco.get_random_account()#随机账号
        # account = "18783278"
        sever_time = my_poco.make_new_role(sever_name, account,)#创建或登录已有账号
        my_poco.set_account_information_gm(account, sever_name)#先这个，才能添加资源，海外暂不支持
        my_poco.add_resource({"角色经验": 409909990,"测试属性": 999999999,"银币": 999999,"元宝": 999999,"贵族经验": 999999,})#添加资源，海外暂不支持
        my_poco.set_checkpoint(account, sever_name, {"副本": "副本-220-10"})#通关副本，海外暂不支持
        my_poco.GM_wangzhejingji()
    # my_poco.del_all_resource_pb()
    # my_poco.GM_yijian_fuben(4)#通关副本，海外用这个
    # my_poco.GM_yijian_chuanzhuangbei()
    # my_poco.GM_yijian_mingjiangzhuan(10)
    # my_poco.GM_fengkuang_fuben("副本-195-9",5)
    # my_poco.quit_Guild()
    # my_poco.GM_fengkuang_haoling("sfasf",1,False)
    # my_poco.GM_fengkuang_fujia(512,1,10)
    #
    # my_poco.GM_fengkuang_huashen(515,"仙法符纸",1)
    # my_poco.GM_fengkuang_hengsaoqianjun(513,"金斧子")
    # my_poco.GM_fengkuang_xianshijinjiang(518,"紫金1双卡池-金5","紫金","金将5选1箱（魏）")



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

    num = 0
    account_list = []
    Thread_list = []
    for i in range(num):
        my_poco = MyPoco("少三2",__phone_id__)
        sever_name = "QA4"
        account = my_poco.get_random_account()
        account_list.append(account)
        print(account_list)
        thread = myThread(sever_name, account)
        # 开启新线程
        thread.start()
        # Thread_list.append(thread)
    # for thread in Thread_list:
    #     thread.join()





