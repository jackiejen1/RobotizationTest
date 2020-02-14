#!/usr/bin/env python
# encoding: utf-8
# @Time : 2020/2/12+' '+ 11:50 
# @Author : 洞洞
# @File : gm_method.py 
# @function :
from information import Information
from gm_api_http import GmApiHttp
from make_resource_info import MakeResourceInfo
import time

class GmMethod:
    def __init__(self, game_name, server):
        """
        根据游戏名字和服务器确定账号
        :param game: 游戏名字
        :param server: 服务器名字
        """
        self.info = Information()
        # 账号 考虑直接生成，不去取，或者放到以线程名的列表
        self.account = self.info.get_config("Account_Number", "new_game_account")
        # 区服ID
        self.server_id = self.info.get_config("Server_Id", server)
        self.host = self.info.get_config("Server_Host", game_name)
        # 角色名
        self.role_name = self.info.get_config(self.account, server)
        self.gah = GmApiHttp(self.host)
        # 角色ID
        self.role_id = self.gah.get_role_id({"account": self.account, "server": self.server_id, "role": self.role_name})
        self.mri = MakeResourceInfo(game_name)

    def add_resources(self, resource_name_dic):
        """
        根据传入的道具列表添加道具
        :param resource_name_dic:{"道具名":道具数量,"道具名2":道具数量，"道具名3":道具数量}
        :return:
        """
        data_list = []
        resource_name_list = resource_name_dic.keys()
        for resource_name in resource_name_list:
            resource_num = resource_name_dic[resource_name]
            data_value = self.mri.get_data_addordel(resource_name, resource_num)
            data_list.append(data_value)
        body = {"account": self.account, "role_id": self.role_id, "sever": self.server_id, "data": data_list}
        log_dic = self.gah.add_resources(body)
        operation_description = "添加道具" + str(resource_name_list)
        self.dispose_log(operation_description, log_dic)

    def select_resources(self, resource_name_list):
        """
        根据传入的道具列表查询道具数量
        :param resource_name_list:["道具名","道具名2"，"道具名3"]
        :return:{"道具名":道具数量,"道具名2":道具数量，"道具名3":道具数量}
        """
        data_list = []
        for resource_name in resource_name_list:
            data_dic = self.mri.get_data_select(resource_name)
            data_list.append(data_dic)
        body = {"account": self.account, "role_id": self.role_id, "sever": self.server_id, "data": data_list}
        log_dic = self.gah.select_resources(body)
        operation_description = "查询道具" + str(resource_name_list)
        self.dispose_log(operation_description, log_dic)
        resource_num_dic = {}
        # 解析返回值中的data列表
        if "data" in log_dic.keys():
            data_dic_list = log_dic["data"]
            for data_dic in data_dic_list:
                select_resource_dic = {}
                select_resource_dic["type"] = data_dic["type"]
                select_resource_dic["id"] = data_dic["id"]
                # 根据type和id查询道具的名字
                resource_name_select = self.mri.get_data_select(select_resource_dic)
                resource_num = data_dic["num"]
                # 合成{"道具名":道具数量}
                resource_num_dic[resource_name_select] = resource_num
            return resource_num_dic
        else:
            print("没有查到道具数量信息")
            raise Exception

    def delete_resources(self, resource_name_dic):
        """
        根据传入的道具列表删除对应数量的道具
        :param resource_name_dic:{"道具名":道具数量,"道具名2":道具数量，"道具名3":道具数量}
        :return:
        """
        data_list = []
        resource_name_list = resource_name_dic.keys()
        for resource_name in resource_name_list:
            resource_num = resource_name_dic[resource_name]
            data_value = self.mri.get_data_addordel(resource_name, resource_num)
            data_list.append(data_value)
        body = {"account": self.account, "role_id": self.role_id, "sever": self.server_id, "data": data_list}
        log_dic = self.gah.delete_resources(body)
        operation_description = "删除道具" + str(resource_name_list)
        self.dispose_log(operation_description, log_dic)

    def select_server_time(self, server_name):
        """
        查询服务器时间
        :param server_name:str 服务器名
        :return:[int(ymd),int(hms),int(week)]
        """
        server_id = self.info.get_config("Game_ServerId_List", server_name)
        log_dic = self.gah.select_server_time(server_id)
        self.dispose_log("查询服务器时间", log_dic)
        if "data" in log_dic.keys():
            data_dic = log_dic["data"]
            time_stamp = data_dic["timestamp"]
            str_time_list = self.info.get_time_str(time_stamp)
            return str_time_list
        else:
            print("没有查到服务器时间")
            raise Exception

    def set_server_time(self, server_time_dic):
        """
        修改服务器时间
        :param server_time_dic:{"服务器名":时间戳}
        :return:
        """
        server_name_list = server_time_dic.keys()
        server_name = server_name_list[0]
        server_id = self.info.get_config("Game_ServerId_List", server_name)
        server_id_dic = {}
        server_id_dic["server"] = server_id
        server_id_dic["timestamp"] = server_time_dic[server_name]
        log_dic = self.gah.set_server_time(server_id_dic)
        self.dispose_log("修改服务器时间", log_dic)

    def set_checkpoint(self, checkpoint):
        """
        设置通关关卡数
        :param checkpoint:int 关卡数量
        :return:
        """
        role_dic = {}
        role_dic["account"] = self.account
        role_dic["role_id"] = self.role_id
        role_dic["server"] = self.server_id
        role_dic["checkpoint"] = checkpoint
        log_dic = self.gah.set_checkpoint(role_dic)
        self.dispose_log("设置关卡数", log_dic)

    def set_level(self, level):
        """
        设置玩家等级
        :param level:int 玩家等级
        :return:
        """
        role_dic = {}
        role_dic["account"] = self.account
        role_dic["role_id"] = self.role_id
        role_dic["server"] = self.server_id
        role_dic["checkpoint"] = level
        log_dic = self.gah.set_checkpoint(role_dic)
        self.dispose_log("设置等级", log_dic)

    def recharge_supplement(self, resource_name):
        """
        充值补单
        :param resource_name:"道具名"
        :return:
        """
        this_time = time.time()
        order_num = int(this_time/10000)
        data_value = self.mri.get_data_select_money(resource_name)  # todo 需要确定充值类型的字段
        body = {"account": self.account,
                "role_id": self.role_id,
                "sever": self.server_id,
                "order_num": order_num,
                "time": this_time,
                "type": data_value["type"],
                "amount": data_value["id"],
                "num": data_value["num"],#todo 金额
                }
        log_dic = self.gah.recharge_supplement(body)
        operation_description = "充值补单" + resource_name
        self.dispose_log(operation_description, log_dic)
        if "data" in log_dic.keys():
            data_dic = log_dic["data"]
            recharge_amount = data_dic["amount"]
            return recharge_amount
        else:
            print("没有查到充值总金额")
            raise Exception

    def dispose_log(self, operation_description, log_dic):
        """
        根据返回值判断操作是否成功，并添加到报告中
        :param operation_description:str 操作步骤
        :param log_dic:dic 返回值
        :return:
        """
        code = log_dic["code"]
        message = log_dic["message"]
        if code == "":  # todo 返回码
            description = "成功"
            print(operation_description + description)  # todo 加入报告中
        else:
            description = "失败"
            print(operation_description + description + "原因：" + message)
            raise Exception("操作失败，退出")
