# _*_coding:utf-8 _*_
#!/usr/bin/python3
#Reference:********************************
# encoding: utf-8
#@Time: 2020/8/25  15:01
#@Author: 洞洞
#@File: shaoxi_proto_test.py
#@Function:
#@Method:
#Reference:********************************
import time

import requests

from gm.gm_method import GmMethod
from proto_tool.proto_method import ProtocolFunction

if __name__ == '__main__':
    account = str(int(time.time()))[-6:]
    server_name="QA2"
    pr = ProtocolFunction(server_name,account)
    gm = pr.Login()
    gm.add_resources({"元宝":1})
    #神将

        # 升魂（除主角）
        # 觉醒
        # 吞噬
        # 悟道
        # 炼魂
        # 修行（限主角）
        # 经脉（限主角）
        # 涅槃（限主角）

    #法宝
        # 升级
        # 觉醒
        # 化灵
        # 铸魂
        # 炼器
        # 锻魄（限赤金及以上品质）
        # 封灵（限主角）

    #仙灵
        # 图腾护佑
        # 仙灵图鉴
        # 轮回孵化
        # 五行炼体
        # 八卦通神

    #神器
        # 升级
        # 升星

    #星君
        # 升星
        # 星格
        # 图鉴突破

    #神符
        # 强化
        # 进阶
        # 镶嵌
        # 护阵
        # 图鉴突破

    #法术
        # 强化
        # 升星
        # 增幅
        # 辅修
        # 奇门

    #神兽
        # 升级
        # 渡劫
        # 通神
        # 吞噬
        # 炼魂
        # 化身

    #宝物
        # 升级
        # 精炼
        # 觉醒
        # 淬炼
        # 赤炼

    #神翼
        # 羽化
        # 强化
        # 护阵

    #宝石
        # 合成
        # 凝炼
        # 升华

    #时装
        # 强化

