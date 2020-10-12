# _*_coding:utf-8 _*_
# !/usr/bin/python3
# Reference:********************************
# encoding: utf-8
# @Time: 2019/11/16  14:19
# @Author: 洞洞
# @File: unexpected_win.py
# @Function:
# @Method:
# Reference:********************************
from MyPoco.foundation.information import Information
from MyPoco.game_support.unexpected_win_ss2 import UnexpectedWinSs2
from MyPoco.game_support.unexpected_win_sx import UnexpectedWinSx
from MyPoco.game_support.unexpected_win_ss import UnexpectedWinSs
class UnexpectedWin:
    def __init__(self, game_name,phone_id):
        self.info = Information()
        self.game_name_key=game_name
        self.game_name = self.info.get_config(game_name, "app_name")
        self.uw = None
        self.phone_id =phone_id

    def unexpected_win(self):
        """
        异常弹窗跳过，区分不同的游戏走不同的逻辑
        :param poco_input: poco对象
        :return:
        """
        if self.uw == None:
            if self.game_name == "com.youzu.wgame2":
                self.uw = UnexpectedWinSx(self.game_name_key,self.phone_id)
            elif self.game_name == "com.youzu.test.qa":
                self.uw = UnexpectedWinSs2(self.game_name_key,self.phone_id)
            elif self.game_name == "jp.co.yoozoo.sgsblast":
                self.uw = UnexpectedWinSs2(self.game_name_key,self.phone_id)
            elif self.game_name == "com.yoozoo.kr.snsgz2":
                self.uw = UnexpectedWinSs2(self.game_name_key,self.phone_id)
            elif self.game_name == "com.youzu.android.snsgz":
                self.uw = UnexpectedWinSs(self.game_name_key,self.phone_id)
            elif self.game_name == "com.gamesword.twsst":
                self.uw = UnexpectedWinSs2(self.game_name_key,self.phone_id)
            elif self.game_name == "com.yoozoogames.ss2game":
                self.uw = UnexpectedWinSs2(self.game_name_key,self.phone_id)
            elif self.game_name == "com.vng.thieunien3qvng":
                self.uw = UnexpectedWinSs2(self.game_name_key,self.phone_id)
            else:
                pass
        print("开始查找异常窗口")
        self.uw.unexpected_win()
        print("异常窗口排查完毕")
