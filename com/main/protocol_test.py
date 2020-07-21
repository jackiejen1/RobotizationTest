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
import _thread
from MyPoco.my_poco import MyPoco
__phone_id__ = None
if __name__ == '__main__':
    my_poco = MyPoco("少三2",__phone_id__)
    sever_name = "QA2"
    account = my_poco.get_random_account()#随机账号
    # account = "16265795"
    sever_time = my_poco.make_new_role(sever_name, account)#创建或登录已有账号
    my_poco.set_account_information_gm(account, sever_name)#先这个，才能添加资源，海外暂不支持
    my_poco.add_resource({"角色经验": 409909990,"测试属性":999999999,})#添加资源，海外暂不支持
    my_poco.set_checkpoint(account, sever_name, {"副本": "副本-195-10"})#通关副本，海外暂不支持
    my_poco.GM_yijian_mingjiangzhuan(8)
    # my_poco.GM_fengkuang_fuben("副本-195-9",5)  20
    # my_poco.GM_fengkuang_haoling("sx",1334,True)
    # my_poco.GM_fengkuang_huashen(804,"元宝",6666)
    # my_poco.GM_fengkuang_hengsaoqianjun(457,"金斧子")
    # my_poco.GM_fengkuang_xianshijinjiang(795,"第六期金1-金5","吴","金将5选1箱（吴）")
    # my_poco.GM_fengkuang_haoyou(100,sever_name_into=sever_name,)
    my_poco.GM_yijian_account_haiwai_v1(account)
    # my_poco.GM_yijian_wushaungshilian(20)   20
    # my_poco.GM_huoyue_mingjiangzhuan()  20
    my_poco.GM_yijian_guanai() #20
    my_poco.GM_huoyue_lianyufuben()  #20
    #秘境寻宝 20次   20
    my_poco.GM_huoyue_taofajushou() #20
    #日常副本2次       10
    #赠送好友体力20次   10  C2S_Friend_SendGift
    #买4个体力丹        10 Shop_Shopping id = 101 num = 4

    #消耗元宝800        10 Shop_Shopping id = 105 num = 10
    #竞技场20次         20





