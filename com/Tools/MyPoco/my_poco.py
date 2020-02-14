# _*_coding:utf-8 _*_
#!/usr/bin/python3
#Reference:********************************
# encoding: utf-8
#@Time: 2020/1/9  17:06
#@Author: 洞洞
#@File: my_poco.py
#@Function:
#@Method:作为主要类，所有方法集中在这里供脚本调用
#Reference:********************************
from airtest.core.api import *
from my_poco_object import MyPocoObject
from decorator import err_close_game
from information import Information
from entry_game import EntryGame
from first_function_go_run import FirstFunctionGoRun
class MyPoco:
    def __init__(self,game_name):
        self.info = Information()
        self.my_poco_obj = MyPocoObject()
        self.game_name = self.info.get_config("App_Name", game_name)

    # todo err_close_game
    def first_function_go_run(self):
        """
        用来跳过一些功能初次进入的引导动画
        :return:
        """
        ffgr = FirstFunctionGoRun(self.game_name)
        ffgr.first_function_go_run()

    # @err_close_game
    def open_game(self, sever_name_input, game_account_input):
        """
        功能向,启动游戏并到游戏主界面
        :param sever_name_input: 区服,读配置或新建账号
        :param game_account_input: 账号,读配置或新建账号
        :return:返回StdPoco().poco对象，可直接用于脚本的控件点击
        """
        entry = EntryGame(self.game_name)
        poco =entry.entry_game(sever_name_input, game_account_input)
        self.my_poco_obj.new_poco_obj(self.game_name)
        # todo 登录游戏的具体实现
        return poco

    def close_game(self):
        """
        关闭游戏，不区分功能或者性能
        :return:
        """
        self.my_poco_obj.close_game(self.game_name)

    def test_touch(self,poco_path):
        self.my_poco_obj.new_poco_obj(self.game_name)
        self.my_touch(poco_path)

    # @err_close_game
    def my_swipe(self, start_path, end_path, timein):
        """
        两个对象中心点之间的滑动
        :param start_path:开始路径
        :param end_path:结束路径
        :param timein:不传的话默认2秒
        :return:两个对象的坐标
        """
        return self.my_poco_obj.my_swipe(start_path, end_path, timein)

    # @err_close_game
    def my_touch(self, poco_path):
        """
        :param poco_path:控件路径
        :return:Exception
        """
        self.my_poco_obj.touch_poco(poco_path)
    # todo 报错刷新
    # @err_close_game
    def touch_poco_obj(self, find_poco,click_list):
        """

        :param find_poco:poco对象
        :param click_list:控件点击偏移点[0,0]-[1,1]范围
        :raise:PocoNoSuchNodeException
        """
        self.my_poco_obj.touch_poco_obj(find_poco,click_list)


    def get_config(self, list_name, key):
        """
        获取配置文件信息
        :param list_name:模块名
        :param key:键
        :return:value
        """
        return self.info.get_config(list_name, key)


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
        return self.info.get_time_str(str_time_input)
    def get_game_number_l(self, poco_path, subscript):
        """
        不同游戏不同实现，获取游戏text属性中的数字 one/two
        :param poco_path:poco对象
        :param subscript:0/1
        :return:int
        """
        return self.my_poco_obj.get_game_number_l(poco_path, subscript)
    def get_game_number_c(self, poco_path):
        """
        不同游戏不同实现，获取游戏text属性中的数字 ]int[
        :param find_number_poco:poco对象
        :return:int
        """
        return self.my_poco_obj.get_game_number_c(poco_path)
    def get_game_number_cc(self, poco_path):
        """
        不同游戏不同实现，获取游戏text属性中的str数字,]int)
        :param find_number_poco:poco对象
        :return:int
        """
        return self.my_poco_obj.get_game_number_cc(poco_path)
    def get_game_number(self, poco_path):
        """
        获取游戏poco_path-text属性中的str数字
        :param poco_path:poco对象
        :return:int
        """
        return self.my_poco_obj.get_game_number(poco_path)
    def get_game_number_instr(self, poco_path):
        """
        只获取poco对象中text属性中的数字
        :param poco_path:poco路径
        :return:int
        """
        return self.my_poco_obj.get_game_number_instr(poco_path)

    def get_poco_visible(self, poco_path):
        """
        获取游戏visible属性中的值
        :param poco_path:poco路径
        :return:True/False
        """
        return self.my_poco_obj.get_poco_visible(poco_path)



    def get_poco_any_value(self, find_poco_path, value_name_str):
        """
        获取游戏poco对象value_name_str属性中的值，需要自行判断类型
        :param find_poco_path:poco对象的路径
        :return:value
        """
        return self.my_poco_obj.get_poco_any_value(find_poco_path, value_name_str)

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


    def add_log(self, first, second, msg):
        """
        对比结果值，并在报告连接中添加日志信息，比如资源变化前后的对比
        :param first:对比值one
        :param second:对比值two
        :param msg:日志的描述，==/！=、正常/异常
        :return:
        """
        self.my_poco_obj.add_log(first, second, msg)

    def first_open_yztest(self):
        """
        启动性能工具，在开始测试步骤前结束
        :return:
        """


    def start_test_xn(self, sever_name_input="sever_name", game_account_input="new_game_account"):
        """
        性能，点击开始测试按钮，启动游戏并在游戏界面停止
        :return:poco对象
        """


    def touch_tab_xn(self):
        """
        点击标记按钮
        :return:
        """


    def end_tab_xn(self):
        """
        结束测试并上传报告，在开始测试界面结束
        :return:
        """


    def close_test_xn(self):
        """
        停止性能测试，关闭性能软件和游戏
        :return:
        """


    def text_str(self, input_str):
        """
        输入文本，没有回车键
        :param input_str:需要输入的文本
        :return:
        """
        self.my_poco_obj.text_str(input_str)
    @err_close_game
    def new_account(self, dic_input, sever_name_input):
        """
        根据输入的要求在sever_name区创建一个账号
        :param dic_input: 字典，需要添加的各种资源
        :param sever_name_input: 区服名和配置一致
        :return:
        """


    def is_exist_poco_log(self, poco_path, is_exist_str):
        """
        判断传入的控件是否处于显示状态,在报告中体现，用来验证按钮点击后的状态
        :param poco_path: 控件路径
        :param is_exist_str:"显示"or"隐藏"
        :return: bool  True or False
        """
        return self.my_poco_obj.is_exist_poco_log(poco_path, is_exist_str)

    def is_exist_poco(self, poco_path):
        """
        判断传入的控件是否处于显示状态 ，用来判断按钮是否可以点击
        :param poco_path: 控件路径
        :return: True/False
        """
        return self.my_poco_obj.is_exist_poco(poco_path)

    def add_resource(self, dic_input):
        """
        添加各种资源，协议向
        :param name:资源名称
        :param size:资源数量
        :return:
        """
    def delete_resource(self, dic_input):
        """
        删除各种资源，协议向
        :param name:资源名称
        :param size:资源数量
        :return:
        """
    def get_resource_quantity(self, list_input):
        """
        获取某资源数量，协议向
        :return:字典，资源名称和数量
        """
    def get_sever_time(self):
        """
        获取当前服务器时间，协议向
        :return:int [年月日，时分秒，星期]
        """
    def get_log_path(self, file_name):
        """
        将脚本的__file__属性传入，获取脚本的log存放路径
        :param file_name: __file__
        :return: log存放路径
        """
        return self.my_poco_obj.get_log_path(file_name)

    def end_log(self, file_name, log_path,outputname):
        """
        生成测试报告，目前限测试使用
        :param file_name: __file__
        :param log_path: log存放路径，通过get_log_path获得
        :return:
        """
        self.my_poco_obj.end_log(file_name,log_path,outputname)