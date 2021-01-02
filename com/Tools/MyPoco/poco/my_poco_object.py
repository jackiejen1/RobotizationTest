# _*_coding:utf-8 _*_
# !/usr/bin/python3
# Reference:********************************
# encoding: utf-8
# @Time: 2019/10/9  10:38
# @Author: 洞洞
# @File: my_poco_object.py
# @Function:脚本基础类，用于实现各个辅助脚本的类，比如登录游戏，启动游戏后必须先调用new_poco_obj（）
# @Method:
# Reference:********************************
import datetime

from airtest.core.api import *

import re, time
from MyPoco.foundation.MyException import *
from MyPoco.airtestide_lack_packages.poco.utils.simplerpc.simplerpc import RpcTimeoutError
from MyPoco.foundation.make_poco_dic import MakePocoDic
from MyPoco.foundation.information import Information
from MyPoco.game_support.unexpected_win import UnexpectedWin


class MyPocoObject():

    def __init__(self, game_name, phone_id):
        """
        创建依赖对象，保存全局信息
        """
        self.info = Information()
        self.game_name_key = game_name
        self.game_name = self.info.get_config(game_name, "app_name")
        self.phone_id = phone_id
        self.make_poco_dic = MakePocoDic(game_name, phone_id)
        self.uw = UnexpectedWin(game_name, phone_id)
        self.poco = None
        self.is_pass =0

    def get_poco_dic(self):
        """
        刷新并获取当前界面UI信息
        :return: ui dic
        """
        return self.make_poco_dic.get_poco_dic()

    def query_game_is_run(self, game_name):
        """
        查询游戏线程是否存在，主要用于开始测试前排除其他poco干扰
        :param game_name: 游戏Activities
        :return:
        """
        return self.make_poco_dic.query_game_is_run(game_name)

    def get_game_run_text(self):
        """
        查询游戏线程是否存在，主要用于开始测试前排除其他poco干扰
        :param game_name: 游戏Activities
        :return:
        """
        return self.make_poco_dic.get_game_run_text()

    def get_adb_info(self,adb_shell):
        """
        获得adb返回值
        :param adb_shell: adb命令
        :return:
        """
        game_running_str = self.make_poco_dic.get_adb_info(adb_shell)
        return game_running_str

    def my_swipe(self, start_path, end_path, timein=2):
        """
        传入两个坐标进行滑动
        :param start_path:开始点路径
        :param end_path:结束点路径
        :return:起、止点坐标
        """
        start, end = None, None
        self.uw.unexpected_win()
        try:
            start, end = self.make_poco_dic.my_swipe(start_path, end_path, duration=timein)
        except RpcTimeoutError:
            snapshot(msg="poco超时异常")
            start, end = self.make_poco_dic.my_swipe(start_path, end_path, duration=timein)
        except ConnectionAbortedError:
            start_app(self.game_name)
            time.sleep(4)
            snapshot(msg="10053异常")
        time.sleep(1)
        return start, end

    def is_this_text(self, poco_path, text, is_in=False):
        """
        判断节点的文字
        :param poco_path: 节点路径
        :param text: 需要判断的文字
        :return: bool
        """
        return self.make_poco_dic.is_this_text(poco_path, text, is_in=is_in)

    def touch(self, pos_list):
        """
        输入坐标，使用airtest框架的touch点击
        :param pos_list: [123,123]
        :return:
        """
        self.make_poco_dic.touch(pos_list)
    def swipe(self, pos1 ,pos2,duration):
        """
        根据传入的坐标进行滑动，调用的airtest自带的滑动方法
        :param pos1: 开始
        :param pos2: 结束
        :param duration: 滑动持续时间
        :return:
        """
        self.make_poco_dic.swipe(pos1, pos2, duration=duration)
    def swipe_pos(self, start_pos_list, end_pos_list, timein):
        """
        滑动方法
        :param start_pos_list: 滑动起始控件坐标
        :param end_pos_list: 滑动结束控件坐标
        :param duration_input: 滑动过程持续时间
        :return:
        """
        self.make_poco_dic.swipe_pos(start_pos_list, end_pos_list, timein=timein)

    def touch_pos(self, pos_list_int,is_sleep = True):
        """
        点击方法
        :param pos_list_int: 控件坐标，控件的pos属性
        :return:
        """
        self.make_poco_dic.touch_pos(pos_list_int,is_sleep = is_sleep)

    def touch_poco(self, poco_path, click_list=None):
        """
        需要查找的控件路径
        :param find_name:需要查找的控件路径
        :return:
        raise：PocoNoSuchNodeException、RpcTimeoutError
        """
        time.sleep(1)
        self.uw.unexpected_win()
        try:
            self.make_poco_dic.my_touch(poco_path, click_list=click_list)
# <<<<<<< .mine
#         except RpcTimeoutError:
# ||||||| .r21670
        except RpcTimeoutError:
            sys.exit(1)
# =======
#         except RpcTimeoutError as e:
# # >>>>>>> .r21826
#             snapshot(msg="poco超时异常")
# <<<<<<< .mine
#             self.make_poco_dic.my_touch(poco_path, click_list=click_list)
# ||||||| .r21670
#             self.make_poco_dic.my_touch(poco_path, click_list=click_list,func_text = func_text)
# =======
#             log(e, snapshot=True)
#             self.make_poco_dic.my_touch(poco_path, click_list=click_list,func_text = func_text)
# >>>>>>> .r21826
        except ConnectionAbortedError as e:
            start_app(self.game_name)
            log(e, snapshot=True)
            time.sleep(4)
            snapshot(msg="10053异常")

    def is_exist_poco_log(self, poco_path, is_exist_str):
        """
        判断传入的控件是否处于显示状态,在报告中体现，用来验证按钮点击后的状态
        :param poco_path: 需要验证的控件
        :param is_exist_str:控件应该是"显示"or"隐藏"
        :return: bool  True or False
        """
        bool = self.is_exist_poco(poco_path)
        if is_exist_str == "隐藏":
            miaoshu = "按钮" + poco_path + "隐藏"
            if bool:
                isbool = False
            else:
                isbool = True
        else:
            miaoshu = "按钮" + poco_path + "显示"
            if bool:
                isbool = True
            else:
                isbool = False
        self.add_msg_in_log(miaoshu, isbool)
        return bool

    def is_in_dic(self, poco_path, poco_dic_input=None):
        """
        判断节点是否在当前屏幕
        :param poco_path:
        :return:
        """
        return self.make_poco_dic.is_in_dic(poco_path, poco_dic_input=poco_dic_input)

    def is_visible(self, poco_path):
        """
        判断节点能不能点击,一般用作点击之后的状态判断
        :param poco_path:
        :return:
        """
        return self.make_poco_dic.is_visible(poco_path)

    def get_poco_position(self, poco_path):
        """
        获取节点的绝对坐标，经过手机分辨率换算
        :param poco_path: poco_name
        :return:
        """
        return self.make_poco_dic.get_poco_pos(poco_path)

    def is_exist_poco(self, poco_path):
        """
        先判断传入的对象是否存在
        判断传入的控件是否处于显示状态
        :param poco_obj: 需要验证的控件对象
        :return: bool  True or False
        """

        return self.make_poco_dic.is_in_dic(poco_path)

    def text_str(self, input_str):
        """
        输入文本，没有回车键，接受汉字
        :param input_str:需要输入的文本
        :return:
        """
        if self.phone_id != None and self.phone_id != "":
            os.system("adb -s " + self.phone_id + " shell input text " + input_str)
        else:
            os.system("adb shell input text " + input_str)
        self.add_msg_in_log("输入" + input_str, True)
        # text(input_str, enter=False)
        # keyevent("DEL")

    def add_msg_in_log(self, msg, is_pass):
        # name = "添加日志"
        # rizhi = {"name": name, "call_args": {"text": msg}}
        # G.LOGGER.log("function", rizhi, 1)
        add_msg_in_log(msg, is_pass=is_pass)
        if not is_pass:
            self.is_pass = self.is_pass+1


    def contrast_first_second(self, first, second, msg=""):
        """
        在报告中添加日志信息，对比两个值，判断是否通过
        :param first: int、str
        :param second: int、str
        :param msg: 描述
        :return:
        """

        if first == second:
            st = msg + "正常"
            add_msg_in_log(st + "," + str(first) + "," + str(second), is_pass=True)
        else:
            self.is_pass = self.is_pass + 1
            st = msg + "异常" + "," + str(first) + "," + str(second)
            add_msg_in_log(st, is_pass=False)
            snapshot()

    def get_game_number_l(self, poco_path, subscript):
        """
        获取poco对象中text属性中的数字
        :param poco_path:
        :param subscript: 0/1
        :return:
        """
        number_str = self.make_poco_dic.get_poco_any_value(poco_path, "text")
        number_list = number_str.split("/")
        number = number_list[subscript]
        return int(number)

    def get_game_text_l(self, poco_path, subscript):
        """
        获取poco对象中text属性中的文字
        :param poco_path:
        :param subscript: 0/1
        :return:
        """
        number_str = self.make_poco_dic.get_poco_any_value(poco_path, "text")
        number_list = number_str.split("/")
        number = number_list[subscript]
        return number

    def game_is_die(self):
        """
        查看游戏有没有闪退
        :return:
        """
        return self.make_poco_dic.game_is_die()

    def get_game_text(self, poco_path):
        """
        获取游戏poco_path-text属性中的str数字
        :param poco_path:poco对象
        :return:int
        """
        poco_path_str = self.make_poco_dic.get_poco_any_value(poco_path, "text")
        return poco_path_str

    def get_game_number(self, poco_path):
        """
        只获取poco对象中text属性中的数字
        :param poco_path:
        :return:
        """
        number_str = self.make_poco_dic.get_poco_any_value(poco_path, "text")
        try:
            number_int = int(number_str)
        except:
            log("数据类型转换异常", snapshot=True)
            raise NoneException("数据类型转换异常")
        return number_int

    def get_game_number_instr(self, poco_path):
        """
        只获取poco对象中text属性文字中包含的数字
        :param poco_path:
        :return:
        """
        number_str = self.make_poco_dic.get_poco_any_value(poco_path, "text")
        # number = filter(str.isdigit, number_str)
        number = re.findall(r'\d+', number_str)
        # return int(number.__next__())
        return int(number[0])

    def get_game_number_c(self, poco_path):
        """
        获取poco对象中text属性中的数字
        :param poco_path: ]int[
        :return:
        """
        number_str = self.make_poco_dic.get_poco_any_value(poco_path, "text")
        number_list = re.findall("\](.*)\[", number_str)
        return int(number_list[0])

    def get_game_number_cc(self, poco_path):
        """
        获取poco对象中text属性中的数字
        :param poco_path: ]int）[
        ps:右括号全/半角区别 ）)
        :return:
        """
        number_str = self.make_poco_dic.get_poco_any_value(poco_path, "text")
        number_str1 = number_str[-20:]
        number_list = re.findall("\](.*)\）", number_str1)
        return int(number_list[0])

    def close_all_app(self):
        """
        解锁屏幕
        关闭当前界面运行的软件
        :return:
        """
        phone_adb_info = self.get_adb_info("shell dumpsys window | findstr mCurrentFocus")#通过adb获取当前界面活动app
        if "StatusBar" in phone_adb_info:
            os.system("adb shell input keyevent 26")
            time.sleep(2)
            os.system("adb shell input keyevent 82")
            time.sleep(2)
        if "AppActivity" in phone_adb_info:
            new_game_name = re.search("u0 .*/",phone_adb_info).group()[3:-1]
            stop_app(new_game_name)
            time.sleep(2)

    def close_game(self):
        """
        关闭游戏
        需要加入特定标识确认已经退到主界面
        """
        snapshot(msg="关闭游戏")
        #从配置表中读取主界面唯一元素
        close_game_poco_name = self.info.get_config(self.game_name_key, "close_game_poco_name")
        is_home = self.is_in_dic(close_game_poco_name)
        stop_app(self.game_name)
        if close_game_poco_name == None:
            if self.is_pass > 0:
                raise GameNotPassException("数值判定部分未通过")
        else:
            if is_home:
                if self.is_pass>0:
                    raise GameNotPassException("数值判定部分未通过")
            else:
                if self.is_pass > 0:
                    err_str = "数值判定部分未通过,最后一步异常,"
                else:
                    err_str = "最后一步异常,"
                raise NoneException(err_str+close_game_poco_name)

    def get_poco_any_value(self, poco_path, value_name_str):
        """
        获取游戏poco对象value_name_str属性中的值
        :param poco_path:poco_path
        :param value_name_str:属性的key
        :return: str value
        """
        return self.make_poco_dic.get_poco_any_value(poco_path, value_name_str)

    def make_random_account(self):
        """
        根据时间戳生成一个8位的纯数字字符串，可用于生成账号
        :return: str 8位数字
        """
        game_account_f = time.time()
        dateArray = datetime.datetime.fromtimestamp(game_account_f)
        hms = dateArray.strftime("%Y%m%d")
        game_account_int = int(game_account_f * 1000000)
        game_account = hms[-1:] + str(game_account_int)[-7:]
        return game_account
