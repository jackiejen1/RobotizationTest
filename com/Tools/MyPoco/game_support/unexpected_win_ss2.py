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
from MyPoco.foundation.MyException import *
from MyPoco.foundation.make_poco_dic import MakePocoDic

class UnexpectedWinSs2:
    def __init__(self, game_name,phone_id):
        self.make_poco_dic = MakePocoDic(game_name,phone_id)
        # self.poco = StdPoco()
        # self.make_poco_dic.set_poco(self.poco)

    # def get_poco_dic(self):
    #     now_poco_dic = self.make_poco_dic.get_poco_dic()
    #     self.now_poco_path_list = now_poco_dic.keys()
    # 
    # def is_in_dic(self, poco_path):
    #     if poco_path in self.now_poco_path_list:
    #         return True
    #     else:
    #         return False

    def unexpected_win(self):
        """
        少三2，识别：更新、天公福利、断网、报错
        :return:
        """
        # todo 算法有问题，异常窗口排列顺序影响，需要改成完全排除所有窗口后才算排查完毕
        # ComLoading 转菊花的name
        self.make_poco_dic.get_poco_dic()
        # 报错
        if self.make_poco_dic.is_in_dic("ErrorMessagePop"):
            snapshot(msg="游戏报错")
            self.make_poco_dic.my_touch("Btn_ok")
            raise NotHaveGameException("游戏报错")
        if self.make_poco_dic.is_in_dic("未命名0/popup/ComTxtPop/__view/txt"):  # 点击完下载资源启动游戏
            txt_text = self.make_poco_dic.get_poco_any_value("未命名0/popup/ComTxtPop/__view/txt","text")
            if "MB" in txt_text or "KB" in txt_text:
                for i in range(5):
                    self.make_poco_dic.get_poco_dic()  # 这里会不停的刷新表
                    if self.make_poco_dic.is_in_dic('未命名0/popup/ComTxtPop/__view/cancel/title'):
                        self.make_poco_dic.my_touch("未命名0/popup/ComTxtPop/__view/cancel/title", func_text='点击开始更新')
                    else:
                        break
                time.sleep(10)
                for i in range(20):
                    self.make_poco_dic.get_poco_dic()#这里会不停的刷新表
                    if self.make_poco_dic.is_in_dic(
                            '未命名0/module/SevenDaysMainLayer/__view/ComTopBar/Btn_return'):  # 欧美加了个cg动画
                        self.my_poco_obj.touch_poco('Btn_return')
                    if self.make_poco_dic.is_in_dic("InputName"):
                        break
                    time.sleep(30)

        # if self.make_poco_dic.is_in_dic("天公福利,限时抢购"):  # 天公赐福
        if self.make_poco_dic.is_in_dic("未命名0/popup/GodboxPop/__view/Btn_close/n4"):  # 限时直冲
            self.make_poco_dic.my_touch("未命名0/popup/GodboxPop/__view/Btn_close/n4", func_text="关闭限时直冲活动")
            time.sleep(1)
        if self.make_poco_dic.is_in_dic("未命名0/popup/GodboxPop/__view/Label_title"):  # 天公赐福
            self.make_poco_dic.my_touch("Btn_close/n4")
            time.sleep(1)
        if self.make_poco_dic.is_in_dic("未命名0/popup/HomeAdvPop/__view/Btn_close/n5"):#限时金将
            self.make_poco_dic.my_touch("未命名0/popup/HomeAdvPop/__view/Btn_close/n5")
            time.sleep(1)
        if self.make_poco_dic.is_in_dic("未命名0/popup/HomeAdvPop/__view/Btn_close/n5"):
            self.make_poco_dic.my_touch("未命名0/popup/HomeAdvPop/__view/Btn_close/n5")
            time.sleep(1)
        if self.make_poco_dic.is_in_dic("未命名0/popup/HelperSpeedUpPop/__view/btn0"):
            self.make_poco_dic.my_touch("未命名0/popup/HelperSpeedUpPop/__view/btn0")#助手
            time.sleep(1)
            # self.make_poco_dic.my_touch("未命名0/popup/HelperPop/__view/ComPopPanel/btn0")
        # if self.make_poco_dic.is_in_dic("未命名0/popup/HomeAdvPop/__view/Btn_close"):  # 首页广告
        #     self.make_poco_dic.touch_poco("未命名0/popup/HomeAdvPop/__view/Btn_close")
        if self.make_poco_dic.is_in_dic("RedPacketRainPop/__view/Btn_close"):
            self.make_poco_dic.my_touch("RedPacketRainPop/__view/Btn_close")
            time.sleep(1)
        if self.make_poco_dic.is_in_dic("FloatMessageLayer/未命名0/4001"):#邮件,在这里对邮件模块进行测试
            self.make_poco_dic.my_touch("FloatMessageLayer/未命名0/4001")
            self.make_poco_dic.my_touch("List_mail/未命名0")
            if self.make_poco_dic.is_in_dic("List_mail/未命名1"):#如果存在第二封
                self.make_poco_dic.my_touch("List_mail/未命名1")
            self.make_poco_dic.my_touch("rewardComp/receiveBtn")# 领取
            self.make_poco_dic.my_touch("rewardComp/receiveBtn")# 删除
            if self.make_poco_dic.is_in_dic("List_mail/未命名1"):# 如果存在第二封，一键领取
                self.make_poco_dic.my_touch("__view/receiveBtn")
                self.make_poco_dic.my_touch("ontinue")
                self.make_poco_dic.my_touch("removeBtn")# 一键删除
                self.make_poco_dic.my_touch("ok")
            self.make_poco_dic.my_touch("MailLayer/__view/n0/btn0")
        if self.make_poco_dic.is_in_dic("FloatMessageLayer/未命名0/1001"):
            self.make_poco_dic.my_touch("FloatMessageLayer/未命名0/1001")
            self.make_poco_dic.my_touch("btn0")
        if self.make_poco_dic.is_in_dic("FloatMessageLayer/未命名0/1002"):
            self.make_poco_dic.my_touch("FloatMessageLayer/未命名0/1002")
            self.make_poco_dic.my_touch("ontinue")
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
        # if self.make_poco_dic.is_in_dic("未命名0/popup/ComAssistPop/__view/Btn_cancel/title"):#副本龙炮
        if self.make_poco_dic.is_in_dic("巨兽-龙炮"):  # 副本龙炮
            if self.make_poco_dic.is_in_dic("未命名0/popup/ComAssistPop/__view/Btn_cancel/title"):
                self.make_poco_dic.my_touch("未命名0/popup/ComAssistPop/__view/Btn_cancel/title")
        if self.make_poco_dic.is_in_dic("巨獸-龍炮"):  # 副本龙炮
            if self.make_poco_dic.is_in_dic("未命名0/popup/ComAssistPop/__view/Btn_cancel/title"):
                self.make_poco_dic.my_touch("未命名0/popup/ComAssistPop/__view/Btn_cancel/title")
        if self.make_poco_dic.is_in_dic("未命名0/popup/GodboxPop/__view/Btn_close"):
            self.make_poco_dic.my_touch("未命名0/popup/GodboxPop/__view/Btn_close")
        if self.make_poco_dic.is_in_dic("将军抱歉，为了更好的体验，我们正在对服务器进行维护，请稍后重新登录哦~"):
            self.make_poco_dic.my_touch("未命名0/未命名3/ComAssistPop/__view/Btn_cancel")
            raise GameServerMaintenanceException("服务器维护")
        if self.make_poco_dic.is_in_dic("장군님, 죄송합니다. 더 나은 게임 환경을 위해 서버 점검 중입니다. 잠시 후 다시 로그인하세요~"):
            self.make_poco_dic.my_touch("未命名0/未命名3/ComAssistPop/__view/Btn_cancel")
            raise GameServerMaintenanceException("服务器维护")
        if self.make_poco_dic.is_in_dic("未命名0/popup/JumpReviewPop/__view/Label_desc"):
            if self.make_poco_dic.is_this_text("未命名0/popup/JumpReviewPop/__view/Label_desc","評価"):
                self.make_poco_dic.my_touch("未命名0/popup/JumpReviewPop/__view/n0/btn0")
        if self.make_poco_dic.is_in_dic('未命名0/popup/HotItemPop/__view/Btn_close'):
            self.make_poco_dic.my_touch('未命名0/popup/HotItemPop/__view/Btn_close')
        # if self.make_poco_dic.is_in_dic("推荐[color=#FFE71A]普通月卡[/color]"):
        #     self.make_poco_dic.my_touch("未命名0/popup/FirstChargeMainPop/__view/btn3")

        # 断网
        if self.make_poco_dic.is_in_dic("您的网络状况不佳"):
            for i in range(3):
                self.make_poco_dic.my_touch("ComAssistPop/__view/Btn_confirm")
                if not self.make_poco_dic.is_in_dic("您的网络状况不佳"):
                    break
                sleep(5)
                if i == 2:  # 就当连不上，放弃重连
                    if self.make_poco_dic.is_in_dic("ComAssistPop/__view/Btn_cancel"):
                        self.make_poco_dic.my_touch("ComAssistPop/__view/Btn_cancel")
                        raise GameServerMaintenanceException("掉线连不上")

