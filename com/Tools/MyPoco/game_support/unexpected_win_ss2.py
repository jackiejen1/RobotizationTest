# _*_coding:utf-8 _*_
# !/usr/bin/python3
# Reference:********************************
# encoding: utf-8
# @Time: 2019/11/19  18:11
# @Author: 洞洞
# @File: unexpected_win_ss2.py
# @Function:
# @Method:
# Reference:********************************
from time import sleep
from airtest.core.api import *
from poco.drivers.std import StdPoco

from MyException import *
from make_poco_dic import MakePocoDic


class UnexpectedWinSs2:
    def __init__(self):

        self.make_poco_dic = MakePocoDic()
        self.poco = StdPoco()
        self.make_poco_dic.set_poco(self.poco)
        self.make_poco_dic.get_poco_dic()

    def ss2_unexpected_win(self):
        """
        少三2，识别：更新、天公福利、断网、报错
        :return:
        """
        # todo 算法有问题，异常窗口排列顺序影响，需要改成完全排除所有窗口后才算排查完毕
        print("开始查找异常窗口")
        if self.make_poco_dic.is_in_dic("内更新"):  # 点击完下载资源启动游戏
            self.make_poco_dic.my_touch("下载点2")
            sleep(15)
        if self.make_poco_dic.is_in_dic("天公福利,限时抢购"):  # 天公赐福
            self.make_poco_dic.my_touch("Btn_close0/n40")
            sleep(1)

        if self.make_poco_dic.is_in_dic("RedPacketRainPop0/__view0/Btn_close0"):
            self.make_poco_dic.my_touch("RedPacketRainPop0/__view0/Btn_close0")
        if self.make_poco_dic.is_in_dic("FloatMessageLayer0/未命名0/40010"):
            self.make_poco_dic.my_touch("FloatMessageLayer0/未命名0/40010")
            self.make_poco_dic.my_touch("MailLayer0/__view0/n00/btn00")
        if self.make_poco_dic.is_in_dic("FloatMessageLayer0/未命名0/10010"):
            self.make_poco_dic.my_touch("FloatMessageLayer0/未命名0/10010")
            self.make_poco_dic.my_touch("btn00")
        if self.make_poco_dic.is_in_dic("FloatMessageLayer0/未命名0/10020"):
            self.make_poco_dic.my_touch("FloatMessageLayer0/未命名0/10020")
            self.make_poco_dic.my_touch("点击屏幕继续")
        if self.make_poco_dic.is_in_dic("FloatMessageLayer0/未命名0/10030"):
            self.make_poco_dic.my_touch("FloatMessageLayer0/未命名0/10030")
            self.make_poco_dic.my_touch("FloatHotTimePop0/__view0/Comp_panel0/btn00")
        if self.make_poco_dic.is_in_dic("FloatMessageLayer0/未命名0/10040"):
            self.make_poco_dic.my_touch("FloatMessageLayer0/未命名0/10040")
            self.make_poco_dic.my_touch("FloatHotTimePop0/__view0/Comp_panel0/btn00")
        if self.make_poco_dic.is_in_dic("FloatMessageLayer0/未命名0/20010"):
            self.make_poco_dic.my_touch("FloatMessageLayer0/未命名0/20010")
            self.make_poco_dic.my_touch("FloatMessageLayer0/未命名0/20010")
        if self.make_poco_dic.is_in_dic("FloatMessageLayer0/未命名0/30020"):
            self.make_poco_dic.my_touch("FloatMessageLayer0/未命名0/30020")
            self.make_poco_dic.my_touch("FloatMessageLayer0/未命名0/30020")
        if self.make_poco_dic.is_in_dic("FloatMessageLayer0/未命名0/40020"):
            self.make_poco_dic.my_touch("FloatMessageLayer0/未命名0/40020")
            self.make_poco_dic.my_touch("Btn_return0")
        # 断网
        if self.make_poco_dic.is_in_dic("ComAssistPop0"):
            for i in range(3):
                if self.make_poco_dic.is_in_dic("ComAssistPop0/__view0/Btn_confirm0"):
                    s = self.make_poco_dic.get_poco_text("ComAssistPop0/__view0/Label_des0")
                    if "是否" in s:
                        pass
                    else:
                        self.make_poco_dic.my_touch("ComAssistPop0/__view0/Btn_confirm0")
                sleep(5)
                if i == 2:  # 就当连不上，放弃重连
                    if self.make_poco_dic.is_in_dic("ComAssistPop0/__view0/Btn_cancel0"):
                        self.make_poco_dic.my_touch("ComAssistPop0/__view0/Btn_cancel0")
            # todo 异常弹窗的后续操作

        # 报错
        if self.make_poco_dic.is_in_dic("ErrorMessagePop0"):
            snapshot(msg="游戏报错")
            self.make_poco_dic.my_touch("Btn_ok0")
            raise NotHaveGameException
        print("异常窗口排查完毕")
