#!/usr/bin/env python
# encoding: utf-8
# @Time : 2020/2/11+' '+ 16:21 
# @Author : 姜子牙
# @File : gm_api_http.py 
# @function :
import inspect
import json
import requests

PATH_DICT = {
    "COMMON": '/api/gm',
    'GET_ROLE_ID': '/role_id',
    'ADD_RESOURCES': '/resources/add',
    'SELECT_RESOURCES': '/resources/query',
    'DELETE_RESOURCES': '/resources/delete',
    'QUERY_SERVER_TIME': '/server_time',
    'MOD_SERVER_TIME': '/server_time/mod',
    'SET_CHECKPOINT': '/checkpoint',
    'SET_LEVEL': '/level',
    'RECHARGE_SUPPLEMENT': '/recharge_supplement',
}


class GmApiHttp:
    def __init__(self, host, port='', protocol='http'):
        """
        服务器IP/域名、端口和协议（http/https）
        :param host:ip
        :param port:端口
        :param protocol:协议类型
        """
        self.host = host
        self.port = port
        self.protocol = protocol
        self.url = self.protocol + '://' + self.host
        if self.port != '':
            self.url += ':' + self.port


    def construct_url(self, path_key):
        """
        拼接url
        :param path_key:
        :return:
        """
        url = self.url
        url += PATH_DICT['COMMON']
        path_key = path_key.upper()
        url += PATH_DICT[path_key]
        return url

    def __do_http_get(self, path_key, params=None):
        """
        发送get请求
        :param path_key:
        :param params:
        :return:
        """
        path_key = path_key.upper()
        url = self.construct_url(path_key)
        r = requests.get(url, params)
        url = r.url
        data_json = r.json()
        print('http get url : ' + url)
        if r.status_code!=200:
            print('http get status_code : ' + str(r.status_code))
        return data_json

    def __do_http_post(self, path_key, data=None):
        """
        发送post请求
        :param path_key:
        :param data:
        :return:
        """
        url = self.construct_url(path_key)
        # r = requests.post(url, json=data)
        # data_json = r.json(encoding = "utf-8")
        print('http post url : ' + url)
        print('http post data :' + json.dumps(data))
        response = requests.request("POST", url, data=data)
        try:
            data_json = response.json()
            print(data_json)
        except Exception:
            print(response.text.encode('utf8'))
            raise Exception
        print('http post status_code : ' + str(response.status_code))
        return data_json

    def get_role_id(self, payload):
        """
        查询角色ID
        :param payload: dic
        :return: dic
        """
        path_key = inspect.stack()[0][3]
        data = self.__do_http_post(path_key, data=payload)
        return data

    def add_resources(self, body):
        """
        添加资源
        :param data: dic
        :return: dic
        """
        path_key = inspect.stack()[0][3]
        data = self.__do_http_post(path_key, data=body)
        return data

    def select_resources(self, body):
        """
        查询资源
        :param data: dic
        :return: dic
        """
        path_key = inspect.stack()[0][3]
        data = self.__do_http_post(path_key, data=body)
        return data

    def delete_resources(self, body):
        """
        删除资源
        :param data: dic
        :return: dic
        """
        path_key = inspect.stack()[0][3]
        data = self.__do_http_post(path_key, data=body)
        return data

    def set_level(self, body):
        """
        设置等级
        :param body: dic
        :return: dic
        """
        path_key = inspect.stack()[0][3]
        data = self.__do_http_post(path_key, data=body)
        return data

    def recharge_supplement(self, body):
        """
        充值补单
        :param body: dic
        :return: dic
        """
        path_key = inspect.stack()[0][3]
        data = self.__do_http_post(path_key, data=body)
        return data
