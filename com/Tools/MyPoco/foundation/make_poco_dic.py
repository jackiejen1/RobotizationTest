# _*_coding:utf-8 _*_
# !/usr/bin/python3
# Reference:********************************
# encoding: utf-8
# @Time: 2020/1/14  17:08
# @Author: 洞洞
# @File: make_poco_dic.py
# @Function:框架基础类，不要直接在脚本中调用，编写辅助脚本使用MyPocoObject类
#           用于拓展框架函数使用
# @Method:
# Reference:********************************
import threading

from airtest.core.api import *
from airtest.report.report import simple_report

from MyPoco.airtestide_lack_packages.compat import script_dir_name
from MyPoco.foundation.get_poco_dic import GetPocoDic
from MyPoco.foundation.information import Information
from MyPoco.foundation.MyException import *


class MakePocoDic:
    def __init__(self, game_name, phone_id):
        self.info = Information()
        self.phone_id = phone_id
        self.game_name = self.info.get_config(game_name, "app_name")
        self.thread_file_name = str(threading.get_ident())
        path, name = script_dir_name(__file__)
        self.logpath = path + "/" + name[:-3] + "/" + name
        self.complete_poco_path = None
        self.gpd = GetPocoDic(game_name, phone_id)
        self.poco_dic = None
        self.phone_size_list = None
        self.sleep_time = None

    def set_phone_size(self):
        self.phone_size_list = self.gpd.get_phone_size()
        if self.phone_size_list['orientation'] == 0 or self.phone_size_list['orientation'] == 2:
            self.phone_size_list = [self.phone_size_list["width"], self.phone_size_list["height"]]  # 竖屏[x,y]
        else:
            self.phone_size_list = [self.phone_size_list["height"], self.phone_size_list["width"]]  # 横屏[x,y]

    # def set_poco(self, poco):
    #     self.poco = poco
    #     self.phone_size_list = self.poco.get_screen_size()
    #     # self.info.set_config("Phone_Size", self.thread_file_name, str(self.phone_size_list))
    #     self.renovate_and_get_poco_dic()

    # def renovate_and_get_poco_dic(self):  # 废弃
    #     """
    # 基础方法
    # 根据线程ID，刷新并读取对应本地的poco_dic,调用此方法前需要先调用set_poco()
    # 目前只适配poco—lua ，安卓、unity后续添加
    # :return: poco_dic
    # """

    # try:
    #     self.poco("未命名").exists()
    # except Exception:#后续可能需要优化，修改整体框架
    #     self.poco = StdPoco()
    #     self.poco("未命名").exists()
    # file_path = "D:\\poco_list_file\\" + self.thread_file_name + ".txt"
    # with open(file_path) as f:
    #     poco_name_dic_str_list = f.readlines()
    # self.poco_dic = eval(poco_name_dic_str_list[0])
    # print("本地poco数据刷新完成")
    # return self.poco_dic
    # time.sleep(1)
    # self.poco_dic = self.gpd.get_poco_dic()
    # return self.poco_dic

    def get_poco_dic(self):
        # file_path = "D:\\poco_list_file\\" + self.thread_file_name + ".txt"
        # with open(file_path) as f:
        #     poco_name_dic_str_list = f.readlines()
        # self.poco_dic = eval(poco_name_dic_str_list[0])
        # print("本地poco数据获取完成")
        # return self.poco_dic

        # g = GetPocoDic()# 新规则，还差指定手机名称
        # self.poco_dic = g.get_poco_dic()
        time.sleep(0.8)
        self.poco_dic = self.gpd.get_poco_dic()
        if self.poco_dic == {}:
            print("未获得任何节点信息")
        return self.poco_dic

    def get_poco_name_path_list(self):
        self.get_poco_dic()
        print("获取列表，刷新poco")
        poco_name_path_list = self.poco_dic.keys()
        return poco_name_path_list

    def is_this_text(self, poco_path, text, is_in=False):
        """
        判断节点的文字
        :param poco_path: 节点的绝对路径
        :param text: 需要判断的文字
        :return: bool
        """
        if self.poco_dic == None:
            # 点击之后会清空，需要刷一下最新的UI树
            self.get_poco_dic()
        if poco_path in self.poco_dic.keys():
            print("找到路径" + poco_path)
            this_text = self.poco_dic[poco_path]["text"]
            if is_in:
                if text in this_text:
                    return True
                else:
                    return False
            else:
                if this_text == text:
                    return True
                else:
                    return False
        for dic_key in self.poco_dic.keys():
            if poco_path in dic_key:
                print("找到路径" + dic_key)
                this_text = self.poco_dic[dic_key]["text"]
                if is_in:
                    if text in this_text:
                        return True
                    else:
                        return False
                else:
                    if this_text == text:
                        return True
                    else:
                        return False
        add_msg_in_log("对比text属性时，" + poco_path+"节点未找到",is_pass=False)
        return False

    def is_visible(self, poco_path):
        """
        判断节点能不能点击,一般用作点击之后的状态判断
        :param poco_path:
        :return:
        """
        if self.poco_dic == None:
            # 点击之后会清空，unexpected会直接调用该方法，所以需要刷一下最新的UI树
            self.get_poco_dic()
        if poco_path in self.poco_dic.keys():
            poco_path_pos = self.poco_dic[poco_path]["pos"]
            poco_path_Visible = self.poco_dic[poco_path]["getVisible"]
            if poco_path_pos[0] >= 1 or poco_path_pos[1] >= 1:
                print(poco_path + "-节点坐标在屏幕外，无法点击")
                return False
            elif not poco_path_Visible:
                print(poco_path + "-getVisible属性为False，无法点击")
                return False
            else:
                print(poco_path + "-节点坐标在屏幕内，getVisible属性为True，可以点击")
                return True
        # 看看某些唯一路径存不存在简写
        for dic_key in self.poco_dic.keys():
            if poco_path in dic_key:
                # 是简写路径的话就把完整路径传递出去
                poco_path_pos = self.poco_dic[dic_key]["pos"]
                poco_path_Visible = self.poco_dic[dic_key]["getVisible"]
                if poco_path_pos[0] >= 1 or poco_path_pos[1] >= 1:
                    print(dic_key + "-节点坐标在屏幕外，当做不存在")
                    return False
                elif not poco_path_Visible:
                    print(poco_path + "-getVisible属性为False，无法点击")
                    return False
                else:
                    print(poco_path + "-节点坐标在屏幕内，getVisible属性为True，可以点击")
                    return True
        return False

    def is_in_dic(self, poco_path, poco_dic_input=None):

        if poco_dic_input != None:
            self.poco_dic = poco_dic_input
        if self.poco_dic == None:
            # 点击之后会清空，unexpected会直接调用该方法，所以需要刷一下最新的UI树
            self.get_poco_dic()
        # self.get_poco_dic()
        if poco_path in self.poco_dic.keys():
            poco_path_pos = self.poco_dic[poco_path]["pos"]
            if poco_path_pos[0] >= 1 or poco_path_pos[1] >= 1:#todo 这里需要优化
                print(poco_path + "-节点坐标在屏幕外，当做不存在")
                self.complete_poco_path = poco_path
                return False
            else:
                print("找到路径" + poco_path)
                self.complete_poco_path = poco_path
                return True
        # 看看某些唯一路径存不存在简写
        for dic_key in self.poco_dic.keys():
            if poco_path in dic_key:
                # 是简写路径的话就把完整路径传递出去
                poco_path_pos = self.poco_dic[dic_key]["pos"]
                if poco_path_pos[0] >= 1 or poco_path_pos[1] >= 1:
                    print(dic_key + "-节点坐标在屏幕外，当做不存在")
                    self.complete_poco_path = dic_key
                    return False
                else:
                    print("找到路径" + dic_key)
                    self.complete_poco_path = dic_key
                    return True
        return False

    def get_poco_pos(self, poco_path, click_list=None):  # todo 闪退检测机制需要优化
        """
        基础方法
        识别手机分辨率，换算ui控件的坐标
        :param poco_path:
        :return:[x, y]
        """
        self.game_is_die()
        if self.phone_size_list == None:
            self.set_phone_size()
        if self.poco_dic == None:
            self.get_poco_dic()
        for i in range(5):
            if self.is_in_dic(poco_path):
                print("待点击路径：" + self.complete_poco_path)
                # 这里获取的是锚点坐标，当anchorPoint属性为[0,0]时，也是点击的左上角，需要做一个转换，直接点击中心点
                pos_list = self.poco_dic[self.complete_poco_path]['pos']
                pos_anchorPoint = self.poco_dic[self.complete_poco_path]['anchorPoint']
                pos_size = self.poco_dic[self.complete_poco_path]['size']
                # [宽,高]
                # phone_list_str = self.info.get_config("Phone_Size", self.thread_file_name)
                # phone_list = eval(phone_list_str)
                # 取整
                if pos_anchorPoint[0] == 0.5 and pos_anchorPoint[1] == 0.5:
                    pos_x = pos_list[0]
                    pos_y = pos_list[1]
                elif pos_anchorPoint[0] == 0 and pos_anchorPoint[1] == 0:
                    pos_x = pos_list[0] + pos_size[0] * 0.5
                    pos_y = pos_list[1] + pos_size[1] * 0.5
                elif pos_anchorPoint[0] == 1 and pos_anchorPoint[1] == 0.5:
                    pos_x = pos_list[0] - pos_size[0] * 0.5
                    pos_y = pos_list[1]
                elif pos_anchorPoint[0] == 0.5 and pos_anchorPoint[1] == 1:
                    pos_x = pos_list[0]
                    pos_y = pos_list[1] - pos_size[1] * 0.5
                elif pos_anchorPoint[0] == 1 and pos_anchorPoint[1] == 1:
                    pos_x = pos_list[0] - pos_size[0] * 0.5
                    pos_y = pos_list[1] - pos_size[1] * 0.5
                elif pos_anchorPoint[0] == 0 and pos_anchorPoint[1] == 0.5:
                    pos_x = pos_list[0] + pos_size[0] * 0.5
                    pos_y = pos_list[1]
                else:  # [0.5,0]
                    pos_x = pos_list[0]
                    pos_y = pos_list[1] + pos_size[1] * 0.5
                # 上面已经把pos_x和pos_y都换算到中心点的pos了
                # 正常是直接点击
                if click_list == None:
                    x = int(self.phone_size_list[0] * pos_x)
                    y = int(self.phone_size_list[1] * pos_y)
                else:  # 需要偏移量的话就点击这里
                    shifting_x = click_list[0] - 0.5
                    shifting_y = click_list[1] - 0.5
                    pos_x = pos_x + pos_size[0] * shifting_x
                    pos_y = pos_y + pos_size[1] * shifting_y
                    x = int(self.phone_size_list[0] * pos_x)
                    y = int(self.phone_size_list[1] * pos_y)
                print(poco_path + "pos属性为：" + str(pos_list) + "坐标为：" + str([x, y]))
                return [x, y]
            else:
                time.sleep(3)
                print("第" + str(i + 1) + "次未找到，再次查找" + poco_path)
                if i >= 4:
                    # 排除了游戏被切到后台导致找不到的情况
                    # 切回游戏后，仍然还是找不到
                    snapshot(msg="poco节点未找到")
                    raise NoneException(self.phone_id + ":" + poco_path)
                if i >= 1:  # 第2次的时候判断一下
                    # 开始检测是否是游戏不在了
                    game_activity_str = self.gpd.get_device_adb_shell(
                        "shell dumpsys window | findstr mCurrentFocus")  # 判断是否是被切到了后台
                    if self.game_name in game_activity_str:  # 没有被切到后台
                        # 游戏还在，确实找不到
                        snapshot(msg="poco节点未找到")
                        raise NoneException(poco_path)
                    else:  # 切到了后台，或者疑似闪退
                        game_running_str = self.gpd.get_device_adb_shell("shell dumpsys activity processes")
                        if self.game_name in game_running_str:
                            snapshot(msg="游戏还在,疑似切到后台")  # 可能被切到了后台
                            # 重新切回到游戏
                            start_app(self.game_name)
                            time.sleep(3)
                            snapshot(msg="切回游戏完毕")
                            # 拉起后还有一次查找的机会
                        else:
                            snapshot(msg="游戏不在,疑似闪退")  # 可能闪退
                            time.sleep(2)
                            start_app(self.game_name)
                            time.sleep(5)
                            snapshot(msg="重启完毕")
                            # 游戏闪退就直接终止了
                            raise GameServerStopException("游戏闪退，终止脚本")
            self.get_poco_dic()

    def my_touch(self, poco_path, click_list=None):
        touch_int_list = self.get_poco_pos(poco_path, click_list)
        self.touch(touch_int_list)

    def touch_pos(self, pos_list_int, is_sleep=True):
        """
        点击方法
        :param pos_list_int: 控件坐标，控件的pos属性
        :return:
        """
        if self.phone_size_list == None:
            self.set_phone_size()
        if self.sleep_time == None:
            self.sleep_time = int(self.info.get_config("设置", "allphnoe_poco_sleep_time"))
        poco_path_pos = pos_list_int
        x = int(poco_path_pos[0] * self.phone_size_list[0])
        y = int(poco_path_pos[1] * self.phone_size_list[1])
        self.touch([x, y])
        if is_sleep:
            time.sleep(self.sleep_time)
        else:
            pass

    def swipe_pos(self, start_pos_list, end_pos_list, timein):
        """
        滑动方法
        :param start_pos_list: 滑动起始控件坐标
        :param end_pos_list: 滑动结束控件坐标
        :param duration_input: 滑动过程持续时间
        :return:
        """
        if self.phone_size_list == None:
            self.set_phone_size()
        if self.sleep_time == None:
            self.sleep_time = int(self.info.get_config("设置", "allphnoe_poco_sleep_time"))
        start_x = int(self.phone_size_list[0] * start_pos_list[0])
        start_y = int(self.phone_size_list[1] * start_pos_list[1])
        end_x = int(self.phone_size_list[0] * end_pos_list[0])
        end_y = int(self.phone_size_list[1] * end_pos_list[1])
        swipe([start_x, start_y], [end_x, end_y], duration=timein)
        sleep(self.sleep_time)
        self.poco_dic = None

    def touch(self, pos_list):
        """
        输入坐标，使用airtest框架的touch点击
        :param pos_list: [123,123]
        :return:
        """
        touch(pos_list)
        print("点击坐标" + str(pos_list) + "完成", )
        self.poco_dic = None



    def swipe(self, pos1 ,pos2,duration):
        """
        根据传入的坐标进行滑动，调用的airtest自带的滑动方法
        :param pos1: 开始
        :param pos2: 结束
        :param duration: 滑动持续时间
        :return:
        """
        swipe(pos1, pos2, duration=duration)

    # def touch_poco_obj(self, poco_path, click_list):  # todo 闪退检测机制需要优化
    #     self.game_is_die()
    #     if self.phone_size_list == None:
    #         self.set_phone_size()
    #     if self.poco_dic == None:
    #         self.get_poco_dic()
    #     for i in range(5):
    #         if self.is_in_dic(poco_path):
    #             shifting_x = click_list[0] - 0.5
    #             shifting_y = click_list[1] - 0.5
    #             poco_path_pos = self.poco_dic[self.complete_poco_path]['pos']
    #             poco_path_size = self.poco_dic[self.complete_poco_path]['size']
    #             posx = poco_path_pos[0] + poco_path_size[0] * shifting_x
    #             posy = poco_path_pos[1] + poco_path_size[1] * shifting_y
    #             phone_x = self.phone_size_list[0]
    #             phone_y = self.phone_size_list[1]
    #             x = int(posx * phone_x)
    #             y = int(posy * phone_y)
    #             self.touch([x, y])
    #             break
    #         else:
    #             time.sleep(3)
    #             print("第" + str(i + 1) + "次未找到，再次查找" + poco_path)
    #             if i >= 4:
    #                 # 排除了游戏被切到后台导致找不到的情况
    #                 # 切回游戏后，仍然还是找不到
    #                 snapshot(msg="poco节点未找到")
    #                 raise NoneException(poco_path)
    #             if i == 1:  # 第2次的时候判断一下
    #                 # 开始检测是否是游戏不在了
    #                 if self.game_is_die():
    #                     stop_app(self.game_name)
    #                     raise GameServerStopException("游戏闪退，终止脚本")
    #                 else:  # 游戏没死也没后台，确实找不到
    #                     raise NoneException(poco_path)
    #         self.get_poco_dic()

    def game_is_die(self):
        """
        :return:
        """
        game_activity_str = self.gpd.get_device_adb_shell(
            "shell dumpsys window | findstr mCurrentFocus")  # 判断是否是被切到了后台
        if self.game_name in game_activity_str:  # 没有被切到后台
            # 游戏还在，确实找不到
            # snapshot(msg="游戏还在")
            return False
        else:  # 切到了后台，或者疑似闪退
            game_running_str = self.gpd.get_device_adb_shell("shell dumpsys activity processes")
            if self.game_name in game_running_str:
                snapshot(msg="游戏还在,疑似切到后台")  # 可能被切到了后台
                # 重新切回到游戏
                start_app(self.game_name)
                time.sleep(3)
                snapshot(msg="切回游戏完毕")
                return False
                # 拉起后还有一次查找的机会
            else:
                snapshot(msg="游戏不在,疑似闪退")  # 可能闪退
                time.sleep(2)
                start_app(self.game_name)
                time.sleep(5)
                snapshot(msg="重启完毕")
                # 游戏闪退就直接终止了
                return True

    def my_swipe(self, start_path, end_path, duration=2):
        start = self.get_poco_pos(start_path)
        end = self.get_poco_pos(end_path)
        swipe(start, end, duration=duration)
        print(str(start) + "滑动至" + str(end) + "完成")
        self.poco_dic = None
        return start, end

    # def get_poco_visible(self, poco_path):
    #     """
    #     获取游戏visible属性中的str值
    #     :param poco_path:poco路径
    #     :return:True/False
    #     """
    #     if self.is_in_dic(poco_path):
    #         visible_value_bool = self.poco_dic[self.complete_poco_path]["getVisible"]
    #         return visible_value_bool
    #     else:
    #         snapshot(msg="未找到节点")
    #         raise NoneException

    # def get_poco_text(self, poco_path):
    #     """
    #     获取游戏visible属性中的str值
    #     :param poco_path:poco对象
    #     :return:True/False
    #     """
    #     if self.is_in_dic(poco_path):
    #         visible_value_bool = self.poco_dic[self.complete_poco_path]["text"]
    #         return visible_value_bool
    #     else:
    #         snapshot(msg="未找到节点")
    #         raise NoneException

    def get_poco_any_value(self, poco_path, value_name_str):
        """
        获取游戏poco对象value_name_str属性中的值
        :param poco_path:poco_path
        :param value_name_str:属性的key
        :return: str value
        """
        self.get_poco_dic()
        self.is_in_dic(poco_path)
        if self.complete_poco_path in self.poco_dic.keys():
            visible_value_bool = self.poco_dic[self.complete_poco_path][value_name_str]
            if visible_value_bool == "":
                snapshot(msg=poco_path + "没有" + value_name_str + "属性")
                raise NoneStrException
            return visible_value_bool
        else:
            snapshot(msg=poco_path + "未找到节点")
            raise NoneException

    def get_game_number_instr(self, poco_path):
        """
        只获取poco对象中text属性中的数字
        :param poco_path:
        :return:
        """
        number_str = self.get_poco_any_value(poco_path, "text")
        number = filter(str.isdigit, number_str)
        return int(number.__next__())

    # def get_log_path(self, file_name):
    #     """
    #     将脚本的__file__属性传入，获取脚本的log存放路径
    #     :param file_name: __file__
    #     :param name:文件名称
    #     :return: log存放路径
    #     """
    #     self.input_file_name = file_name
    #     path, name = script_dir_name(file_name)
    #     self.log_path = path + "/" + name[:-3] + ".air/log"
    #     self.file_name = name[:-3]
    #     return self.log_path, self.file_name
    #
    # def end_log(self):
    #     """
    #     生成测试报告，目前限测试使用,todo  后续考虑使用线程号区分
    #     :param file_name: __file__
    #     :return:
    #     """
    #     outputname = self.file_name + "_log.html"
    #     simple_report(self.input_file_name, logpath=self.log_path, output=outputname)
