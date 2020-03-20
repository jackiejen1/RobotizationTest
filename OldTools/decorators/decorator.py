# _*_coding:utf-8 _*_
#!/usr/bin/python3
#Reference:********************************
# encoding: utf-8
#@Time: 2019/12/31  15:48
#@Author: 洞洞
#@File: decorators.py
#@Function:
#@Method:
#Reference:********************************
from airtest.core.api import *
from poco.exceptions import PocoNoSuchNodeException
from poco.utils.simplerpc.simplerpc import *
using("Tools")
# from get_info.information import *
from Tools.get_info.information import *


class err_resetting(object):
    def __init__(self,func):
        self.info = Information()
        self.func = func
    def __call__(self, *args, **kwargs):
        try:
            a = self.func(*args, **kwargs)
        except RpcTimeoutError:
            pristr = "poco断开，游戏" + str(self.info.game_is_running())
            if not self.info.game_is_running():
                game_name = self.info.get_config("App_Name", "game_name")
                start_app(game_name)
                sleep(2)
                snapshot(msg=pristr)
            snapshot(msg=pristr)
            # self.poco = StdPoco()  # todo 看看游戏poco服重启时候是否OK
            # self.set_poco(self.poco)
            a = self.func(*args, **kwargs)
        except PocoNoSuchNodeException:
            snapshot(msg="找不到控件")
            raise PocoNoSuchNodeException
        except Exception:
            pristr = "报错，游戏" + str(self.info.game_is_running())
            snapshot(msg=pristr)
            raise Exception
        return a
