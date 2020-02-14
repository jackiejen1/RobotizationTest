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
import threading

from airtest.core.api import *
from MyException import *
from information import Information


class err_resetting(object):
    def __init__(self,func):
        self.info = Information()
        self.func = func
    def __call__(self, *args, **kwargs):
        try:
            a = self.func(*args, **kwargs)
        except NotPocoServeException:
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
            return a
        except NoneException:
            snapshot(msg="找不到控件")
            raise NoneException
        except Exception as e :
            pristr = "报错，游戏" + str(self.info.game_is_running())
            snapshot(msg=pristr)
            raise e


class err_close_game(object):
    def __init__(self,func):
        self.info = Information()
        self.func = func
    def __call__(self, *args, **kwargs):
        try:
            a = self.func(*args, **kwargs)
            return a
        except Exception as e:
            thread_file_name = str(threading.get_ident())
            self.info.remove_option("Phone_Size",thread_file_name)
            # todo 还要删除本地pocolist
            raise e
