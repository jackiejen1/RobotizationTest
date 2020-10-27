# _*_coding:utf-8 _*_
# !/usr/bin/python3
# Reference:********************************
# encoding: utf-8
# @Time: 2020/1/9  17:06
# @Author: 洞洞
# @File: my_poco.py
# @Function:
# @Method:作为编写脚本时使用的类，所有方法集中在这里供脚本调用
#         辅助脚本使用MyPocoObject类编写
# Reference:********************************
import os
import random

from MyPoco.foundation.MyException import *
from MyPoco.foundation.information import Information
from MyPoco.game_support.entry_game import EntryGame
from MyPoco.game_support.resource_gm import ResourceGm
from MyPoco.poco.xn_test_tools import XnTest
from MyPoco.protocol.gm_method import GmMethod
from MyPoco.poco.my_poco_object import MyPocoObject, time
from MyPoco.protocol.protocol_function import ProtocolFunction  # 暂时不接入协议
from airtest.core.api import stop_app
from MyPoco.foundation.tools import *


class MyPoco:
    def __init__(self, game_name, phone_id, ui_path=None):
        """
        :param game_name: 游戏名字，见ini文件App_Name项
        :param phone_id: 设备号，如果为None，表示不链接设备
        """
        self.ui_path = ui_path
        self.info = Information()
        self.game_name_key = game_name
        self.game_name = self.info.get_config(game_name, "app_name")
        self.my_poco_obj = MyPocoObject(game_name, phone_id)
        self.gm = GmMethod(game_name, self.ui_path)
        self.rg = ResourceGm(game_name, phone_id)
        # self.newaccount = NewAccount(game_name, phone_id)
        self.phone_id = phone_id
        self.xt = None

    def make_new_role(self, server_name, username="", protocol_name="", is_new_account_into=False):
        """
        登录或创建角色协议，协议和GM的init方法
        如果是新账号就创角并登录，并二次记录记录uid
        老账号就直接登录
        :param server_name: 服务器名
        :param username: 账号
        :param protocol_name: 协议名
        :return:时间戳
        """
        self.protocol = None
        self.GM_server_name = server_name
        if username == "":
            username = self.get_random_account()
        self.protocol = ProtocolFunction(self.game_name_key, server_name, protocol_name, username,
                                         is_new_account=is_new_account_into, ui_path=self.ui_path)
        return self.protocol.sever_time

    def set_account_information_gm(self, account, server_name, role_id="", role=""):
        """
        使用GM方法前需要调用该方法,来确定对哪个账号的哪个区下面的角色进行操作
        :param account:str  账号
        :param server_name:str
        :param role_id: int 如果不传，则通过api获取
        :return:role_id
        """
        if role_id != "":
            return self.gm.set_account_information(account, server_name_input=server_name, role_id=role_id, role=role)
        else:
            if self.game_name_key == "少三2" or self.game_name_key == "少三2越南"or self.game_name_key == "少三2台湾" or self.game_name_key == "少三2日本" or self.game_name_key == "少三2韩国" or self.game_name_key == "少三2新马":
                role_id, sever_time = self.protocol.get_role_id()
                return self.gm.set_account_information(account, server_name_input=server_name, role_id=role_id,
                                                       role=role)
            else:
                return self.gm.set_account_information(account, server_name_input=server_name, role_id=role_id,
                                                       role=role)

    def get_resource_pb(self, find_name):
        """
        获取资源数量
        :param find_name:
        :return:
        """
        return self.protocol.get_resource_pb(find_name)

    def del_all_resource_pb(self):
        """
        删除账号上的碎片、道具、资源、装备、宝物、进阶装备、名将传道具
        :return:
        """
        self.protocol.del_all_resource_pb()

    def shangzhenwujiang(self, pos, name):
        """
        上阵武将
        :param pos: 坑位，2-6
        :param id: 武将名
        :return:
        """
        wujiang_id = self.get_resource_id(name)
        Flush_body = self.protocol.Flush("武将")
        if str(wujiang_id) in Flush_body.keys():
            only_id = Flush_body[str(wujiang_id)]
            self.protocol.shangzhenwujiang(pos, only_id)
            self.wujiangshengxing(name, only_id)
        else:
            raise GmException("请先添加武将" + name)

    def wujiangshengxing(self, name, only_id):
        """
        武将升星
        :param pos: 坑位，2-6
        :param id: 武将名
        :return:
        """
        add_type, wujiang_id = self.protocol.mri.get_type_id_from_name(name + "碎片")
        self.protocol.add_resource_pb(add_type, wujiang_id, 10000)
        for i in range(7):
            self.protocol.Knight_StarIncrease(only_id)

    def shangzhenshenshou(self, pos, name):
        """
        上阵神兽
        :param pos: 坑位，1-6
        :param name: 道具的名字
        :return:
        """

        add_type, add_value = self.protocol.mri.get_type_id_from_name("神兽仙石")
        self.protocol.add_resource_pb(add_type, add_value, 648)
        add_type, add_value = self.protocol.mri.get_type_id_from_name(name)
        self.protocol.add_resource_pb(add_type, add_value, 12)
        daoju_id = str(add_value)
        add_type, add_value = self.protocol.mri.get_type_id_from_name("极品灵兽丹")
        self.protocol.add_resource_pb(add_type, add_value, 7478)
        pet_list = self.protocol.Flush("神兽")
        if str(daoju_id) in pet_list.keys():
            only_id_list = pet_list[daoju_id]
            only_id = only_id_list[0]
            self.protocol.shangzhenshenshou(pos, only_id)  # 上阵
            for i in range(47):
                level = self.protocol.Pet_OneKey_LevelUp(only_id, 5)  # 升级
                if level > 234:
                    break
            only_id_list.pop(0)  # 都操作完了之后把该神兽从列表里删除
            self.protocol.Pet_StarUp(only_id, only_id_list[0:1])
            self.protocol.Pet_StarUp(only_id, only_id_list[1:2])
            self.protocol.Pet_StarUp(only_id, only_id_list[2:3])
            self.protocol.Pet_StarUp(only_id, only_id_list[3:4])
            self.protocol.Pet_StarUp(only_id, only_id_list[4:6])
            self.protocol.Pet_StarUp(only_id, only_id_list[6:8])
            self.protocol.Pet_StarUp(only_id, only_id_list[-3:])
        else:
            raise GmException("请先添加神兽" + name)
        #穿戴神兽装备
        pet_equipment_name = "幻紫仙爪"
        add_type, add_zhua_value = self.protocol.mri.get_type_id_from_name(pet_equipment_name)
        self.protocol.add_resource_pb(add_type, add_zhua_value, 1)
        pet_equipment_name = "幻紫仙角"
        add_type, add_jiao_value = self.protocol.mri.get_type_id_from_name(pet_equipment_name)
        self.protocol.add_resource_pb(add_type, add_jiao_value, 1)
        pet_equipment_name = "幻紫仙环"
        add_type, add_huan_value = self.protocol.mri.get_type_id_from_name(pet_equipment_name)
        self.protocol.add_resource_pb(add_type, add_huan_value, 1)
        pet_zhuangbei_list = self.protocol.Flush("神兽装备")
        print(pet_zhuangbei_list)
        self.protocol.shangzhenshenshouzhuangbei(pos * 3 - 2, pet_zhuangbei_list[add_zhua_value][0])
        self.protocol.shangzhenshenshouzhuangbei(pos * 3 - 1, pet_zhuangbei_list[add_jiao_value][0])
        self.protocol.shangzhenshenshouzhuangbei(pos * 3, pet_zhuangbei_list[add_huan_value][0])
        for i in range(24):
            self.protocol.Pet_Equipment_FastUpgrade([pos * 3, pos * 3 - 1, pos * 3 - 2])#一键强化

    def chuandaizhuangbei(self, pos, name):
        """
        上阵装备,武器1，鞋子2，头盔3，战甲4，逆时针顺序，第二个武将武器5，鞋子6.....
        :param pos: 坑位，1-24
        :param name: 道具的名字
        :return:
        """
        add_type, add_value = self.protocol.mri.get_type_id_from_name("银币")
        self.protocol.add_resource_pb(add_type, add_value, 999999999)
        add_type, add_value = self.protocol.mri.get_type_id_from_name("顶级精炼石")
        self.protocol.add_resource_pb(add_type, add_value, 999999)
        add_type, add_value = self.protocol.mri.get_type_id_from_name("普通装备纹晶")
        self.protocol.add_resource_pb(add_type, add_value, 999)
        daoju_id = self.get_resource_id(name)
        Flush_body = self.protocol.Flush("装备")
        if str(daoju_id) in Flush_body.keys():
            only_id_list = Flush_body[str(daoju_id)]
            self.protocol.chuandaizhuangbei(pos, only_id_list[0])
            for i in range(80):
                self.protocol.Equipment_RefiningOneLevel(only_id_list[0])  # 装备精炼
            for i in range(3):
                self.protocol.Equipment_Glyph(only_id_list[0])  # 装备雕纹
            Flush_body[str(daoju_id)] = only_id_list
            num = random.randint(1, 30)
            for i in range(30):
                level = self.protocol.Equipment_Upgrade(only_id_list[0], 5)  # 强化装备
                if level > 240:
                    break
            only_id_list.pop(0)  # 都操作完了之后把该装备从列表里删除
        else:
            raise GmException("请先添加装备" + name)
    def yijianshangzhenshenbing(self):
        """
        上阵神兵,
        :param pos: 坑位，1-6
        :param name: 道具的名字
        :return:
        """
        shenbing1="太公护符"
        shenbing2="倚天剑"
        shenbing3="七星宝刀"
        shenbing4="青釭剑"
        shenbing5="闭月团扇"
        shenbing6="丈八蛇矛"
        add_shenbing_type, add_shenbing_value = self.protocol.mri.get_type_id_from_name(shenbing1)
        self.protocol.add_resource_pb(add_shenbing_type, add_shenbing_value, 1)
        add_shenbing_type, add_shenbing_value = self.protocol.mri.get_type_id_from_name(shenbing2)
        self.protocol.add_resource_pb(add_shenbing_type, add_shenbing_value, 1)
        add_shenbing_type, add_shenbing_value = self.protocol.mri.get_type_id_from_name(shenbing3)
        self.protocol.add_resource_pb(add_shenbing_type, add_shenbing_value, 1)
        add_shenbing_type, add_shenbing_value = self.protocol.mri.get_type_id_from_name(shenbing4)
        self.protocol.add_resource_pb(add_shenbing_type, add_shenbing_value, 1)
        add_shenbing_type, add_shenbing_value = self.protocol.mri.get_type_id_from_name(shenbing5)
        self.protocol.add_resource_pb(add_shenbing_type, add_shenbing_value, 1)
        add_shenbing_type, add_shenbing_value = self.protocol.mri.get_type_id_from_name(shenbing6)
        self.protocol.add_resource_pb(add_shenbing_type, add_shenbing_value, 1)
        self.chuandaishenbing(1, shenbing1)
        self.chuandaishenbing(2, shenbing2)
        self.chuandaishenbing(3, shenbing3)
        self.chuandaishenbing(4, shenbing4)
        self.chuandaishenbing(5, shenbing5)
        self.chuandaishenbing(6, shenbing6)

    def chuandaibaowu(self, pos, name):
        """
        上阵宝物,左1，右2，依次递增
        :param pos: 坑位，1-12
        :param name: 道具的名字
        :return:
        """
        add_type, add_value = self.protocol.mri.get_type_id_from_name("经验虎符")
        self.protocol.add_resource_pb(add_type, add_value, 700)
        add_type, add_value = self.protocol.mri.get_type_id_from_name("普通宝物纹晶")
        self.protocol.add_resource_pb(add_type, add_value, 200)
        add_type, add_value = self.protocol.mri.get_type_id_from_name("高级宝物纹晶")
        self.protocol.add_resource_pb(add_type, add_value, 400)
        daoju_id = self.get_resource_id(name)
        Flush_body = self.protocol.Flush("宝物")
        if daoju_id in Flush_body.keys():
            only_id_list = Flush_body[daoju_id]
            self.protocol.chuandaibaowu(pos, only_id_list[0])
            self.protocol.Treasure_Upgrade_OneLevel(only_id_list[0], 60)  # 强化宝物 todo 换成孟德新书
            for i in range(6):
                self.protocol.Treasure_Glyph(only_id_list[0])#雕纹
        else:
            raise GmException("请先添加装备" + name)

    def chuandaishenbing(self, pos, name):
        """
        上阵神兵,
        :param pos: 坑位，1-6
        :param name: 道具的名字
        :return:
        """
        add_type, add_value = self.protocol.mri.get_type_id_from_name("神兵锻造石")
        self.protocol.add_resource_pb(add_type, add_value, 999999)
        add_type, add_value = self.protocol.mri.get_type_id_from_name(name+"碎片")
        self.protocol.add_resource_pb(add_type, add_value, 3000)
        daoju_id = self.get_resource_id(name)
        Flush_body = self.protocol.Flush("神兵")
        if daoju_id in Flush_body.keys():
            only_id = Flush_body[daoju_id]
            self.protocol.chuandaishenbing(pos, only_id)
            self.protocol.Artifact_LevelUp(only_id, 239)  # 强化
            self.protocol.Artifact_Star(only_id, 50)#升星
        else:
            raise GmException("请先添加装备" + name)

    def add_friend(self, name):
        """
        添加好友，只能添加本服好友
        :param name: 好友的名字
        :return:
        """
        self.protocol.add_friend(name)

    def pass_friend(self):
        """
        通过好友申请，只能通过本服好友
        :param name: 好友的名字
        :return:
        """
        self.protocol.Friend_ConfirmFriend()

    def fuben_Battle(self, fuben_id):
        """
        副本战斗
        :param fuben_id: 副本关卡ID
        :return:
        """
        return self.protocol.Dungeon_ChallengeStageBegin(fuben_id)

    def Create_Guild(self, Guild_name):
        """
        创建军团
        :param Guild_name: string 军团名字
        :return:
        """
        self.add_resource({"贵族经验": 500000, "元宝": 200})
        return self.protocol.Create_Guild(Guild_name)

    def add_Guild(self, Guild_name):
        """
        查询并加入军团,没有军团就创建一个军团
        :param Guild_name: string 军团名字
        :return:
        """
        self.protocol.search_Guild(Guild_name)

    def quit_Guild(self, ):
        """
        退出军团
        :return:
        """
        self.protocol.Guild_Quit()

    def get_poco_dic(self):
        """
        刷新并获取当前界面UI信息
        :return: ui dic
        """
        return self.my_poco_obj.get_poco_dic()

    def my_touch_in_dic(self, poco_path, poco_dic, click_list=None):
        """
        传入缓存的poco节点字典，直接去点击字典里面缓存的节点
        :param poco_path: poco name
        :param poco_dic: 缓存的字典
        :param click_list: 点击节点偏移量
        :return:
        """
        if self.is_in_dic(poco_path, poco_dic):
            self.my_touch(poco_path, click_list=click_list)
        else:
            raise NoneException(poco_path)

    def is_this_text(self, poco_path, text, is_in=False):
        """
        判断节点的文字
        :param poco_path: 节点的绝对路径
        :param text: 需要判断的文字
        :param text: 是否包含
        :return: bool
        """
        return self.my_poco_obj.is_this_text(poco_path, text, is_in=is_in)

    def set_xn_test(self):
        """
        进行性能测试时需要先启动该方法
        """
        self.xt = XnTest()

    # @err_close_game
    def open_game(self, sever_name_input, game_account_input, password=None):
        """
        功能向,启动游戏并到游戏主界面
        :param sever_name_input: 区服
        :param game_account_input: 账号
        :param game_account_input: 密码，可选
        :param red_info: 是否读取表中的账号
        :return:返回StdPoco().poco对象，可使用原生框架
        """
        # game_text = self.my_poco_obj.get_game_run_text()
        # game_name_list = ["少三2", "少西", "少三", "少三2台湾", "少三2日本", "少三2韩国", ]
        # for game_name in game_name_list:
        #     game_name_activities = self.info.get_config(game_name, "app_name")
        #     if game_name_activities in game_text:
        #         stop_app(game_name_activities)
        self.my_poco_obj.close_all_app()
        print("关闭app")
        entry = EntryGame(self.game_name_key, self.phone_id)
        entry.entry_game(sever_name_input, game_account_input, password)

    def close_game(self):
        """
        关闭游戏，不区分功能或者性能
        :return:
        """
        time.sleep(3)
        self.my_poco_obj.close_game()

    def swipe(self, pos1, pos2, duration=3):

        """
        根据传入的坐标进行滑动，调用的airtest自带的滑动方法
        :param pos1: 开始
        :param pos2: 结束
        :param duration: 滑动持续时间
        :return:
        """
        self.my_poco_obj.swipe(pos1, pos2, duration=duration)

    # @err_close_game
    def my_swipe(self, start_path, end_path, timein=3):
        """
        两个对象中心点之间的滑动
        :param start_path:开始路径
        :param end_path:结束路径
        :param timein:不传的话默认2秒
        :return:两个对象的坐标
        """
        return self.my_poco_obj.my_swipe(start_path, end_path, timein)

    def my_swipe_pos(self, start_pos_list, end_pos_list, timein=3):
        """
        默认滑动时长3秒
        :param pos_list_int:控件的pos属性
        :return:
        """
        self.my_poco_obj.swipe_pos(start_pos_list, end_pos_list, timein)

    # @err_close_game
    def my_touch(self, poco_path, click_list=None):
        """
        :param poco_path:控件路径
        :param click_list:控件点击偏移点[0,0]-[1,1]范围
        :return:Exception
        """

        self.my_poco_obj.touch_poco(poco_path, click_list=click_list)

    def my_touch_pos(self, pos_list_int, is_sleep=True):
        """
        :param pos_list_int:控件的pos属性
        :return:Exception
        """
        self.my_poco_obj.touch_pos(pos_list_int, is_sleep=is_sleep)

    def touch(self, pos_list_int):
        """
        直接传入需要点击的绝对坐标
        :param pos_list_int: 坐标
        :return:
        """
        self.my_poco_obj.touch(pos_list_int)

    def xn_touch(self, pos_list_int):
        """
        横屏
        直接调用底层Android框架，只需要执行点击操作，不需要截图添加日志
        根据控件位置在屏幕的百分比进行点击操作
        :param pos_list_int:控件的pos属性
        :return:
        """
        if self.xt == None:
            self.set_xn_test()
        self.xt.xn_touch(pos_list_int)

    def xn_swipe(self, start, end):
        """
        直接调用底层Android框架，只需要执行滑动操作，不需要截图添加日志
        根据控件位置在屏幕的百分比进行点击操作
        :param start: 开始控件pos
        :param end: 结束控件pos
        :return:
        """
        if self.xt == None:
            self.set_xn_test()
        self.xt.xn_swipe(start, end)

    def get_config(self, dic_name, key):
        """
        获取配置文件信息
        :param dic_name:游戏代号
        :param key:键
        :return:value
        """
        return self.info.get_config(dic_name, key)

    def set_config(self, dic_name, key, value):
        """
        设置配置文件信息
        :param dic_name:游戏代号
        :param key:键
        :param value:值
        :return:
        """
        self.info.set_config(dic_name, key, value)

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

    def get_game_text_l(self, poco_path, subscript):
        """
        不同游戏不同实现，获取poco对象中text属性中的文字 one/two
        :param poco_path:poco对象
        :param subscript:0/1
        :return:str
        """
        return self.my_poco_obj.get_game_text_l(poco_path, subscript)

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

    def get_game_text(self, poco_path):
        """
        获取游戏poco_path-text属性中的str数字
        :param poco_path:poco对象
        :return:int
        """
        return self.my_poco_obj.get_game_text(poco_path)

    def get_poco_position(self, poco_path):
        """
        获取节点的绝对坐标，经过手机分辨率换算
        :param poco_path: poco_name
        :return:
        """
        return self.my_poco_obj.get_poco_position(poco_path)

    def get_game_number_instr(self, poco_path):
        """
        只获取poco对象中text属性中的数字
        :param poco_path:poco路径
        :return:int
        """
        return self.my_poco_obj.get_game_number_instr(poco_path)

    def get_poco_any_value(self, find_poco_path, value_name_str):
        """
        获取游戏poco对象value_name_str属性中的值，需要自行判断类型
        :param find_poco_path:poco对象的路径
        :param value_name_str:属性的key
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

    def contrast_first_second(self, first, second, msg):
        """
        对比结果值，并在报告连接中添加日志信息，比如资源变化前后的对比
        :param first:对比值one
        :param second:对比值two
        :param msg:日志的描述，==/！=、正常/异常
        :return:
        """
        self.my_poco_obj.contrast_first_second(first, second, msg)

    def first_open_yztest(self):
        """
        启动性能工具，在开始测试步骤前结束
        :return:
        """

    def start_test_xn(self, ):
        """
        性能，点击开始测试按钮，启动游戏并在游戏界面停止
        :return:poco对象
        """
        # todo
        if self.xt == None:
            self.set_xn_test()
        return

    def touch_tab_xn(self):
        """
        点击标记按钮
        :return:
        """
        if self.xt == None:
            self.set_xn_test()

    def end_tab_xn(self):
        """
        在这里添加截图，来判断性能测试操作步骤是否正确
        结束测试并上传报告，在开始测试界面结束
        :return:
        """
        if self.xt == None:
            self.set_xn_test()

    def close_test_xn(self):
        """
        停止性能测试，关闭性能软件和游戏
        :return:
        """
        if self.xt == None:
            self.set_xn_test()

    def text_str(self, input_str):
        """
        输入文本，没有回车键
        :param input_str:需要输入的文本
        :return:
        """
        self.my_poco_obj.text_str(input_str)

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

    def add_msg_in_log(self, msg, is_pass=True):
        """
        将打印信息添加到报告中
        :param msg: 日志描述
        :param is_pass: 改变该条打印的是否通过状态
        :return:
        """
        self.my_poco_obj.add_msg_in_log(msg, is_pass=is_pass)

    def is_in_dic(self, poco_path, poco_dic_input=None):
        """
        判断节点是否在当前屏幕
        :param poco_path: 节点名字
        :return: Ture/False
        """
        return self.my_poco_obj.is_in_dic(poco_path, poco_dic_input=poco_dic_input)

    def is_visible(self, poco_path):
        """
        判断节点能不能点击,一般用作点击之后的状态判断
        :param poco_path: 节点名字
        :return: Ture/False
        """
        return self.my_poco_obj.is_visible(poco_path)

    def add_resource(self, dic_input):
        """
        添加各种资源，协议向
        :param dic_input:dic {"资源名称":资源数量,"资源名称":资源数量,...}
        :return:
        """
        self.gm.add_resources(dic_input)

    def add_resource_hw(self, dic_input):
        """
        添加各种资源，协议向
        :param dic_input:dic {"资源名称":资源数量,"资源名称":资源数量,...}
        :return:
        """
        for resource_name in dic_input.keys():
            add__num = dic_input[resource_name]
            add_type, add_value = self.protocol.mri.get_type_id_from_name(resource_name)
            self.protocol.add_resource_pb(add_type, add_value, add__num)

    def get_resource_quantity(self, list_input):
        """
        根据传入的道具列表查询道具数量
        :param resource_name_list:["道具名","道具名2"，"道具名3"]
        :return:{"道具名":道具数量,"道具名2":道具数量，"道具名3":道具数量}
        """
        return self.gm.select_resources(list_input)

    def delete_resource(self, dic_input):
        """
        删除各种资源，协议向
        :param dic_input:dic {"资源名称":资源数量,"资源名称":资源数量,...}
        :return:
        """
        # self.gm.delete_resources(dic_input)
        self.rg.delete_resource(dic_input)

    def get_resource_id(self, resource_name):
        """
        根据资源名称查询id
        :param resource_name:资源名称
        :return:int id
        """
        return self.gm.get_resource_id(resource_name)

    # def get_sever_time(self):
    #     """
    #     查询服务器时间
    #     :param server_name:str 服务器名
    #     :return:[int(ymd),int(hms),int(week)]
    #     """
    #     # return self.gm.select_server_time(server_name)
    #     return self.rg.get_sever_time()

    def set_sever_time(self, dic_input):
        """
        修改服务器时间
        :param server_time_dic:{"服务器名":时间戳}
        :return:
        """
        self.gm.set_server_time(dic_input)

    # def set_checkpoint(self, checkpoint):
    def set_checkpoint(self, account, sever_name_input, checkpoint):
        """
        设置通关关卡数，目前仅限于少三2
        :param checkpoint:str 玩法名-章节数-小关卡数
        :return:
        """
        if "副本" in checkpoint.keys():
            self.gm.set_checkpoint(checkpoint["副本"])
        if "列传" in checkpoint.keys():
            self.GM_yijian_mingjiangzhuan(checkpoint["列传"])

    def set_level(self, level):
        """
        设置玩家等级,目前仅限于少西
        :param level:int 玩家等级
        :return:
        """
        self.gm.set_level(level)

    def recharge_supplement(self, resource_name):
        """
        充值补单
        :param resource_name:"道具名"
        :return:
        """
        self.gm.recharge_supplement(resource_name)

    def game_is_die(self):
        return self.my_poco_obj.game_is_die()

    def get_random_account(self):
        """
        根据时间戳生成一个8位的纯数字字符串，可用于生成账号
        :return: str 8位数字
        """
        return self.my_poco_obj.make_random_account()

    # def start_protocol(self, server_name, protocol_name):#暂时不接入协议
    #     """
    #     传入服务器名和协议名
    #     :param server_name: 服务器名
    #     :param protocol_name:
    #     :return:
    #     """
    #     self.pf = ProtocolFunction(self.game_name, server_name, protocol_name)

    def GM_fengkuang_fuben(self, checkpoint_name, num):
        """
        指定战斗某一关，必须是可以直接打的关卡，目前仅限于少三2
        :param checkpoint:str 玩法名-章节数-小关卡数  副本-80-10
        :param num:int 战斗次数
        :return:有些战斗有次数限制，不能多打
        """
        # add_type, add_value = self.protocol.mri.get_type_id_from_name("陆逊")
        # self.protocol.add_resource_pb(add_type, add_value, 1)
        # self.shangzhenwujiang(2, "陆逊")
        # tilizhi = self.get_resource_quantity(["体力值"])# todo 获取体力值
        tilizhi = self.get_resource_pb("体力值")
        add_tilizhi_num = 1000 - tilizhi
        if add_tilizhi_num == 0:
            pass
        else:
            # 初始化体力值到1000
            add_type, add_value = self.protocol.mri.get_type_id_from_name("体力值")
            self.protocol.add_resource_pb(add_type, add_value, add_tilizhi_num)
        fuben_id = self.protocol.mri.get_num_from_name(checkpoint_name)
        for i in range(num + 1)[1:]:
            self.protocol.GM_fengkuangfuben(fuben_id)
            print("战斗" + str(i) + "次")
            if (i % 200) == 0:
                add_type, add_value = self.protocol.mri.get_type_id_from_name("体力值")
                self.protocol.add_resource_pb(add_type, add_value, 1000)

    def GM_yijian_chuanzhuangbei(self):
        # 上阵武将
        wuqi = "测试战戟"
        xiezi = "测试战靴"
        zhanjia = "测试战甲"
        toukui = "测试头盔"
        add_type, add_value = self.protocol.mri.get_type_id_from_name(wuqi)
        self.protocol.add_resource_pb(add_type, add_value, 6)
        add_type, add_value = self.protocol.mri.get_type_id_from_name(xiezi)
        self.protocol.add_resource_pb(add_type, add_value, 6)
        add_type, add_value = self.protocol.mri.get_type_id_from_name(zhanjia)
        self.protocol.add_resource_pb(add_type, add_value, 6)
        add_type, add_value = self.protocol.mri.get_type_id_from_name(toukui)
        self.protocol.add_resource_pb(add_type, add_value, 6)
        zuobaowu ="孟德新书"
        youbaowu = "丞相印"
        add_type, add_value = self.protocol.mri.get_type_id_from_name(zuobaowu)
        self.protocol.add_resource_pb(add_type, add_value, 6)
        add_type, add_value = self.protocol.mri.get_type_id_from_name(youbaowu)
        self.protocol.add_resource_pb(add_type, add_value, 6)
        add_wujiang_type, add_wujiang_value = self.protocol.mri.get_type_id_from_name("陆逊")
        self.protocol.add_resource_pb(add_wujiang_type, add_wujiang_value, 1)
        self.shangzhenwujiang(2, "陆逊")
        add_wujiang_type, add_wujiang_value = self.protocol.mri.get_type_id_from_name("刘备")
        self.protocol.add_resource_pb(add_wujiang_type, add_wujiang_value, 1)
        self.shangzhenwujiang(3, "刘备")
        add_wujiang_type, add_wujiang_value = self.protocol.mri.get_type_id_from_name("郭嘉")
        self.protocol.add_resource_pb(add_wujiang_type, add_wujiang_value, 1)
        self.shangzhenwujiang(4, "郭嘉")
        add_wujiang_type, add_wujiang_value = self.protocol.mri.get_type_id_from_name("黄忠")
        self.protocol.add_resource_pb(add_wujiang_type, add_wujiang_value, 1)
        self.shangzhenwujiang(5, "黄忠")
        add_wujiang_type, add_wujiang_value = self.protocol.mri.get_type_id_from_name("诸葛亮")
        self.protocol.add_resource_pb(add_wujiang_type, add_wujiang_value, 1)
        self.shangzhenwujiang(6, "诸葛亮")
        self.protocol.Formation_ChangePosition([6, 1, 2, 3, 4, 5])  # 调整阵型
        for i in range(1,7):
            self.chuandaizhuangbei(i*4-3, wuqi)
            self.chuandaizhuangbei(i*4-2, xiezi)
            self.chuandaizhuangbei(i*4-1, zhanjia)
            self.chuandaizhuangbei(i*4, toukui)
        for i in range(1,7):
            self.chuandaibaowu(i*2-1, zuobaowu)
            self.chuandaibaowu(i*2, youbaowu)
        # self.yijianshangzhenshenbing()

    def GM_yijian_fuben(self, zhangjie_id):
        """
        开始一键通关副本，海外后续使用GMAPI
        :param zhangjie_id: 章节id
        :return:
        """
        add_type, add_value = self.protocol.mri.get_type_id_from_name("角色经验")
        self.protocol.add_resource_pb(add_type, add_value, 409909990)
        add_type, add_value = self.protocol.mri.get_type_id_from_name("测试属性")
        self.protocol.add_resource_pb(add_type, add_value, 999999999)
        tilizhi = self.get_resource_pb("体力值")
        add_tilizhi_num = 1000 - tilizhi
        add_tili_type, add_tili_value = self.protocol.mri.get_type_id_from_name("体力值")
        if add_tilizhi_num == 0:
            pass
        else:
            # 初始化体力值到1000
            self.protocol.add_resource_pb(add_tili_type, add_tili_value, add_tilizhi_num)
        for i in range(zhangjie_id + 1)[1:]:  # 副本通关数
            for ii in range(15)[1:]:  # 关卡数可以多一点，适配小关卡数量不确定性
                checkpoint_name = "副本-" + str(i) + "-" + str(ii)
                try:
                    fuben_id = self.protocol.mri.get_num_from_name(checkpoint_name)
                except Exception:  # 找不到关卡说明打完了，就终止
                    self.protocol.add_resource_pb(add_tili_type, add_tili_value, 500)
                    break
                self.protocol.GM_fengkuangfuben(fuben_id)

    def GM_yijian_account_v1(self, account):
        """
        一键制作账号，1. 创建帐号（名字字数无具体要求）
                    2. 新手引导结束
                    3. 角色等级>30
                    4. 通关主线副本>30章
                    5. 通关名将传>7章
                    6. 通关无双试练>20关
                    7. 好友数量>50个
                    8. 武将上阵5个（小乔，貂蝉，马超，刘备，典韦）
        :param account:str 账号 给添加好友功能使用
        :return:
        """
        # 加资源，等级
        add_type, add_value = self.protocol.mri.get_type_id_from_name("角色经验")
        self.protocol.add_resource_pb(add_type, add_value, 409909990)
        add_type, add_value = self.protocol.mri.get_type_id_from_name("测试属性")
        self.protocol.add_resource_pb(add_type, add_value, 999999999)
        add_type, add_value = self.protocol.mri.get_type_id_from_name("元宝")
        self.protocol.add_resource_pb(add_type, add_value, 910)
        # 上阵武将
        add_wujiang_type, add_wujiang_value = self.protocol.mri.get_type_id_from_name("陆逊")
        self.protocol.add_resource_pb(add_wujiang_type, add_wujiang_value, 1)
        self.shangzhenwujiang(2, "陆逊")
        add_wujiang_type, add_wujiang_value = self.protocol.mri.get_type_id_from_name("小乔")
        self.protocol.add_resource_pb(add_wujiang_type, add_wujiang_value, 1)
        self.shangzhenwujiang(3, "小乔")
        add_wujiang_type, add_wujiang_value = self.protocol.mri.get_type_id_from_name("貂蝉")
        self.protocol.add_resource_pb(add_wujiang_type, add_wujiang_value, 1)
        self.shangzhenwujiang(4, "貂蝉")
        add_wujiang_type, add_wujiang_value = self.protocol.mri.get_type_id_from_name("马超")
        self.protocol.add_resource_pb(add_wujiang_type, add_wujiang_value, 1)
        self.shangzhenwujiang(5, "马超")
        add_wujiang_type, add_wujiang_value = self.protocol.mri.get_type_id_from_name("典韦")
        self.protocol.add_resource_pb(add_wujiang_type, add_wujiang_value, 1)
        self.shangzhenwujiang(6, "典韦")
        self.protocol.Formation_ChangePosition([6, 1, 2, 3, 4, 5])  # 调整阵型
        # 开始一键通关副本，海外后续使用GMAPI
        tilizhi = self.get_resource_pb("体力值")
        add_tilizhi_num = 1000 - tilizhi
        add_tili_type, add_tili_value = self.protocol.mri.get_type_id_from_name("体力值")
        if add_tilizhi_num == 0:
            pass
        else:
            # 初始化体力值到1000
            self.protocol.add_resource_pb(add_tili_type, add_tili_value, add_tilizhi_num)
        for i in range(32)[1:]:  # 副本通关数
            for ii in range(15)[1:]:  # 关卡数可以多一点，适配小关卡数量不确定性
                checkpoint_name = "副本-" + str(i) + "-" + str(ii)
                try:
                    fuben_id = self.protocol.mri.get_num_from_name(checkpoint_name)
                except Exception:  # 找不到关卡说明打完了，就终止
                    self.protocol.add_resource_pb(add_tili_type, add_tili_value, 500)
                    break
                self.protocol.GM_fengkuangfuben(fuben_id)
        self.GM_yijian_mingjiangzhuan(7)  # 通关名将传
        self.GM_fengkuang_haoyou(50, account_into=account)  # 加好友
        self.GM_yijian_wushaungshilian(20)  # 通关无双试炼
        self.GM_fengkuang_fuben("副本-15-5", 30)
        self.GM_shop_shopping(105, 10)  # 买10个银币
        self.GM_shop_shopping(101, 4)  # 买4个体力丹
        self.GM_yijian_guanai()  # 通关关隘
        # self.GM_huoyue_lianyufuben()#炼狱副本
        # self.GM_huoyue_taofajushou()#讨伐巨兽
        self.GM_huoyue_friend_send_gift()  # 好友送礼
        self.GM_huoyue_mijingduobao()  # 秘境寻宝
        self.GM_huoyue_jingjichang()  # 挑战竞技场
        for i in range(31)[1:]:
            self.protocol.add_resource_pb(6, i, 1000)
        self.protocol.add_resource_pb(5, 50150, 1)
        self.protocol.add_resource_pb(5, 50160, 1)
        self.protocol.add_resource_pb(5, 50170, 1)
        self.protocol.add_resource_pb(5, 50180, 1)
        self.protocol.add_resource_pb(7, 411, 2)
        self.protocol.add_resource_pb(7, 412, 2)
        self.protocol.add_resource_pb(7, 413, 2)
        self.protocol.add_resource_pb(7, 414, 2)
        self.protocol.add_resource_pb(7, 421, 4)
        self.protocol.add_resource_pb(7, 422, 4)
        self.protocol.add_resource_pb(7, 423, 4)
        self.protocol.add_resource_pb(7, 424, 4)
        self.protocol.add_resource_pb(8, 11210, 10)
        self.protocol.add_resource_pb(8, 11320, 10)
        self.protocol.add_resource_pb(8, 12210, 10)
        self.protocol.add_resource_pb(8, 12320, 10)
        self.protocol.add_resource_pb(8, 14010, 50)
        self.protocol.add_resource_pb(8, 14020, 50)
        self.protocol.add_resource_pb(15, 510060, 1)
        self.protocol.add_resource_pb(15, 510070, 1)
        self.protocol.add_resource_pb(15, 510080, 1)
        self.protocol.add_resource_pb(2, 411, 500)
        self.protocol.add_resource_pb(2, 412, 500)
        self.protocol.add_resource_pb(2, 413, 500)
        self.protocol.add_resource_pb(2, 414, 500)
        self.protocol.add_resource_pb(2, 421, 500)
        self.protocol.add_resource_pb(2, 422, 500)
        self.protocol.add_resource_pb(2, 423, 500)
        self.protocol.add_resource_pb(2, 424, 500)
        self.protocol.add_resource_pb(2, 22020, 1000)
        self.protocol.add_resource_pb(2, 22030, 1000)
        self.protocol.add_resource_pb(2, 23010, 1000)
        self.protocol.add_resource_pb(2, 23020, 1000)
        self.protocol.add_resource_pb(2, 23060, 1000)
        self.protocol.add_resource_pb(2, 50150, 1000)
        self.protocol.add_resource_pb(2, 50160, 1000)
        self.protocol.add_resource_pb(2, 50170, 1000)
        self.protocol.add_resource_pb(2, 50050, 1000)
        self.protocol.add_resource_pb(2, 510040, 1000)
        self.protocol.add_resource_pb(2, 510050, 1000)
        self.protocol.add_resource_pb(2, 510060, 1000)
        self.protocol.add_resource_pb(2, 510070, 1000)
        self.protocol.add_resource_pb(2, 510080, 1000)
        self.protocol.add_resource_pb(2, 15302, 1000)
        self.protocol.add_resource_pb(2, 15401, 1000)
        self.protocol.add_resource_pb(2, 15402, 1000)
        self.protocol.add_resource_pb(3, 1, 1000)
        self.protocol.add_resource_pb(3, 2, 100000)
        self.protocol.add_resource_pb(3, 6, 100)
        self.protocol.add_resource_pb(3, 7, 5000)
        self.protocol.add_resource_pb(3, 8, 5000)
        self.protocol.add_resource_pb(3, 9, 5000)
        self.protocol.add_resource_pb(3, 10, 10000)
        self.protocol.add_resource_pb(3, 11, 20000)
        self.protocol.add_resource_pb(3, 12, 1000)
        self.protocol.add_resource_pb(3, 13, 1000)
        self.protocol.add_resource_pb(3, 14, 1000)
        self.protocol.add_resource_pb(3, 15, 1000)
        self.protocol.add_resource_pb(3, 22, 1000)
        self.protocol.add_resource_pb(3, 23, 1000)
        self.protocol.add_resource_pb(3, 24, 100)
        self.protocol.add_resource_pb(3, 26, 10000)
        self.protocol.add_resource_pb(3, 28, 1000)
        self.protocol.add_resource_pb(3, 29, 1000)
        self.protocol.add_resource_pb(3, 32, 10000)
        self.protocol.add_resource_pb(3, 35, 1000)
        self.protocol.add_resource_pb(3, 37, 500)
        self.protocol.add_resource_pb(3, 39, 100)
        self.protocol.add_resource_pb(3, 47, 3000)
        self.protocol.add_resource_pb(3, 48, 3000)
        self.protocol.add_resource_pb(3, 49, 3000)
        self.protocol.add_resource_pb(3, 50, 3000)
        self.protocol.add_resource_pb(3, 56, 3000)
        self.protocol.add_resource_pb(3, 62, 50)
        self.protocol.add_resource_pb(3, 63, 50)
        self.protocol.add_resource_pb(3, 64, 50)
        self.protocol.add_resource_pb(3, 103, 100)
        self.protocol.add_resource_pb(3, 104, 100)
        self.protocol.add_resource_pb(3, 105, 100)
        self.protocol.add_resource_pb(3, 119, 100)
        self.protocol.add_resource_pb(3, 130, 1000)
        self.protocol.add_resource_pb(3, 131, 1000)
        self.protocol.add_resource_pb(3, 132, 1000)
        self.protocol.add_resource_pb(3, 133, 1000)
        self.protocol.add_resource_pb(3, 157, 2000)
        # 删除道具
        add_type, add_value = self.protocol.mri.get_type_id_from_name("元宝")
        yuanbaoshuliang = self.protocol.get_resource_pb_yuanbao()
        print("元宝数量========", yuanbaoshuliang)
        self.protocol.del_resource_pb(add_type, add_value, yuanbaoshuliang)
        add_type, add_value = self.protocol.mri.get_type_id_from_name("银币")
        yinbishuliang = self.get_resource_pb("银币")
        self.protocol.del_resource_pb(add_type, add_value, yinbishuliang)

    def GM_yijian_account_v2(self, account):
        """
        一键制作账号，1. 创建帐号（名字字数无具体要求）
                    2. 新手引导结束
                    3. 角色等级>30
                    4. 通关主线副本>30章
                    5. 通关名将传>7章
                    6. 通关无双试练>20关
                    7. 好友数量>50个
                    8. 武将上阵5个（小乔，貂蝉，马超，刘备，典韦）
                    清除所有资源
        :param account:str 账号 给添加好友功能使用
        :return:
        """
        # 加资源，等级
        add_type, add_value = self.protocol.mri.get_type_id_from_name("角色经验")
        self.protocol.add_resource_pb(add_type, add_value, 409909990)
        add_type, add_value = self.protocol.mri.get_type_id_from_name("测试属性")
        self.protocol.add_resource_pb(add_type, add_value, 999999999)
        add_type, add_value = self.protocol.mri.get_type_id_from_name("元宝")
        self.protocol.add_resource_pb(add_type, add_value, 910)
        # 上阵武将
        add_wujiang_type, add_wujiang_value = self.protocol.mri.get_type_id_from_name("陆逊")
        self.protocol.add_resource_pb(add_wujiang_type, add_wujiang_value, 1)
        self.shangzhenwujiang(2, "陆逊")
        add_wujiang_type, add_wujiang_value = self.protocol.mri.get_type_id_from_name("小乔")
        self.protocol.add_resource_pb(add_wujiang_type, add_wujiang_value, 1)
        self.shangzhenwujiang(3, "小乔")
        add_wujiang_type, add_wujiang_value = self.protocol.mri.get_type_id_from_name("貂蝉")
        self.protocol.add_resource_pb(add_wujiang_type, add_wujiang_value, 1)
        self.shangzhenwujiang(4, "貂蝉")
        add_wujiang_type, add_wujiang_value = self.protocol.mri.get_type_id_from_name("马超")
        self.protocol.add_resource_pb(add_wujiang_type, add_wujiang_value, 1)
        self.shangzhenwujiang(5, "马超")
        add_wujiang_type, add_wujiang_value = self.protocol.mri.get_type_id_from_name("典韦")
        self.protocol.add_resource_pb(add_wujiang_type, add_wujiang_value, 1)
        self.shangzhenwujiang(6, "典韦")
        self.protocol.Formation_ChangePosition([6, 1, 2, 3, 4, 5])  # 调整阵型
        # 开始一键通关副本，海外后续使用GMAPI
        tilizhi = self.get_resource_pb("体力值")
        add_tilizhi_num = 1000 - tilizhi
        add_tili_type, add_tili_value = self.protocol.mri.get_type_id_from_name("体力值")
        if add_tilizhi_num == 0:
            pass
        else:
            # 初始化体力值到1000
            self.protocol.add_resource_pb(add_tili_type, add_tili_value, add_tilizhi_num)
        for i in range(32)[1:]:  # 副本通关数
            for ii in range(15)[1:]:  # 关卡数可以多一点，适配小关卡数量不确定性
                checkpoint_name = "副本-" + str(i) + "-" + str(ii)
                try:
                    fuben_id = self.protocol.mri.get_num_from_name(checkpoint_name)
                except Exception:  # 找不到关卡说明打完了，就终止
                    self.protocol.add_resource_pb(add_tili_type, add_tili_value, 500)
                    break
                self.protocol.GM_fengkuangfuben(fuben_id)
        self.GM_yijian_mingjiangzhuan(7)  # 通关名将传
        self.GM_fengkuang_haoyou(50, account_into=account)  # 加好友
        self.GM_yijian_wushaungshilian(20)  # 通关无双试炼
        self.GM_fengkuang_fuben("副本-15-5", 30)
        self.GM_shop_shopping(105, 10)  # 买10个银币
        self.GM_shop_shopping(101, 4)  # 买4个体力丹
        self.GM_yijian_guanai()  # 通关关隘
        # self.GM_huoyue_lianyufuben()#炼狱副本
        # self.GM_huoyue_taofajushou()#讨伐巨兽
        self.GM_huoyue_friend_send_gift()  # 好友送礼
        self.GM_huoyue_mijingduobao()  # 秘境寻宝
        self.GM_huoyue_jingjichang()  # 挑战竞技场
        self.del_all_resource_pb()
        # 删除道具
        add_type, add_value = self.protocol.mri.get_type_id_from_name("元宝")
        yuanbaoshuliang = self.protocol.get_resource_pb_yuanbao()
        self.protocol.del_resource_pb(add_type, add_value, yuanbaoshuliang)

    def GM_yijian_wushaungshilian(self, checkpoint_num_into):
        """
        一键通关无双试炼,不能重复使用
        :param checkpoint_num:
        :return:
        """
        history_id, is_award = self.protocol.DeadBattle_GetInfo()
        Current_id = history_id + 1  # 历史的ID是都打过的
        checkpoint_num = checkpoint_num_into + 1  # 因为下面for循环要从1开始，所以要+1
        if Current_id >= checkpoint_num:
            return print(str(checkpoint_num_into) + "关已打过")
        Box_id = Current_id - (Current_id // 7) * 7
        for i in range(checkpoint_num)[Current_id:]:
            self.protocol.DeadBattle()
            if (Box_id % 3 == 0) or (Box_id % 7 == 0) and not is_award:  # 关底或者boss战领取宝箱和buff
                buff_id = self.protocol.DeadBattle_BoxAward()
                self.protocol.DeadBattle_PickBuff(buff_id)
            Box_id = Box_id + 1
            if Box_id >= 7:
                Box_id = Box_id - (Box_id // 7) * 7

    def GM_fengkuang_haoling(self, Guild_name, num, join=False):
        """
        疯狂给军团-号令天下活动捐旗子
        会先创建军团，然后捐旗子
        :param Guild_name: 军团名称
        :param num: 捐献的数量
        :join bool: 加入/创建军团
        :return:
        """
        # 先把消耗的道具加进去
        add_type, add_value = self.protocol.mri.get_type_id_from_name("角色经验")
        self.protocol.add_resource_pb(add_type, add_value, 99999999)
        add_type, add_value = self.protocol.mri.get_type_id_from_name("军旗")
        self.protocol.add_resource_pb(add_type, add_value, num)
        if join != "":
            if not join:
                # 如果是创建军团，就需要加一些道具
                add_type, add_value = self.protocol.mri.get_type_id_from_name("贵族经验")
                self.protocol.add_resource_pb(add_type, add_value, 500000)
                add_type, add_value = self.protocol.mri.get_type_id_from_name("元宝")
                self.protocol.add_resource_pb(add_type, add_value, 200)
        self.protocol.GM_fengkuanghaoling(Guild_name, num, join)

    def GM_yijian_mingjiangzhuan(self, checkpoint_num):
        """
        一键通关名将传，目前仅限于少三2
        :param checkpoint_num:int 大章节代号1.2.3
        :return:
        """
        # add_type, add_value = self.protocol.mri.get_type_id_from_name("陆逊")
        # self.protocol.add_resource_pb(add_type, add_value, 1)
        # self.shangzhenwujiang(2, "陆逊")
        num_lists = self.protocol.mri.get_num_list_from_name(checkpoint_num)
        for num_list in num_lists:
            mingjiangzhuan_id = num_list[0]
            type_num = num_list[1]
            self.protocol.Biography_ExecuteMission(mingjiangzhuan_id, type_num)
            if type_num == 1:
                add_type, add_value = self.protocol.mri.get_type_id_from_name("列传次数")
                self.protocol.add_resource_pb(add_type, add_value, 1)
                add_type, add_value = self.protocol.mri.get_type_id_from_name("体力值")
                self.protocol.add_resource_pb(add_type, add_value, 5)

    def GM_yijian_guanai(self, checkpoint_num=3):
        """
        一键通关关隘，目前仅限于少三2，只支持到第三关结束
        :param checkpoint_num:关卡数
        :return:
        """
        # add_type, add_value = self.protocol.mri.get_type_id_from_name("陆逊")
        # self.protocol.add_resource_pb(add_type, add_value, 1)
        # self.shangzhenwujiang(2, "陆逊")
        add_type, add_value = self.protocol.mri.get_type_id_from_name("疲劳值")
        num_lists = self.protocol.mri.get_num_list_from_name_ga(checkpoint_num)
        num = 0
        for num_list in num_lists:
            if num_list[2] == 1:
                num = num + 1
                if num == 8:
                    num = 0
                    self.protocol.add_resource_pb(add_type, add_value, 10)
            self.protocol.GM_yijian_guanai(num_list)

    def GM_huoyue_guanai(self):
        """
        剑阁，三个怪,用于老账号
        :return:
        """
        self.protocol.GM_huoyue_guanai()
        self.protocol.Storm_Reset(2001)  # 刷新剑阁，一天一次

    def GM_huoyue_lianyufuben(self):
        """
        炼狱副本，5次
        :return:
        """
        add_type, add_value = self.protocol.mri.get_type_id_from_name("霸王手戟")
        self.protocol.add_resource_pb(add_type, add_value, 1)
        add_type, add_value = self.protocol.mri.get_type_id_from_name("定军刀")
        self.protocol.add_resource_pb(add_type, add_value, 1)
        add_type, add_value = self.protocol.mri.get_type_id_from_name("曲燕")
        self.protocol.add_resource_pb(add_type, add_value, 1)
        add_type, add_value = self.protocol.mri.get_type_id_from_name("诸葛连弩")
        self.protocol.add_resource_pb(add_type, add_value, 1)
        add_type, add_value = self.protocol.mri.get_type_id_from_name("墨羽扇")
        self.protocol.add_resource_pb(add_type, add_value, 1)
        add_type, add_value = self.protocol.mri.get_type_id_from_name("雌雄双股剑")
        self.protocol.add_resource_pb(add_type, add_value, 1)
        self.protocol.EliteDungeon_BeginChallenge(190101, 1)
        time.sleep(3)
        self.protocol.EliteDungeon_FastChallenge(190101, 1, 1)
        time.sleep(3)
        self.protocol.EliteDungeon_FastChallenge(190101, 1, 1)
        time.sleep(3)
        self.protocol.EliteDungeon_FastChallenge(190101, 1, 1)
        time.sleep(3)
        self.protocol.EliteDungeon_FastChallenge(190101, 1, 1)

    def GM_huoyue_taofajushou(self):
        """
        打10次巨兽
        :return:
        """

        week = self.get_time_str(self.protocol.sever_time)[2]
        if week in [1, 3, 5, 7]:
            id_into = 1
        elif week in [2, 4, 6]:
            id_into = 2
        else:
            raise GmException("星期获取失败")
        for i in range(10):
            time.sleep(8)
            self.protocol.Rebel_AttackBegin(id_into)

    def GM_huoyue_mijingduobao(self):
        """
        打20次秘境寻宝
        :return:
        """
        add_type, add_value = self.protocol.mri.get_type_id_from_name("寻宝次数")
        self.protocol.add_resource_pb(add_type, add_value, 100)
        self.protocol.ContendTreasure_OneKeyFast(11010)
        self.protocol.ContendTreasure_OneKeyFast(11020)
        self.protocol.ContendTreasure_OneKeyFast(12010)
        self.protocol.ContendTreasure_OneKeyFast(12020)

    def GM_huoyue_yijianjingjichang(self):
        """
        一键打20次竞技场
        :return:
        """
        self.protocol.Arena_OneKeyChallenge(20)

    def GM_huoyue_jingjichang(self):
        """
        慢慢打20次竞技场
        :return:
        """
        for i in range(21)[1:]:
            mingci_id = self.GM_getinfo_jingjichang()[1]
            self.protocol.Arena_ChallengeBegin(mingci_id)
            time.sleep(1)

    def GM_getinfo_jingjichang(self, ):
        """
        获取竞技场可挑战名单
        :return:list 挑战名单
        """
        return self.protocol.Arena_GetMainInfo()

    def GM_shop_shopping(self, id_into, num_into, ):
        """
        商城购买道具
        :param storm_id_into: int 道具id
        :param num_into:int 道具数量
        :return:
        """
        self.protocol.Shop_Shopping(id_into, num_into, )

    def GM_huoyue_friend_send_gift(self, ):
        """
        给所有好友送礼物
        :return:
        """
        self.protocol.Friend_SendGift()

    def GM_huoyue_mingjiangzhuan(self):
        """
        扫荡名将传，目前仅限于少三2
        :return:
        """
        add_type, add_value = self.protocol.mri.get_type_id_from_name("列传次数")
        self.protocol.add_resource_pb(add_type, add_value, 10)
        num_list = [1003, 1004, 2002, 2004, 2006, 2007, ]
        for num in num_list:
            self.protocol.Biography_ExecuteMission(num, 1)

    def GM_wangzhejingji(self):
        """
        打王者竞技
        :return:
        """
        self.protocol.PeakArena_Match()
        time.sleep(2.5)
        self.protocol.PeakArena_ChallengeBegin()

    def GM_fengkuang_haoyou(self, num, account_into=None, sever_name_into=None):
        """
        指定服务器，创建一个拥有N个好友的账号
        :param sever_name: str 服务器
        :param num: int 拥有好友数
        :param account_into: str 拥有好友数
        :return:
        """
        if sever_name_into != None:
            sever_name = sever_name_into
        else:
            sever_name = self.GM_server_name
        add_type, add_value = self.protocol.mri.get_type_id_from_name("角色经验")
        if account_into != None:
            account1 = account_into
        else:
            # 创建一个新的账号
            account1 = self.get_random_account()
            self.make_new_role(sever_name, account1)
            self.protocol.add_resource_pb(add_type, add_value, 4899990)
            self.protocol.socket_close()
        # Thread_list = []
        # for i in range(num):
        #     thread = myThread(sever_name, account1)
        #     print("创建新线程"+str(i))
        #     # 开启新线程
        #     thread.start()
        #     Thread_list.append(thread)
        # for thread in Thread_list:
        #     print("开始线程")
        #     thread.join()
        for i in range(num):
            time.sleep(0.1)
            self.make_new_role(sever_name, self.get_random_account())
            self.protocol.add_resource_pb(add_type, add_value, 4899990)
            self.add_friend(account1)
            self.protocol.socket_close()
            # time.sleep(4)
        self.make_new_role(sever_name, account1)
        self.pass_friend()
        print("账号" + account1 + "上有" + str(num) + "个好友")
        return account1

    def GM_fengkuang_huashen(self, activity_id, cishu):
        """
        十连抽化身，检测是否抽到指定的东西,默认抽到一次后就停止
        :param activity_id: int 活动ID，GM后台配置
        :param resource_name: str 道具名字
        :param resource_num: int 道具数量（元宝6666个）
        :param is_stop: bool 是否抽到后就马上停止
        :return:
        """
        add_type, add_value = self.protocol.mri.get_type_id_from_name("角色经验")
        self.protocol.add_resource_pb(add_type, add_value, 99999999)
        add_type, add_value = self.protocol.mri.get_type_id_from_name("化身灵力")
        self.protocol.add_resource_pb(add_type, add_value, cishu * 10)
        resource_dic_list = []
        for i in range(cishu):
            award_list = self.protocol.huashen_shilian(activity_id)
            resource_dic_list = resource_dic_list + award_list
        log_str_z, tongji_str_z, shijiancishu = self.make_ui_log_by_gm(resource_dic_list)
        try:
            new_excel_tab("化身", log_str_z, tongji_str_z, shijiancishu)
        except Exception:
            pass
        return log_str_z, tongji_str_z, shijiancishu

    def make_ui_log_by_gm(self, resource_dic_list_input):
        """
        用来给抽奖类方法处理统一的日志
        :param resource_dic_list_input: 抽奖返回值奖励列表[{"type":,"value":,"size":,},]
        :return:
        """
        resources_dic = {}
        for resource_dic in resource_dic_list_input:
            # 获得道具名
            query_dic = {}
            query_dic['type'] = resource_dic['type']
            query_dic['id'] = resource_dic['value']
            resources_name = self.protocol.mri.get_name_from_type_id(query_dic)
            name = resources_name + str(resource_dic['size'])
            # 把名字和次数一一对应
            if name not in resources_dic.keys():  # 第一次添加，初始化
                resources_name_dic = {}
                resources_name_dic["抽到次数"] = 1
                resources_name_dic["道具名字"] = resources_name
                resources_name_dic["道具数量"] = resource_dic['size']
                resources_dic[name] = resources_name_dic
            else:
                resources_dic[name]["抽到次数"] = resources_dic[name]["抽到次数"] + 1
        shuliangtongji_dic = {}
        log_str_z = "抽奖结果："
        for name in resources_dic.keys():
            if name != "事件":
                log_dic = resources_dic[name]
                resources_name = log_dic["道具名字"]
                resources_shuliang = log_dic["道具数量"]
                resources_zongcishu = log_dic["抽到次数"]
                if str(resources_name) in shuliangtongji_dic.keys():
                    shuliangtongji_dic[str(resources_name)] = shuliangtongji_dic[str(resources_name)] + int(
                        resources_shuliang) * int(resources_zongcishu)
                else:
                    shuliangtongji_dic[str(resources_name)] = int(resources_shuliang) * int(resources_zongcishu)
                log_str = "道具：" + str(resources_name) + "，数量：" + str(resources_shuliang) + "，一共抽到：" + str(
                    resources_zongcishu) + "次"
                log_str_z = log_str_z + "\r\n" + log_str
        if "事件" in resources_dic.keys():
            shijiancishu = "抽到事件" + str(resources_dic["事件"]) + "次"
        else:
            shijiancishu = ""
        tongji_str_z = "统计结果："
        for tongji in shuliangtongji_dic.keys():
            tongji_str_z = tongji_str_z + "\r\n" + tongji + "：" + str(shuliangtongji_dic[tongji]) + "个"
        return log_str_z, tongji_str_z, shijiancishu

    def make_ui_log_by_gm_dongfeng(self, resource_dic_list_input):
        """
        用来给抽奖类方法处理统一的日志
        :param resource_dic_list_input: 抽奖返回值奖励列表[{"type":,"value":,"size":,},]
        :return:
        """
        resources_dic = {}
        for resource_dic in resource_dic_list_input:
            # 获得道具名
            query_dic = {}
            query_dic['type'] = resource_dic['type']
            query_dic['id'] = resource_dic['value']
            resources_name = self.protocol.mri.get_name_from_type_id(query_dic)
            name = resources_name + str(resource_dic['size'])
            # 把名字和次数一一对应
            if name not in resources_dic.keys():  # 第一次添加，初始化
                resources_name_dic = {}
                resources_name_dic["抽到次数"] = 1
                resources_name_dic["道具名字"] = resources_name
                resources_name_dic["道具数量"] = resource_dic['size']
                resources_dic[name] = resources_name_dic
            else:
                resources_dic[name]["抽到次数"] = resources_dic[name]["抽到次数"] + 1
        shuliangtongji_dic = {}
        log_str_z = "抽奖结果，"
        for name in resources_dic.keys():
            if name != "事件":
                log_dic = resources_dic[name]
                resources_name = log_dic["道具名字"]
                resources_shuliang = log_dic["道具数量"]
                resources_zongcishu = log_dic["抽到次数"]
                if str(resources_name) in shuliangtongji_dic.keys():
                    shuliangtongji_dic[str(resources_name)] = shuliangtongji_dic[str(resources_name)] + int(
                        resources_shuliang) * int(resources_zongcishu)
                else:
                    shuliangtongji_dic[str(resources_name)] = int(resources_shuliang) * int(resources_zongcishu)
                log_str = "道具：" + str(resources_name) + "，数量：" + str(resources_shuliang) + "，一共抽到：" + str(
                    resources_zongcishu) + "次"
                log_str_z = log_str_z +log_str
        return log_str_z


    def GM_fengkuang_hengsaoqianjun(self, activity_id, cishu):
        """
        横扫千军10连抽，
        :param activity_id: int 活动ID，GM后台配置
        :param cishu: int 抽多少次
        :return:
        """
        add_type, add_value = self.protocol.mri.get_type_id_from_name("角色经验")
        self.protocol.add_resource_pb(add_type, add_value, 99999999)
        add_type, add_value = self.protocol.mri.get_type_id_from_name("千军令")
        self.protocol.add_resource_pb(add_type, add_value, cishu * 10)
        resource_dic_list = []
        for i in range(cishu):
            award_list = self.protocol.hengsaoqianjun_shilian(activity_id)
            resource_dic_list = resource_dic_list + award_list
        log_str_z, tongji_str_z, shijiancishu = self.make_ui_log_by_gm(resource_dic_list)
        new_excel_tab("横扫千军", log_str_z, tongji_str_z, shijiancishu)
        return log_str_z, tongji_str_z, shijiancishu

    def GM_fengkuang_shikongzhaohuan(self, activity_id, cishu):
        """
        时空召唤10连抽，
        :param activity_id: int 活动ID，GM后台配置
        :param cishu: int 抽多少次
        :return:
        """
        id = 1000001
        # add_type, add_value = self.protocol.mri.get_type_id_from_name("角色经验")
        # self.protocol.add_resource_pb(add_type, add_value, 99999999)
        add_type, add_value = self.protocol.mri.get_type_id_from_name("封神召唤令")
        self.protocol.add_resource_pb(add_type, add_value, cishu * 10)
        resource_dic_list = []
        for i in range(cishu):
            award_list = self.protocol.shikongzhaohuan_shilian(activity_id, id)
            resource_dic_list = resource_dic_list + award_list
        log_str_z, tongji_str_z, shijiancishu = self.make_ui_log_by_gm(resource_dic_list)
        new_excel_tab("时空召唤", log_str_z, tongji_str_z, shijiancishu)
        return log_str_z, tongji_str_z, shijiancishu

    def GM_fengkuang_xianshijinjiang(self, activity_id, id_name_into, camps_name, cishu,resource_name=None):
        """
        限时神将10连抽，检测是否抽到指定的东西,默认抽到一次后就停止
        :param activity_id: int 活动ID，GM后台配置
        :param id_name_into: str 第几期活动的名字，GM后台配置
        :param camps_name: str 阵营 魏蜀吴群
        :param resource_name: str 道具名字
        :param is_stop: bool 是否抽到后就马上停止
        :return:
        """
        add_type, add_value = self.protocol.mri.get_type_id_from_name("角色经验")
        self.protocol.add_resource_pb(add_type, add_value, 99999999)
        # "GM后台汉字名字": "配置对应的期数ID"
        id_name_dic = {"限时金将第一期": "100000",
                       "限时金将第二期": "100001",
                       "限时金将第三期": "100002",
                       "第四期金1-金3": "100003",
                       "限时金将(开服金1)": "100004",
                       "限时金将(开服金2)": "100005",
                       "第五期金1-金4": "100006",
                       "金1(2.2.0)": "100007",
                       "金2(2.2.0)": "100008",
                       "金3(2.2.0)": "100009",
                       "第六期金1-金5": "100010",
                       "紫金1双卡池": "100011",
                       "紫金2双卡池": "100015",}
        # "配置对应的期数ID": "实际协议传输的ID",
        id_into_dic = {"100000": 1,
                       "100001": 5,
                       "100002": 9,
                       "100003": 13,
                       "100004": 17,
                       "100005": 21,
                       "100006": 25,
                       "100007": 29,
                       "100008": 33,
                       "100009": 37,
                       "100010": 41,
                       "100011": 45,
                       "100015": 59,
                       }
        id_into_key = id_name_dic[id_name_into]
        if camps_name == "魏":
            sub_type = 1
            id_into = id_into_dic[id_into_key]
        elif camps_name == "蜀":
            sub_type = 1
            id_into = id_into_dic[id_into_key] + 1
        elif camps_name == "吴":
            sub_type = 1
            id_into = id_into_dic[id_into_key] + 2
        elif camps_name == "群":
            sub_type = 1
            id_into = id_into_dic[id_into_key] + 3
        elif camps_name == "金":
            id_into = id_into_dic[id_into_key]
            sub_type = 1
        elif camps_name == "紫金1":
            id_into = id_into_dic[id_into_key] + 1
            sub_type = 2
        elif camps_name == "紫金1-2":
            id_into = id_into_dic[id_into_key] + 1
            sub_type = 2
        else:
            raise GmException("阵营不存在")
        add_type, add_value = self.protocol.mri.get_type_id_from_name("金将令")
        self.protocol.add_resource_pb(add_type, add_value, 10 * cishu)
        add_type, add_value = self.protocol.mri.get_type_id_from_name("紫金神将令")
        self.protocol.add_resource_pb(add_type, add_value, 10 * cishu)
        resource_dic_list = []
        find_num_list = []
        if resource_name!=None:
            find_type, find_value = self.protocol.mri.get_type_id_from_name(resource_name)
        for i in range(cishu):
            award_list = self.protocol.xianshishenjiang_shilian(activity_id, id_into, sub_type)
            if resource_name != None:
                for award in award_list:
                    if award["type"] ==find_type and award["value"] ==find_value:
                        find_num_list.append(i+1)
            resource_dic_list = resource_dic_list + award_list
        log_str_z, tongji_str_z, shijiancishu = self.make_ui_log_by_gm(resource_dic_list)
        new_excel_tab("限时金将", log_str_z, tongji_str_z, shijiancishu)
        print("-------------------------")
        print("指定的奖励出现的次数")
        print(find_num_list)
        print("-------------------------")
        return log_str_z, tongji_str_z, shijiancishu

    def GM_fengkuang_shenbingxilian(self, artifact_name, cishu):
        add_type, shenbing_add_value = self.protocol.mri.get_type_id_from_name(artifact_name)
        self.protocol.add_resource_pb(add_type, shenbing_add_value, 1)
        add_type, add_value = self.protocol.mri.get_type_id_from_name("洗练晶石")
        self.protocol.add_resource_pb(add_type, add_value, cishu * 5)
        shenbing_dic = self.protocol.Flush("神兵")
        if shenbing_add_value in shenbing_dic.keys():
            artifact_id = shenbing_dic[shenbing_add_value]
        pinzhi_dic = {"白": 0, "绿": 0, "蓝": 0, "紫": 0, "橙": 0, "红": 0, "金": 0, "紫金": 0, }
        try:
            if cishu > 1:
                for i in range(cishu):
                    artifacts_dic_list = self.protocol.Artifact_Purify(artifact_id)
                    for artifacts_dic in artifacts_dic_list:
                        # 只取一个孔的概率
                        pinzhi = artifacts_dic[str(1)]
                        if pinzhi == "1":
                            pinzhi_dic["白"] = pinzhi_dic["白"] + 1
                        elif pinzhi == "2":
                            pinzhi_dic["绿"] = pinzhi_dic["绿"] + 1
                        elif pinzhi == "3":
                            pinzhi_dic["蓝"] = pinzhi_dic["蓝"] + 1
                        elif pinzhi == "4":
                            pinzhi_dic["紫"] = pinzhi_dic["紫"] + 1
                        elif pinzhi == "5":
                            pinzhi_dic["橙"] = pinzhi_dic["橙"] + 1
                        elif pinzhi == "6":
                            pinzhi_dic["红"] = pinzhi_dic["红"] + 1
                        elif pinzhi == "7":
                            pinzhi_dic["金"] = pinzhi_dic["金"] + 1
                        elif pinzhi == "8":
                            pinzhi_dic["紫金"] = pinzhi_dic["紫金"] + 1
                        else:
                            print("没有对应品质" + pinzhi)
                    # for artifacts_dic in artifacts_dic_list:
                    #     for ii in range(6):
                    #         pinzhi = artifacts_dic[str(1)]
                    #         if pinzhi == "1":
                    #             pinzhi_dic["白"] = pinzhi_dic["白"] + 1
                    #         elif pinzhi == "2":
                    #             pinzhi_dic["绿"] = pinzhi_dic["绿"] + 1
                    #         elif pinzhi == "3":
                    #             pinzhi_dic["蓝"] = pinzhi_dic["蓝"] + 1
                    #         elif pinzhi == "4":
                    #             pinzhi_dic["紫"] = pinzhi_dic["紫"] + 1
                    #         elif pinzhi == "5":
                    #             pinzhi_dic["橙"] = pinzhi_dic["橙"] + 1
                    #         elif pinzhi == "6":
                    #             pinzhi_dic["红"] = pinzhi_dic["红"] + 1
                    #         elif pinzhi == "7":
                    #             pinzhi_dic["金"] = pinzhi_dic["金"] + 1
                    #         elif pinzhi == "8":
                    #             pinzhi_dic["紫金"] = pinzhi_dic["紫金"] + 1
                    #         else:
                    #             print("没有对应品质" + pinzhi)
            else:
                print("次数太少了")
                return ""
        except Exception:
            pass
        print("一共洗练" + str(cishu) + "次")
        print("共洗练出白色属性" + str(pinzhi_dic["白"]) + "次")
        print("共洗练出绿色属性" + str(pinzhi_dic["绿"]) + "次")
        print("共洗练出蓝色属性" + str(pinzhi_dic["蓝"]) + "次")
        print("共洗练出紫色属性" + str(pinzhi_dic["紫"]) + "次")
        print("共洗练出橙色属性" + str(pinzhi_dic["橙"]) + "次")
        print("共洗练出红色属性" + str(pinzhi_dic["红"]) + "次")
        print("共洗练出金色属性" + str(pinzhi_dic["金"]) + "次")
        print("共洗练出紫金色属性" + str(pinzhi_dic["紫金"]) + "次")

    def GM_fengkuang_fujia(self, activity_id, sub_type, cishu):
        """
        富甲天下10连抽，抽完后统计所有奖励的个数
        :param activity_id:  int 活动ID，GM后台配置
        :param sub_type: 1代表金卡池，2表示紫金卡池
        :return:
        """
        add_type, add_value = self.protocol.mri.get_type_id_from_name("角色经验")
        self.protocol.add_resource_pb(add_type, add_value, 99999999)
        if sub_type == 1:
            add_type, add_value = self.protocol.mri.get_type_id_from_name("骰子")
            self.protocol.add_resource_pb(add_type, add_value, cishu * 10)
        if sub_type == 2:
            add_type, add_value = self.protocol.mri.get_type_id_from_name("紫金骰子")
            self.protocol.add_resource_pb(add_type, add_value, cishu * 10)
        resources_dic = {}
        resources_dic["事件"] = 0
        for i in range(cishu):
            award_list, event_num = self.protocol.fujiatianxia_shilian(activity_id, sub_type)
            resources_dic["事件"] = resources_dic["事件"] + event_num
            # 每十次抽奖统计一次
            for award_dic in award_list:
                # 获得道具名
                query_dic = {}
                query_dic['type'] = award_dic['type']
                query_dic['id'] = award_dic['value']
                resources_name = self.protocol.mri.get_name_from_type_id(query_dic)
                name = resources_name + str(award_dic['size'])
                # 把名字和次数一一对应
                if name not in resources_dic.keys():  # 第一次添加，初始化
                    resources_name_dic = {}
                    resources_name_dic["抽到次数"] = 1
                    resources_name_dic["道具名字"] = resources_name
                    resources_name_dic["道具数量"] = award_dic['size']
                    resources_dic[name] = resources_name_dic
                else:
                    resources_dic[name]["抽到次数"] = resources_dic[name]["抽到次数"] + 1
        shuliangtongji_dic = {}
        log_str_z = "抽奖结果："
        for name in resources_dic.keys():
            if name != "事件":
                log_dic = resources_dic[name]
                resources_name = log_dic["道具名字"]
                resources_shuliang = log_dic["道具数量"]
                resources_zongcishu = log_dic["抽到次数"]
                if str(resources_name) in shuliangtongji_dic.keys():
                    shuliangtongji_dic[str(resources_name)] = shuliangtongji_dic[str(resources_name)] + int(
                        resources_shuliang) * int(resources_zongcishu)
                else:
                    shuliangtongji_dic[str(resources_name)] = int(resources_shuliang) * int(resources_zongcishu)
                log_str = "道具：" + str(resources_name) + "，数量：" + str(resources_shuliang) + "，一共抽到：" + str(
                    resources_zongcishu) + "次"
                log_str_z = log_str_z + "\r\n" + log_str
        shijiancishu = "抽到事件" + str(resources_dic["事件"]) + "次"
        tongji_str_z = "统计结果："
        for tongji in shuliangtongji_dic.keys():
            tongji_str_z = tongji_str_z + "\r\n" + tongji + "：" + str(shuliangtongji_dic[tongji]) + "个"
        try:
            new_excel_tab("富甲天下", log_str_z, tongji_str_z, shijiancishu)
        except Exception:
            pass
        return log_str_z, tongji_str_z, shijiancishu

    def GM_World_Chat(self, instruction_str_into):
        """
        向世界频道发送聊天内容，一般用作GM指令
        :param instruction_str_into:
        :return:
        """
        self.protocol.GM_World_Chat(instruction_str_into)

    def GM_new_join_guild(self, Guild_name, num, join=False):
        """
        创建或者加入军团，提升军团等级
        :param Guild_name: 军团名称
        :param num: 提升的军团等级
        :join bool: 加入/创建军团
        :return:
        """
        # 先把消耗的道具加进去

        # 如果是创建军团，就需要加一些道具
        add_type, add_value = self.protocol.mri.get_type_id_from_name("贵族经验")
        self.protocol.add_resource_pb(add_type, add_value, 500000)
        add_type, add_value = self.protocol.mri.get_type_id_from_name("元宝")
        self.protocol.add_resource_pb(add_type, add_value, 200)
        self.protocol.search_Guild(Guild_name)
        self.GM_World_Chat("/set_guild_level " + str(num))

    def taofamojiang(self):
        """
        打讨伐魔将
        :return:
        """
        self.protocol.DemonBoss_UserJoin()
        self.protocol.DemonBoss_ChoseTeam()
        self.protocol.DemonBoss_BeginChallenge()

    def xue_gong_lun_zhan(self):
        """
        学宫论战-进入玩法
        :return:
        """
        # self.Flush_body = self.protocol.Flush("武将")
        # line_up = []
        # for wujiang_id in self.Flush_body.keys():
        #     only_id = self.Flush_body[str(wujiang_id)]
        #     line_up.append(only_id)
        #     line_up.append(0)
        self.protocol.Debate_EnterInfo()  # 进入
        # self.protocol.Debate_LineUp(line_up)
        self.protocol.Debate_LineUp()  # 布阵
        self.protocol.Debate_RefreshMatch()  # 手动匹配
        # print(match_user_index_list)
        is_win = self.protocol.Debate_BattleStart(2)
        if not is_win:
            self.protocol.Debate_BattleStart(0)


    def dongfengxunbao(self,dengji):
        """
        东风寻宝
        :return:
        """
        exp_dic = {20:6230,59:1662490,60:1828280,80:8230080,81:8723680,120:48011290,}
        exp_num = exp_dic[dengji]
        self.protocol.add_resource_pb(1, 1, exp_num)
        open_award_list = self.protocol.GuideWind_Start()#开启奖池
        self.protocol.add_resource_pb(3, 262, 5)
        log_str_z, tongji_str_z, shijiancishu = self.make_ui_log_by_gm(open_award_list)
        log_str_z = log_str_z.replace("抽奖结果：","启阵结果，")
        log_str_z = log_str_z.replace("道具", "启阵道具")
        choujiang_log = log_str_z+"\r\n"
        for i in range(5):
            get_award_list = self.protocol.GuideWind_Draw()#开始抽奖
            log_str_z= self.make_ui_log_by_gm_dongfeng(get_award_list)
            if i == 0:
                choujiang_log = choujiang_log + "第" + str(i + 1) + "次" + log_str_z
            else:
                choujiang_log = choujiang_log+"\r\n"+"第"+str(i+1)+"次"+log_str_z
        return choujiang_log


