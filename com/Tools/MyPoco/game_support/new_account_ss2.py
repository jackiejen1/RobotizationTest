# _*_coding:utf-8 _*_
#!/usr/bin/python3
#Reference:********************************
# encoding: utf-8
#@Time: 2019/11/19  11:52
#@Author: 洞洞
#@File: new_account_ss2.py
#@Function:
#@Method:
#Reference:********************************
from airtest.core.api import *
from poco.drivers.std import StdPoco

using("Tools")
from get_info.information import Information
from game_support.resource_gm import ResourceGm
from new_poco.my_poco_object import MyPocoObject
#from Tools.get_info.information import Information
#from Tools.game_support.resource_gm import ResourceGm
#from Tools.poco.my_poco_object import MyPocoObject


class NewAccountSs2:

    def __init__(self):
        self.info = Information()
        self.rg = ResourceGm()
        self.my_poco = MyPocoObject()
        self.game_name = self.info.get_config("App_Name", "game_name")

    def new_account_ss2(self, dic_input, sever_name_input):
        """
        ss2的创建一个符合要求的账号，时间戳账号记录在config.ini.new_game_account字段
        :param dic_input: 字典，账号的数据
        :param sever_name_input: 区服名
        :return:
        """
        home()
        stop_app(self.game_name)
        sleep(2)
        start_app(self.game_name)
        sleep(10)
        self.poco = StdPoco()
        self.my_poco.set_poco(self.poco)
        newUser = str(int(time.time()))[3:]  # 时间戳截取账号
        self.info.set_config("Account_Number", "new_game_account", newUser)  # 记录账号
        self.my_poco.find_poco("InputName", find_type="name")
        text(newUser)
        self.my_poco.find_poco("确 认")
        self.my_poco.find_poco("公 告", click_name="AnnoCloseBtn", click_type="name")
        self.my_poco.find_poco("点击选服")
        self.my_poco.find_poco(self.poco("List_kind_server").child(text="1 - 10区"), click_list=[0.95, 0.95])
        sever_name = self.info.get_config("Sever_Name", sever_name_input)
        self.my_poco.find_poco(sever_name)
        self.my_poco.find_poco("Txt_guide", find_type="name")  # 关闭新手引导
        self.my_poco.find_poco("Btn_login", find_type="name")  # 开始游戏
        sleep(5)
        self.my_poco.find_poco("进入游戏")  # 创建角色
        sleep(15)
        for i in range(15):
            if self.poco("Btn_goto").exists():  # 广告
                self.poco("Btn_close").click()
            if self.poco("Comp_day1").exists():  # 签到
                self.poco("__view").child("n3").child("img0").click()


        self.rg.add_resource(dic_input)  # 添加资源
        # todo 副本进度
        stop_app(self.game_name)  # 操作完毕后关闭游戏