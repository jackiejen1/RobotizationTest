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
from foundation.MyException import *
from foundation.make_poco_dic import MakePocoDic


class UnexpectedWinSs2:
    def __init__(self):
        self.make_poco_dic = MakePocoDic()
        self.poco = StdPoco()
        self.make_poco_dic.set_poco(self.poco)

    def unexpected_win(self):
        """
        少三2，识别：更新、天公福利、断网、报错
        :return:
        """
        # todo 算法有问题，异常窗口排列顺序影响，需要改成完全排除所有窗口后才算排查完毕
        # ComLoading 转菊花的name
        self.make_poco_dic.get_poco_dic()
        if self.make_poco_dic.is_in_dic("内更新"):  # 点击完下载资源启动游戏
            self.make_poco_dic.my_touch("下载点2")
            time.sleep(30)
            for i in range(5):
                if self.make_poco_dic.is_in_dic("InputName"):
                    return
                time.sleep(10)
        if self.make_poco_dic.is_in_dic("天公福利,限时抢购"):  # 天公赐福
            self.make_poco_dic.my_touch("Btn_close/n4")
            time.sleep(1)
        # if self.make_poco_dic.is_in_dic("未命名0/popup/HomeAdvPop/__view/Btn_close"):  # 首页广告
        #     self.make_poco_dic.my_touch("未命名0/popup/HomeAdvPop/__view/Btn_close")
        if self.make_poco_dic.is_in_dic("RedPacketRainPop/__view/Btn_close"):
            self.make_poco_dic.my_touch("RedPacketRainPop/__view/Btn_close")
        if self.make_poco_dic.is_in_dic("FloatMessageLayer/未命名0/4001"):
            self.make_poco_dic.my_touch("FloatMessageLayer/未命名0/4001")
            self.make_poco_dic.my_touch("MailLayer/__view/n0/btn0")
        if self.make_poco_dic.is_in_dic("FloatMessageLayer/未命名0/1001"):
            self.make_poco_dic.my_touch("FloatMessageLayer/未命名0/1001")
            self.make_poco_dic.my_touch("btn0")
        if self.make_poco_dic.is_in_dic("FloatMessageLayer/未命名0/1002"):
            self.make_poco_dic.my_touch("FloatMessageLayer/未命名0/1002")
            self.make_poco_dic.my_touch("点击屏幕继续")
        if self.make_poco_dic.is_in_dic("FloatMessageLayer/未命名0/1003"):
            self.make_poco_dic.my_touch("FloatMessageLayer/未命名0/1003")
            self.make_poco_dic.my_touch("FloatHotTimePop/__view/Comp_panel/btn0")
        if self.make_poco_dic.is_in_dic("FloatMessageLayer/未命名0/1004"):
            self.make_poco_dic.my_touch("FloatMessageLayer/未命名0/1004")
            self.make_poco_dic.my_touch("FloatHotTimePop/__view/Comp_panel/btn0")
        if self.make_poco_dic.is_in_dic("FloatMessageLayer/未命名0/2001"):
            self.make_poco_dic.my_touch("FloatMessageLayer/未命名0/2001")
            self.make_poco_dic.my_touch("FloatMessageLayer/未命名0/2001")
        if self.make_poco_dic.is_in_dic("FloatMessageLayer/未命名0/3002"):
            self.make_poco_dic.my_touch("FloatMessageLayer/未命名0/3002")
            self.make_poco_dic.my_touch("FloatMessageLayer/未命名0/3002")
        if self.make_poco_dic.is_in_dic("FloatMessageLayer/未命名0/4002"):
            self.make_poco_dic.my_touch("FloatMessageLayer/未命名0/4002")
            self.make_poco_dic.my_touch("Btn_return")
        if self.make_poco_dic.is_in_dic("未命名0/popup/ComAssistPop/__view/Btn_cancel/title"):#副本龙炮
            self.make_poco_dic.my_touch("未命名0/popup/ComAssistPop/__view/Btn_cancel/title")

        # 断网
        if self.make_poco_dic.is_in_dic("ComAssistPop"):
            for i in range(3):
                if self.make_poco_dic.is_in_dic("ComAssistPop/__view/Btn_confirm"):
                    s = self.make_poco_dic.get_poco_text("ComAssistPop/__view/Label_des")
                    if "是否" in s:
                        pass
                    else:
                        self.make_poco_dic.my_touch("ComAssistPop/__view/Btn_confirm")
                sleep(5)
                if i == 2:  # 就当连不上，放弃重连
                    if self.make_poco_dic.is_in_dic("ComAssistPop/__view/Btn_cancel"):
                        self.make_poco_dic.my_touch("ComAssistPop/__view/Btn_cancel")
            # todo 异常弹窗的后续操作

        # 报错
        if self.make_poco_dic.is_in_dic("ErrorMessagePop"):
            snapshot(msg="游戏报错")
            self.make_poco_dic.my_touch("Btn_ok")
            raise NotHaveGameException

