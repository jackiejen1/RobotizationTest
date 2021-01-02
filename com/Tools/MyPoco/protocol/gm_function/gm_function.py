# _*_coding:utf-8 _*_
# !/usr/bin/python3

# Reference:********************************
# encoding: utf-8
# @Time: 2020/12/16 10:08
# @Author: jingpf
# @File: gm_function.py
# @Intro:gm方法调用的主方法，根据游戏名判断使用哪个gm文件
# Reference:********************************
from foundation.information import Information
from protocol.gm_function.shaoxia_gm_function import shaoxia_gm_function
from protocol.gm_function.ss2_gm_function import ss2_gm_function


class Gm_function:
    def __init__(self, game_name, phone_id, ui_path=None):
        self.info = Information()
        self.game_name_key = game_name
        self.game_name = self.info.get_config(game_name, "app_name")
        self.gm_func = None
        self.phone_id = phone_id
        self.run()

    def run(self):
        """
        异常弹窗跳过，区分不同的游戏走不同的逻辑
        :param poco_input: poco对象
        :return:
        """
        if self.gm_func == None:
            if "少侠" in self.game_name_key:  # 少侠
                self.gm_func = shaoxia_gm_function(self.game_name_key, self.phone_id)
            elif "少三2" in self.game_name_key:
                self.gm_func = ss2_gm_function(self.game_name_key, self.phone_id)
            else:
                pass
        return self.gm_func


if __name__=="__main__":
    test = Gm_function('少侠').run()
    # print(test)
    # test = test.run()
    # print(dir(test))
    test.run1()
    # test