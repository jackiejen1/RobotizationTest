# _*_coding:utf-8 _*_
# !/usr/bin/python3
# Reference:********************************
# encoding: utf-8
# @Time: 2019/10/9  10:38
# @Author: 洞洞
# @File: my_poco_object.py
# @Function:可以先初始化该类，但必须启动app之后再初始化poco对象，且需调用set_poco方法
# @Method:
# Reference:********************************
from airtest.core.api import *
from poco.exceptions import PocoNoSuchNodeException
from poco.utils.simplerpc.simplerpc import RpcTimeoutError

using("Tools")
from get_info.information import Information
from game_support.unexpected_win import UnexpectedWin
#from Tools.get_info.information import Information
# from Tools.game_support.unexpected_win import UnexpectedWin


class MyPocoObject():
    """
    该类存放改写poco框架的方法
    需要先启动游戏，然后调用set_poco
    """

    def __init__(self):

        self.info = Information()
        self.uw = UnexpectedWin()
        self.poco = None

    def set_poco(self, poco_input):
        """
        :param poco_input: 用于设置和切换不同的poco对象
        :return:
        """
        self.poco = poco_input
        self.uw.set_poco(poco_input)
    def get_poco(self):
        return self.poco

    def my_swipe(self, start_poco, end_poco, timein=2):
        """
        传入两个poco对象或者坐标，以对象的中心点坐标进行滑动
        :param start_poco:
        :param end_poco:
        :return:两个poco对象的坐标
        """
        self.uw.unexpected_win()
        if type(start_poco)==list and  type(end_poco)==list :
            swipe(start_poco,end_poco,duration=timein)
            return None,None
        else:
            pos_2 = self.get_poco_pos(start_poco)
            pos_3 = self.get_poco_pos(end_poco)
            swipe(pos_2, pos_3, duration=timein)
            return pos_2, pos_3



    def find_poco(self, find_name, find_type="text", click_name=None, ynlist="不翻", direction="竖屏", click_type=None,
                  click_list=None):
        """
        只一个参数时，默认poco（text=find_name）
        :param find_name:需要查找的控件名
        :param find_type:name/text/obj
        :param click_name:需要点击的控件，默认none，表示和find_name是一个控件
        :param ynlist:是否翻页查找（上翻页、下翻页、不翻）
        :param click_type:需要点击的控件的类型，name/text，默认none，表示和find_name是一个控件
        :param click_list:点击UI偏移量[0,0]-[1,1]
        :return:
        """
        sleep(0.5)
        global find_to
        find_to = False
        for i in range(3):
            # 判断是否因为异常弹窗导致找不到
            self.uw.unexpected_win()
            if "翻页" in ynlist:
                self.phone_size = self.info.get_phone_size()
                for i in range(20):
                    i_go = i + 1
                    long_side = self.phone_size[0]
                    short_side = self.phone_size[1]
                    # 循环中找不到时可以继续下次循环
                    try:
                        # 查找的和点击的不一致
                        if click_name is not None:
                            # 判断需要点击的类型，后续可加入其他类型
                            if click_type == "name":
                                if find_type == "name":
                                    if self.poco(name=find_name).exists():
                                        self.poco(name=click_name).click(click_list)
                                        find_to = True
                                        break
                                if find_type == "text":
                                    if self.poco(text=find_name).exists():
                                        self.poco(name=click_name).click(click_list)
                                        find_to = True
                                        break
                        else:
                            if find_type == "obj":
                                if find_name.exists():
                                    find_name.click(click_list)
                                    find_to = True
                                    break
                            # 查找和点击是一个，翻页版
                            if find_type == "name":
                                if self.poco(name=find_name).exists():
                                    self.poco(name=click_name).click(click_list)
                                    find_to = True
                                    break
                            if find_type == "text":
                                if self.poco(text=find_name).exists():
                                    self.poco(text=find_name).click(click_list)
                                    find_to = True
                                    break
                    except PocoNoSuchNodeException:
                        print("第" + str(i_go) + "遍未找到")
                    # 循环结束再找不到报错
                    if i_go == 20:
                        snapshot(msg="翻页查找报错退出时画面")
                        raise PocoNoSuchNodeException(self)
                    if "下" in ynlist:
                        if direction == "横屏":
                            swipe([long_side / 2, short_side * 0.8], [long_side / 2, short_side * 0.2])
                        else:
                            swipe([short_side / 2, long_side * 0.8], [short_side / 2, long_side * 0.2])
                    if "上" in ynlist:
                        if direction == "横屏":
                            swipe([long_side / 2, short_side * 0.2], [long_side / 2, short_side * 0.8])
                        else:
                            swipe([short_side / 2, long_side * 0.2], [short_side / 2, long_side * 0.8])
                    sleep(3)
            # 不翻页
            else:
                # 查找的和点击的不一致

                if click_name is not None:
                        # 判断需要点击的类型，后续可加入其他类型
                    if click_type == "name":
                        if find_type == "name":
                            if self.poco(name=find_name).exists():
                                self.poco(name=click_name).click(click_list)
                                find_to = True
                                break
                        if find_type == "text":
                            if self.poco(text=find_name).exists():
                                self.poco(name=click_name).click(click_list)
                                find_to = True
                                break
                else:
                        # 查找和点击是一个
                    if find_type == "obj":
                        if find_name.exists():
                            find_name.click(click_list)
                            find_to = True
                            break
                    if find_type == "name":
                        if self.poco(name=find_name).exists():
                            self.poco(name=find_name).click(click_list)
                            find_to = True
                            break
                    else:
                        if self.poco(text=find_name).exists():
                            self.poco(text=find_name).click(click_list)
                            find_to = True
                            break
            if find_to:
                break
            sleep(5)
            if i == 2:
                if not find_to:
                    snapshot(msg="点击报错退出时画面")
                    raise PocoNoSuchNodeException(self)




    def get_poco_pos(self, find_pos_poco):
        """
        识别手机分辨率，换算ui控件的坐标
        :param find_pos_poco:
        :return:
        """
        # [x,y]
        pos_list = find_pos_poco.get_position()
        # [宽,高]
        phone_list = self.poco.get_screen_size()
        x = int(phone_list[0] * pos_list[0])
        y = int(phone_list[1] * pos_list[1])
        return [x, y]
