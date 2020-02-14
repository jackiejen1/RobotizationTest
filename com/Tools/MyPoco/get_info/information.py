# _*_coding:utf-8 _*_
# !/usr/bin/python3
# Reference:********************************
# encoding: utf-8
# @Time: 2019/11/6  14:58
# @Author: 洞洞
# @File: information.py
# @Function:
# @Method:
# Reference:********************************
import configparser
import datetime
import re
import threading
from airtest.core.api import *
import shutil


class Information:
    def __init__(self):
        self.cf = configparser.ConfigParser()
        # 获取当前文件所在目录的上一级目录，即项目所在目录
        root_dir = os.path.abspath(os.path.dirname(__file__))
        # 拼接得到config.ini文件的路径，直接使用
        self.root_dir_path = root_dir + "\\config.ini"
        self.cf.read(self.root_dir_path)
        self.thread_file_name = str(threading.get_ident())

    def remove_section(self, section_name):
        '''
        删除配置文件中的项
        :param section_name:项名称
        :return:
        '''
        self.cf.remove_section(section_name)
        self.cf.write(open(self.root_dir_path, "w"))



    def remove_option(self, section_name,option_name):
        '''
        删除配置文件中项的指定元素
        :param section_name:项名称
        :return:
        '''
        self.cf.remove_option(section_name,option_name)
        self.cf.write(open(self.root_dir_path, "w"))

    def is_section_exist(self, section_name):
        '''
        判断配置文件中模块是否存在
        :param section_name:模块名称
        :return:True/False
        '''
        sections_list = self.cf.sections()
        if section_name in sections_list:
            return True
        else:
            return False

    def add_section(self, section_name):
        '''
        在配置文件中添加模块
        :param section_name:模块名称
        :return:
        '''
        self.cf.add_section(section_name)
        self.cf.write(open(self.root_dir_path, "w"))

    def get_config(self, list_name, key):
        """
        从配置文件中读取信息
        :param list_name: 模块名
        :param key: key
        :return: value
        """
        value = self.cf.get(list_name, key)
        return value

    def get_options(self, list_name):
        """
        从配置文件中读取模块下所有key
        :param list_name: 模块名
        :return: keys_list
        """
        keys_list = self.cf.options(list_name)
        return keys_list

    def set_config(self, list_name, key, value):
        """
        设置配置文件中模块下key-value
        :param list_name: 模块名
        :param key: key
        :param value: value
        :return:
        """
        self.cf.set(list_name, key, value)
        self.cf.write(open(self.root_dir_path, "w"))
    def get_phone_name(self):
        """
        todo 可以搞一个类，启动的时候自带加载所有信息
        获取手机的名字，主要用于区分高中端机
        :return:
        """
        lines = os.popen("adb devices -l").readlines()
        total = "model"
        for line in lines:
            if re.findall(total, line):
                # 将这一行，按空格分割成一个list
                lis = line.split(" ")
                #         print(lis)
                for li in lis:
                    if re.findall(total, li):
                        li1 = li.split(":")
                        st = li1[1]
                        phone_name = st
                        return phone_name

    def get_phone_size(self):
        """获取手机的宽高，分辨率
        return：list_int[宽，高]
        """
        phone_size_list_int = int(self.get_config("Phone_Size", self.thread_file_name))
        return phone_size_list_int

    def game_is_running(self):
        """
        判断游戏还在不在了，判断是否闪退
        :return:
        """
        sleep(3)
        game_name = self.get_config("App_Name", "game_name")
        islist = os.popen("adb shell pidof " + game_name).readlines()
        if len(islist) == 0:
            is_run = False
        else:
            is_run = True
        return is_run
    def get_time_str(self, str_time_input):
        """
        根据时间戳字符串换算日期和星期
        :param poco_time_input:包含时间戳text的poco对象
        :return: [int(ymd),int(hms),int(week)]
        """
        game_time_int = int(str_time_input)
        dateArray = datetime.datetime.fromtimestamp(game_time_int)
        ymd = dateArray.strftime("%Y%m%d")
        hms = dateArray.strftime("%H%M%S")
        week = dateArray.strptime(ymd, "%Y%m%d").weekday()
        return [int(ymd), int(hms[:-2]), int(week) + 1]

    def remove_file(self,file_path):
        if os.path.isdir(file_path):  # 判断该文件是否为文件夹
            shutil.rmtree(file_path)  # 若为文件夹，则直接删除
        elif os.path.isfile(file_path):# 判断该文件是否为文件
            pass
