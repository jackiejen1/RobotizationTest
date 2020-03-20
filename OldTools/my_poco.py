# _*_coding:utf-8 _*_
# !/usr/bin/python3
# Reference:********************************
# encoding: utf-8
# @Time: 2019/11/6  16:06
# @Author: 洞洞
# @File: MyPoco.py
# @Function:
# @Method:
# Reference:********************************

from airtest.core.api import *
from poco.drivers.std import StdPoco
from poco.exceptions import PocoNoSuchNodeException
from poco.utils.simplerpc.simplerpc import RpcTimeoutError

using("Tools")
from get_info.information import Information
from new_poco.my_poco_object import MyPocoObject
from yztest.yztest2_performance import YzTest2Performance
from game_support.resource_gm import ResourceGm
from game_support.new_account import NewAccount
from game_support.entry_game import EntryGame
from game_support.fight import Fight
from game_support.protocol import Protocol
from game_support.first_function_go_run import FirstFunctionGoRun
from private_run.my_run_case import MyRunCase

# from Tools.game_support.first_function_go_run import FirstFunctionGoRun
# from Tools.get_info.information import Information
# from Tools.poco.my_poco_object import MyPocoObject
# from Tools.yztest.yztest2_performance import YzTest2Performance
# from Tools.game_support.resource_gm import ResourceGm
# from Tools.game_support.new_account import NewAccount
# from Tools.game_support.entry_game import EntryGame
# from Tools.game_support.fight import Fight
# from Tools.game_support.protocol import Protocol
# from Tools.private_run.my_run_case import MyRunCase


class MyPoco:
    def __init__(self):
        """
        初始化点击类、信息类、性能类
        """
        self.my_poco = MyPocoObject()
        self.info = Information()
        self.xn = YzTest2Performance()
        self.eg = EntryGame()
        self.fg = Fight()
        self.rg = ResourceGm()
        self.na = NewAccount()
        self.sp = Protocol()
        self.mrc = MyRunCase()

    # todo 装饰器
    def first_function_go_run(self):
        """
        用来跳过一些功能初次进入的引导动画
        :return:
        """
        ffgr = FirstFunctionGoRun()
        ffgr.first_function_go_run()

    def open_game(self, sever_name_input="sever_name", game_account_input="old_game_account"):
        """
        功能向,开始游戏，启动到游戏主界面,广告和签到界面关闭
        :return:返回StdPoco().poco对象，可直接用于脚本的控件点击
        """
        try:
            self.poco = self.eg.open_game(sever_name_input, game_account_input)
            self.set_poco(self.poco)
            return self.poco
        # 如果出现断开连接的报错，就再执行一下该步骤
        except RpcTimeoutError:
            pristr = "poco断开" + str(self.info.game_is_running())
            if not self.info.game_is_running():
                game_name = self.info.get_config("App_Name", "game_name")
                start_app(game_name)
                sleep(2)
                snapshot(msg=pristr)
            snapshot(msg=pristr)
            self.poco = self.eg.open_game(sever_name_input, game_account_input)
            self.set_poco(self.poco)
        except PocoNoSuchNodeException:
            snapshot(msg="找不到控件")
            raise PocoNoSuchNodeException(self)
        except Exception:
            pristr = "报错，游戏" + str(self.info.game_is_running())
            snapshot(msg=pristr)
            raise Exception

    def close_game(self):
        """
        关闭游戏，不区分功能或者性能
        :return:
        """
        self.eg.close_game()

    def set_poco(self, poco_input):
        """

        :param poco_input:传入poco对象，主要用于不经过open_game（）情况的控件点击
        :return:
        """
        self.my_poco.set_poco(poco_input)

    def my_swipe(self, start_poco, end_poco, timein=2):
        """
        两个对象中心点之间的滑动
        :param start_poco:poco对象
        :param end_poco:poco对象
        :return:两个对象的坐标
        """
        try:
            pos_2, pos_3 = self.my_poco.my_swipe(start_poco, end_poco, timein)
            return pos_2, pos_3
        # 如果出现断开连接的报错，就再执行一下该步骤
        except RpcTimeoutError:
            pristr = "poco点击断开" + str(self.info.game_is_running())
            if not self.info.game_is_running():
                game_name = self.info.get_config("App_Name", "game_name")
                start_app(game_name)
                sleep(2)
                snapshot(msg=pristr)
            snapshot(msg=pristr)
            pos_2, pos_3 = self.my_poco.my_swipe(start_poco, end_poco, timein)
            return pos_2, pos_3
        except PocoNoSuchNodeException:
            snapshot(msg="找不到控件")
            raise PocoNoSuchNodeException(self)
        except Exception:
            pristr = "点击方法报错，游戏" + str(self.info.game_is_running())
            snapshot(msg=pristr)
            raise Exception


    def find_poco(self, find_name, find_type="text", click_name=None, ynlist="不翻", direction="竖屏", click_type=None,
                  click_list=None):
        """
        查找控件并点击，默认三次内找不到报错，间隔5秒
        :param find_name:查找的控件名
        :param find_type:查找的控件类型 text、name....
        :param click_name:点击的控件名，默认none，表示查找和点击的控件是一个点
        :param click_type:点击的控件类型text、name....
        :param ynlist:是否翻页查找，默认x：1/2 ，y1/5-4/5范围，建议使用my_swipe方法
        :param direction:和翻页相关，横屏还是竖屏范围翻页
        :param click_list:控件点击偏移点[0,0]-[1,1]范围
        :return:PocoNoSuchNodeException
        """
        try:
            self.my_poco.find_poco(find_name, find_type=find_type, click_name=click_name, ynlist=ynlist,
                                   direction=direction, click_type=click_type,
                                   click_list=click_list)
        # 如果出现断开连接的报错，就再执行一下该步骤
        except RpcTimeoutError:
            pristr = "poco点击断开" + str(self.info.game_is_running())
            if not self.info.game_is_running():
                game_name = self.info.get_config("App_Name", "game_name")
                start_app(game_name)
                sleep(2)
                snapshot(msg=pristr)
            snapshot(msg=pristr)
            self.poco = StdPoco()  # todo 需要根据游戏不同区分
            self.set_poco(self.poco)
            self.my_poco.find_poco(find_name, find_type=find_type, click_name=click_name, ynlist=ynlist,
                                   direction=direction, click_type=click_type,
                                   click_list=click_list)
        except PocoNoSuchNodeException:
            snapshot(msg="找不到控件")
            raise PocoNoSuchNodeException(self)
        except Exception:
            pristr = "点击方法报错，游戏" + str(self.info.game_is_running())
            snapshot(msg=pristr)
            raise Exception

    def fight(self, sections_name, find_type1="text", click_name1=None, ynlist="不翻", click_type1=None,
              number_of_times=1, find_level=None):
        """
        少三2循环战斗
        :param sections_name:要进入的关卡的名称
        :param find_type1:查找的控件类型 text、name....
        :param click_name1:点击的控件名，默认none，表示查找和点击的控件是一个点
        :param click_type1:点击的控件类型text、name....
        :param ynlist1:是否翻页查找，默认x：1/2 ，y1/5-4/5范围，建议使用my_swipe方法
        :param number_of_times:循环战斗几次
        :param find_level:到几级之后不再打了
        :return:
        """
        self.fg.to_fight(sections_name, find_type1=find_type1, click_name1=click_name1, ynlist1=ynlist,
                         click_type1=click_type1,
                         number_of_times=number_of_times, find_level=find_level)

    def add_resource(self, dic_input):
        """
        添加各种资源
        :param name:资源名称
        :param size:资源数量
        :return:
        """
        self.rg.add_resource(dic_input)

    def set_play_fuben_num(self, num):
        self.rg.set_play_fuben_num(num)
    def set_play_liezhuan_num(self, num):
        self.rg.set_play_liezhuan_num(num)
    def delete_resource(self, dic_input):
        """
        添加各种资源
        :param name:资源名称
        :param size:资源数量
        :return:
        """
        self.rg.delete_resource(dic_input)

    def get_resource_quantity(self, list_input):
        """
        获取某资源数量
        :return:字典，资源名称和数量
        """
        dic_res = self.rg.get_resource_num(list_input)
        return dic_res

    def get_sever_time(self):
        """
        输入包含时间戳的poco对象，获取当前服务器时间
        :param input_str:需要输入的文本
        :return:int [年月日，时分秒，星期]
        """
        return self.rg.get_sever_time()

    def get_config(self, list_name, key):
        """
        获取配置文件信息
        :param list_name:模块名
        :param key:键
        :return:value
        """
        value = self.info.get_config(list_name, key)
        return value

    def add_section(self, section_name):
        '''
        在配置文件中添加项
        :param section_name:项名称
        :return:
        '''
        self.info.add_section(section_name)

    def remove_section(self, section_name):
        '''
        删除配置文件中的项
        :param section_name:项名称
        :return:
        '''
        self.info.remove_section(section_name)

    def set_config(self, list_name, key, value):
        """
        设置配置文件信息
        :param list_name:模块名
        :param key:键
        :param value:值
        :return:
        """
        self.info.set_config(list_name, key, value)

    def get_time_str(self, str_time_input):
        """
        根据时间戳字符串换算日期和星期
        :param poco_time_input:包含时间戳text的poco对象
        :return: [int(ymd),int(hms),int(week)]
        """
        int_list = self.info.get_time_str(str_time_input)
        return int_list

    def get_game_number_l(self, find_number_poco, subscript):
        """
        不同游戏不同实现，获取游戏text属性中的数字 one/two
        :param find_number_poco:poco对象
        :param subscript:0/1
        :return:int
        """
        return self.info.get_game_number_l(find_number_poco, subscript)

    def get_game_number_c(self, find_number_poco):
        """
        不同游戏不同实现，获取游戏text属性中的数字 ]int[
        :param find_number_poco:poco对象
        :return:int
        """
        return self.info.get_game_number_c(find_number_poco)

    def get_game_number_cc(self, find_number_poco):
        """
        不同游戏不同实现，获取游戏text属性中的str数字,]int)
        :param find_number_poco:poco对象
        :return:int
        """
        return self.info.get_game_number_cc(find_number_poco)

    def get_game_number(self, find_number_poco):
        """
        获取游戏text属性中的str数字
        :param find_number_poco:poco对象
        :return:int
        """
        return self.info.get_game_number(find_number_poco)

    def get_game_number_instr(self, find_number_poco):
        """
        只获取poco对象中text属性中的数字
        :param find_number_poco:poco对象
        :return:int
        """
        return self.info.get_game_number_instr(find_number_poco)

    def get_poco_visible(self, find_visible_poco):
        """
        不同游戏不同实现，获取游戏visible属性中的str值
        :param find_visible_poco:poco对象
        :return:str true/false
        """

        return self.info.get_poco_visible(find_visible_poco)

    def get_poco_anyvalue(self, find_name_poco, value_name_str):
        """
        获取游戏poco对象value_name_str属性中的值，需要自行判断类型
        :param find_number_poco:poco对象
        :return:value
        """

        return self.info.get_poco_anyvalue(find_name_poco, value_name_str)

    def get_poco_pos(self, find_pos_poco):
        """
        获取poco对象的坐标，经过分辨率转换
        :param find_pos_poco:poco对象
        :return:[,]
        """
        return self.my_poco.get_poco_pos(find_pos_poco)

    def get_phone_name(self):
        """
        获取当前手机的名字，区分三挡机使用
        :return:str
        """
        return self.info.get_phone_name()

    def get_phone_size(self):
        """
        获取当前手机的分辨率
        :return:list_int[宽，高]
        """
        return self.info.get_phone_size()

    def add_log(self, first, second, msg=""):
        """
        对比结果值，并在报告连接中添加日志信息，比如资源变化前后的对比
        :param first:对比值one
        :param second:对比值two
        :param msg:日志的描述，==/！=、正常/异常
        :return:
        """
        self.info.add_log(first, second, msg=msg)

    def first_open_yztest(self):
        """
        启动性能工具，在开始测试步骤前结束
        :return:
        """
        self.xn.first_open_yztest()

    def start_test_xn(self, sever_name_input="sever_name", game_account_input="new_game_account"):
        """
        性能，点击开始测试按钮，启动游戏并在游戏界面停止
        :return:poco对象
        """
        self.poco = self.xn.start_test(sever_name_input, game_account_input)
        self.set_poco(self.poco)
        return self.poco

    def touch_tab_xn(self):
        """
        点击标记按钮
        :return:
        """
        self.xn.touch_tab()

    def end_tab_xn(self):
        """
        结束测试并上传报告，在开始测试界面结束
        :return:
        """
        self.xn.end_tab()

    def close_test_xn(self):
        """
        停止性能测试，关闭性能软件和游戏
        :return:
        """
        self.xn.close_test()

    def text(self, input_str):  # 废弃
        """
        输入文本，没有回车键
        :param input_str:需要输入的文本
        :return:
        """
        self.info.text_str(input_str)

    def text_str(self, input_str):
        """
        输入文本，没有回车键，接受汉字
        :param input_str:需要输入的文本
        :return:
        """
        self.info.text_str(input_str)

    def new_account(self,  resource_dic_input, sever_name_input,play_dic):
        """
        根据输入的要求在sever_name区创建一个账号
        :param dic_input: 字典，需要添加的各种资源
        :param sever_name_input: 区服名
        :param play_dic: 副本列表dic{"副本":80,"列传":12}
        :return:
        """
        self.na.new_game_account(resource_dic_input, sever_name_input,play_dic)

    def send_game_protocol(self, send_protocol_dic, find_name):
        """
        发送后会回到当前界面，只发一条，
        :param add_name_input_list: dic {"message":协议id,"ages":,...}
        :param find_name:协议返回值中需要查询值的key，可以为none
        :return:value
        """
        find_name_value = self.rg.send_game_protocol(send_protocol_dic, find_name)
        return find_name_value

    def test_game_protocol(self, add_name_input_list):
        """
        发送后会回到当前界面，只发一条，发完自行查看结果,用于协议测试
        :param add_name_input_list: list [协议用例id，arges....]
        :return:
        """
        self.rg.test_game_protocol(add_name_input_list)

    def is_exist_poco_log(self, poco_obj, is_exist_str):
        """
        判断传入的控件是否处于显示状态,在报告中体现，用来验证按钮点击后的状态
        :param poco_obj: 需要验证的控件对象
        :param is_exist_str:"显示"or"隐藏"
        :return: bool  True or False
        """
        is_exist = self.info.is_exist_poco_log(poco_obj, is_exist_str)
        return is_exist
    def is_exist_poco(self, poco_obj):
        """
        判断传入的控件是否处于显示状态,在报告中体现，用来验证按钮点击后的状态
        :param poco_obj: 需要验证的控件对象

        :return: bool  True or False
        """
        is_exist = self.info.is_exist_poco(poco_obj)
        return is_exist

    def my_run_case(self, yml_cases_name_list):
        '''
        传入需要执行case.yml中用例的项名的列表
        :param yml_cases_name_list: ["debug","debug1"]
        :return:
        '''
        self.mrc.make_config_list()
        self.mrc.thread_run_case(yml_cases_name_list)
