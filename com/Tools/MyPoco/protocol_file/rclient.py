# -*- coding: utf-8 -*-
# @Time    : 2018/7/23 17:56
# @Author  : liaozhj
# @FileName: rclient.py
# @Software: PyCharm
from redis import Redis


# 从服务器读取账号
# 具体使用时，需要设置 redis 服务器地址

def getuserid():
    # r = Redis(host='172.25.48.95', decode_responses=True)
    r = Redis(host='10.18.98.136', password='username_redis', decode_responses=True)
    userid = r.lpop('wen')
    print(r.llen('wen'))
    print(userid)
    return userid


if __name__ == '__main__':
    getuserid()
