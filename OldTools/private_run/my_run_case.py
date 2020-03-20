# _*_coding:utf-8 _*_
# !/usr/bin/python3
# Reference:********************************
# encoding: utf-8
# @Time: 2019/12/18  15:34
# @Author: 洞洞
# @File: my_run_case.py
# @Function:
# @Method:
# Reference:********************************
import _thread
import os
import shutil

import yaml, json
from airtest.core.api import *
from airtest.core.android.adb import *
from airtest.cli.info import get_script_info

using("Tools")
from get_info.information import Information
import threading

# from Tools.get_info.information import Information


class MyRunCase:
    def __init__(self):
        self.info = Information()

    def make_config_list(self):
        # 获取新鲜的设备列表
        phone_list_devices = ADB().devices()
        self.phone_id_list = []
        # 创建手机设备列表
        if self.info.is_section_exist("Phone_List"):
            self.info.remove_section("Phone_List")
        self.info.add_section("Phone_List")
        if self.info.is_section_exist("Case_defeated__List"):
            self.info.remove_section("Case_defeated__List")
        self.info.add_section("Case_defeated__List")
        if self.info.is_section_exist("Http_path_list"):
            self.info.remove_section("Http_path_list")
        self.info.add_section("Http_path_list")
        if self.info.is_section_exist("Html_path_name_dic"):
            self.info.remove_section("Html_path_name_dic")
        self.info.add_section("Html_path_name_dic")
        for phone in phone_list_devices:
            phone_id = phone[0]
            if phone[1] == 'device':
                self.phone_id_list.append(phone_id)
        # 把所有的设备放到info表里面
        for phone_id in self.phone_id_list:
            self.info.set_config("Phone_List", phone_id, "None")

    def run_case(self, test_cases_name):

        # airtest report auto_ui/got/test_ch1.air --export ${reportDir}
        # 获取yaml文件的路径
        obj_path = os.path.abspath(os.path.dirname(os.path.dirname(os.path.dirname(__file__))))
        yml_path = obj_path + "\case.yml"
        print(yml_path)
        with open(yml_path, 'r', encoding='utf-8') as f:
            cases = yaml.load(f)
        air_case_path_list = []
        case_name_dic = {}
        for case_name in cases[test_cases_name]:
            # 拼接yaml下case的路径
            air_case_path = obj_path + '\\' + case_name + ".air"
            case_name_dic[air_case_path] = case_name
            air_case_path_list.append(air_case_path)
        run_phone_id = ""
        # 根据当前手机列表，查找配置文件中空闲状态的手机
        for phone_id in self.phone_id_list:
            phone_status = self.info.get_config("Phone_List", phone_id)
            if phone_status == "None":
                run_phone_id = phone_id
                break
        # 运行开始时设置设备状态
        self.info.set_config("Phone_List", run_phone_id, "Runing")
        # 存放Htlm报告的目录

        name = ""
        defeated_case_list = []
        # 按顺序执行case.yml中的用例
        for i in range(len(air_case_path_list)):
            case_run_path = air_case_path_list[i]
            cmd_run_case = "airtest run " + case_run_path + " --device Android://127.0.0.1:5037:" + run_phone_id + " --log"
            proc = subprocess.Popen(cmd_run_case, shell=True, stdout=subprocess.PIPE)
            print(proc.communicate()[0])  # 从线程中获取值
            code = proc.returncode
            if code == 0:
                color = "blue"
                is_success_str = "成功"
            else:
                color = "red"
                # 很蛋疼，没有预留单独的case_name,只能先这样
                for case_name in cases[test_cases_name]:
                    if case_name in case_run_path:
                        defeated_case_list.append(case_name)
                is_success_str = "失败"
                self.info.set_config("Case_defeated__List", case_name_dic[case_run_path], is_success_str)
            static_root = "https://ep.yoozoo.com/public/static/airtest"
            cmd_make_html = "airtest report " + case_run_path + " --export " + case_run_path + " --static_root " + static_root + " --lang zh"
            # 执行完用例之后生成报告
            subprocess.Popen(cmd_make_html, shell=True, stdout=subprocess.PIPE)
            if case_run_path != "":
                info = json.loads(get_script_info(case_run_path), encoding='utf-8')
                name = info.get('title')
                if len(name) == 0:
                    name = case_name_dic[case_run_path]
            html_path = case_run_path
            case_air_log_name = case_name_dic[case_run_path] + ".log"  # 日志文件夹的名称
            # html_path_name_dic[name] = [html_path,case_air_log_name,case_name_dic[case_run_path]]
            self.info.set_config("Html_path_name_dic", name,
                                 str([html_path, case_air_log_name, case_name_dic[case_run_path]]))
            my_html_file_path_new = self.info.get_config("HtlmPath", "log_path")
            html_path = my_html_file_path_new + "/" + case_name_dic[case_run_path] + ".log" + "/log.html"
            self.bodys = '''<div><body><a href="''' + html_path + '''">''' + name + is_success_str + '''</a></body></div>'''
            self.info.set_config("Http_path_list", case_name_dic[case_run_path], self.bodys)
        # 把失败的项写入yml中
        with open(yml_path, 'w', encoding='utf-8') as f:
            cases["defeated_cases"] = defeated_case_list
            yaml.safe_dump(cases, f)

        self.info.set_config("Phone_List", run_phone_id, "None")  # 运行结束后把设备状态改回来
        # self.make_html(html_path_name_dic)
        # os.system(r"airtest run D:\yoozoo_gitlab\autotest\sanguohero2\teat_ss2.air --device Android://127.0.0.1:5037:e42eb94e --log")
        # os.system(r"airtest report D:\yoozoo_gitlab\autotest\sanguohero2\teat_ss2.air  --export D:\yoozoo_gitlab\autotest\sanguohero2\teat_ss2.air  --static_root https://ep.yoozoo.com/public/static/airtest --lang zh")

    def make_html(self):
        """

        :param html_path_name_dic:[运行脚本的路径.air，脚本名称.air.脚本名称log,脚本名称]
        :return:
        """
        html_path_name_dic = {}
        cof_keys = self.info.get_options("Http_path_list")
        for key in cof_keys:
            dic_value = self.info.get_config("Http_path_list", key)
            html_path_name_dic[key] = eval(dic_value)
        log_html_path = self.info.get_config("HtlmPath", "log_path")
        bodys = ""
        for key in cof_keys:
            body_name = html_path_name_dic[key][2]
            body = self.info.get_config("Http_path_list", body_name)
            bodys = bodys + body
            my_html_file_path_old = log_html_path + "\\" + html_path_name_dic[key][1]
            case_run_file_path = html_path_name_dic[key][0] + "\\" + html_path_name_dic[key][1]
            case_run_file_path_log = html_path_name_dic[key][0] + "\\log"
            my_html_file_path_new = log_html_path
            # 删除之前遗留的旧文件夹
            if os.path.isdir(my_html_file_path_old):  # 判断该文件是否为文件夹
                shutil.rmtree(my_html_file_path_old)  # 若为文件夹，则直接删除
            # 删除遗留的log文件
            if os.path.isdir(case_run_file_path_log):  # 判断该文件是否为文件夹
                shutil.rmtree(case_run_file_path_log)  # 若为文件夹，则直接删除
            sleep(2)
            shutil.move(case_run_file_path, my_html_file_path_new)

            # if is_success:
            #     color_name = "blue"# todo 颜色
            #     is_success_str = "run_success"
            # else:
            #     color_name = "red"
            #     is_success_str = "run_defeated"
            # html_path =my_html_file_path_new +"/"+html_path_name_dic[key][3]+".log"+ "/log.html"
            # bodys = bodys + '''<div><body><a href="''' + html_path + '''"class="''' + color_name + '''">''' + name + is_success_str + '''</a></body></div>'''

        html_txt = '''<!DOCTYPE html><html lang="en"><head><meta charset="UTF-8"><title>测试报告</title><style type="text/css">
        a:link{color:red;}
        a:visited { color:#00FF00; text-decoration:none; }
        a:hover { color:#000000; text-decoration:none; }
        a:active { color:#FFFFFF;}
        </style><base target="_blank"></head>
        ''' + bodys + '''</html>'''

        my_html_path = log_html_path + "\index.html"
        # my_html_path = r"C:\Users\v.lidd\Desktop\测试报告.html"
        with open(my_html_path, 'w+', encoding='utf-8') as f:
            f.write(html_txt)
