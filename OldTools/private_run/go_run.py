# _*_coding:utf-8 _*_
# !/usr/bin/python3
# Reference:********************************
# encoding: utf-8
# @Time: 2020/1/6  10:55
# @Author: 洞洞
# @File: go_run.py
# @Function:
# @Method:
# Reference:********************************
import os
import yaml

from Tools.private_run.my_run_case import MyRunCase

if __name__ == '__main__':
    mrc = MyRunCase()
    obj_path = os.path.abspath(os.path.dirname(os.path.dirname(os.path.dirname(__file__))))
    yml_path = obj_path + "\case.yml"
    print(yml_path)
    with open(yml_path, 'r', encoding='utf-8') as f:
        cases_dic = yaml.safe_load(f)
        case_list_run = cases_dic["run_cases"]
        case_list_def = cases_dic["defeated_cases"]
        if case_list_run != None and len(case_list_run) > 0:
            case = case_list_run[0]
            del cases_dic["run_cases"][0]
        elif (case_list_run != None and len(case_list_run) <= 0) and (case_list_def != None and len(case_list_def) > 0):
            case = case_list_def[0]
            del cases_dic["defeated_cases"][0]
    # 如果脚本跑完之后再写入，可能会无限跑
    with open(yml_path, 'w', encoding='utf-8') as f:
        yaml.safe_dump(cases_dic, f)
    # 传入的是项名称
    mrc.run_case(case)
