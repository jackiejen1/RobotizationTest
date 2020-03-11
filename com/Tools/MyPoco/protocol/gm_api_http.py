#!/usr/bin/env python
# encoding: utf-8
# @Time : 2020/2/11+' '+ 16:21 
# @Author : 姜子牙
# @File : gm_api_http.py 
# @function :
import inspect
import json
import requests

# API path definition
PATH_DICT = {
    "PREFIX": {'path': '/api/gm', 'title': 'API PATH公共前缀'},
    'GET_ROLE_ID': {'path': '/role_id', 'title': '获取玩家角色ID'},
    'ADD_RESOURCES': {'path': '/resources/add', 'title': '添加资源'},
    'QUERY_RESOURCES': {'path': '/resources/query', 'title': '查询资源'},
    'DELETE_RESOURCES': {'path': '/resources/delete', 'title': '删除资源'},
    'QUERY_SERVER_TIME': {'path': '/server_time', 'title': '查询游戏区服时间'},
    'MOD_SERVER_TIME': {'path': '/server_time', 'title': '修改游戏区服时间'},
    'SET_CHECKPOINT': {'path': '/checkpoint', 'title': '设置关卡'},
    'SET_LEVEL': {'path': '/level', 'title': '设置玩家角色等级'},
    'RECHARGE_SUPPLEMENT': {'path': '/recharge_supplement', 'title': '充值补单'},
}


class GmApiHttp:
    def __init__(self, host, protocol='http'):
        r"""发送GM API的类.

        :param host: API url中的host，例如"yapi.uuzu.com" or "192.168.58.105:8080"，字符串.
        :param protocol: "http" 或 "https"，字符串.
        """
        self.host = host
        self.protocol = protocol
        self.url = self.protocol + '://' + self.host
        self.prefix = PATH_DICT['PREFIX']['path']

    def __do_http_get(self, path_key, params=None):
        r"""内部方法发送http get 请求.

        :param path_key:PATH_DICT的key，字符串.
        :param params: http get 请求的参数，dict.
        :rtype: http api 返回，为json对象
        """
        path_key = path_key.upper()
        d = PATH_DICT[path_key]
        path = d['path']
        title = d['title']
        url = self.url + self.prefix + path
        r = requests.get(url, params)
        data_json = r.json()
        print(title + ':')
        print('get param :' + json.dumps(params))
        print('status_code : ' + str(r.status_code))
        return data_json

    def __do_http_post(self, path_key, data=None):
        r"""内部方法发送http post 请求.

        :param path_key:PATH_DICT的key，字符串.
        :param data: http post 请求的参数，json对象.
        :rtype: http api 返回，为json对象
        """
        path_key = path_key.upper()
        d = PATH_DICT[path_key]
        path = d['path']
        title = d['title']
        url = self.url + self.prefix + path
        r = requests.post(url, json=data)
        data_json = r.json()
        print(title + ':')
        print('post data :' + json.dumps(data))
        print('status_code : ' + str(r.status_code))
        return data_json

    def set_mock_api(self, mock_url_prefix_path):
        r"""如果要使用mock GM API，需要设置下mock url的path前缀

        :param mock_url_prefix_path: mock url的path前缀，字符串.
        """
        self.prefix = mock_url_prefix_path + self.prefix

    def get_role_id(self, account, server, role):
        r"""获取玩家角色ID

        :param account: 玩家账号，字符串.
        :param role: 玩家角色，字符串.
        :param server: 游戏区服，字符串，如1234567890123456789012345678901234567890123456789012345678901234.
        :rtype: 返回值，类似{"code":0,"data":{"role_id":100},"message":""}
        """
        payload = {
            'account': account,
            'role': role,
            'server': server
        }
        path_key = inspect.stack()[0][3]
        data = self.__do_http_get(path_key, params=payload)
        return data

    def add_resources(self, data):
        r"""添加资源

        :param data: post json数据，类似{"account": "tom", "role_id": 100,
                                       "server": "1234567890123456789012345678901234567890123456789012345678901234",
                                       "data": [{"type": 1, "id": 10, "num": 9}]}
        :rtype: 返回值，类似{"code": 0, "message": ""}
        """
        path_key = inspect.stack()[0][3]
        data = self.__do_http_post(path_key, data=data)
        return data

    def query_resources(self, data):
        r"""查询资源

        :param data: post json数据，类似{"account": "tom", "role_id": 100,
                                       "server": "1234567890123456789012345678901234567890123456789012345678901234",
                                       "data": [{"type": 1, "id": 10}]}
        :rtype: 返回值，类似{"code": 0, "data": [{"type": 0, "id": 1, "num": 1},
                                                {"type": 0, "id": 2, "num": 2}],
                            "message": ""}
        """
        path_key = inspect.stack()[0][3]
        data = self.__do_http_post(path_key, data=data)
        return data

    def delete_resources(self, data):
        r"""删除资源

        :param data: post json数据，类似{"account": "tom", "role_id": 100,
                                       "server": "1234567890123456789012345678901234567890123456789012345678901234",
                                       "data": [{"type": 1, "id": 10, "num": 9}]}
        :rtype: 返回值，类似{"code": 0, "message": ""}
        """
        path_key = inspect.stack()[0][3]
        data = self.__do_http_post(path_key, data=data)
        return data

    def query_server_time(self, server):
        r"""查询游戏区服时间

        :param server: 游戏区服，字符串，如1234567890123456789012345678901234567890123456789012345678901234.
        :rtype: 返回值，类似{"code": 0, "data": {"timestamp": 1579003849}, "message": ""}
        """
        payload = {
            'server': server
        }
        path_key = inspect.stack()[0][3]
        data = self.__do_http_get(path_key, params=payload)
        return data

    def mod_server_time(self, data):
        r"""修改游戏区服时间

        :param data: post json数据，类似{"server": "1234567890123456789012345678901234567890123456789012345678901234",
                                        "timestamp": 1579003849}
        :rtype: 返回值，类似{"code": 0, "message": ""}
        """
        path_key = inspect.stack()[0][3]
        data = self.__do_http_post(path_key, data=data)
        return data

    def set_checkpoint(self, data):
        r"""设置关卡

        :param data: post json数据，类似{"account": "tom", "role_id": 100,
                                        "server": "1234567890123456789012345678901234567890123456789012345678901234",
                                        "checkpoint": 11}
        :rtype: 返回值，类似{"code": 0, "message": ""}
        """
        path_key = inspect.stack()[0][3]
        data = self.__do_http_post(path_key, data=data)
        return data

    def set_level(self, data):
        r"""设置玩家角色等级

        :param data: post json数据，类似{"account": "tom", "role_id": 100,
                                        "server": "1234567890123456789012345678901234567890123456789012345678901234",
                                        "level": 11}
        :rtype: 返回值，类似{"code": 0, "message": ""}
        """
        path_key = inspect.stack()[0][3]
        data = self.__do_http_post(path_key, data=data)
        return data

    def recharge_supplement(self, data):
        r"""充值补单

        :param data: post json数据，类似{"account": "tom", "role_id": 100,
                                        "server": "1234567890123456789012345678901234567890123456789012345678901234",
                                        "order_num": 1122334455, "time": 1579003849, "type": 10, "amount": 1122334455}
        :rtype: 返回值，类似{"code": 0, "data": {"amount": 10000}, "message": ""}
        """
        path_key = inspect.stack()[0][3]
        data = self.__do_http_post(path_key, data=data)
        return data
