# _*_coding:utf-8 _*_
#!/usr/bin/python3
#Reference:********************************
# encoding: utf-8
#@Time: 2019/11/19  11:52
#@Author: 洞洞
#@File: new_account_ss2.py
#@Function:使用协议登录游戏创建账号
#@Method:
#Reference:********************************
from foundation.information import Information


class NewAccountSs2:

    def __init__(self):
        self.info = Information()
        self.game_name = "com.youzu.test.qa"
        self.my_poco_obj = MyPocoObject(self.game_name)
        self.rg = ResourceGm(self.game_name)

    def new_account_ss2(self, resource_dic_input, sever_name_input,play_dic):
        """
        ss2的创建一个符合要求的账号，时间戳账号记录在config.ini.new_game_account字段
        :param dic_input: 字典，账号的数据
        :param sever_name_input: 区服名
        :return:
        """
        snapshot(msg="上个脚本结束画面")
        home()
        stop_app(self.game_name)
        sleep(2)
        start_app(self.game_name)
        sleep(16)
        self.poco = self.my_poco_obj.new_poco_obj()
        newUser = str(int(time.time()))[3:]  # 时间戳截取账号
        self.info.set_config(self.game_name, "new_game_account", newUser)  # 记录账号
        self.my_poco_obj.touch_poco("InputName")
        text(newUser)
        self.my_poco_obj.touch_poco("确 认")
        self.my_poco_obj.touch_poco("未命名0/popup/AnnoMainPop/__view/AnnoCloseBtn")
        self.my_poco_obj.touch_poco("点击选服")
        self.my_poco_obj.touch_poco_obj("11 - 20区",click_list=[0.95, 0.15])  # todo 不同游戏可能要改
        sever_name = self.info.get_config(self.game_name, sever_name_input)
        self.my_poco_obj.touch_poco(sever_name)
        self.my_poco_obj.touch_poco("Txt_guide")  # 关闭新手引导
        self.my_poco_obj.touch_poco("Btn_login")  # 开始游戏
        sleep(5)
        role_name = self.my_poco_obj.get_poco_any_value("未命名0/module/CreateLayer/__view/Input_name","text")
        self.my_poco_obj.touch_poco("进入游戏")  # 创建角色
        sleep(15)
        self.rg.add_resource(resource_dic_input)  # 添加资源
        if "副本"in play_dic.keys():
            self.rg.set_play_fuben_num(play_dic["副本"])
        if "列传"in play_dic.keys():
            self.rg.set_play_liezhuan_num(play_dic["列传"])
        stop_app(self.game_name)  # 操作完毕后关闭游戏
        return newUser,role_name