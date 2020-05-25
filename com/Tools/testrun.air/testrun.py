# -*- encoding=utf8 -*-
import threading

__author__ = "v.lidd"
__title__ = '海外闪退检测'
__desc__ = """ 1.
               2.

                """

from airtest.core.api import *

auto_setup(__file__)
from MyPoco.my_poco import MyPoco

class myThread(threading.Thread):
    def __init__(self, threadID, name, phone_name, game_name,list_input):
        threading.Thread.__init__(self)
        self.threadID = threadID
        self.name = name
        self.counter = phone_name
        self.game_name = game_name
        self.list_input =list_input

    def run(self):
        for i in range(100):
            """
            少三2台湾16 = com.zenjc.test0
            少三2台湾 = com.youzu.ss2game.test
            少三2国内 = com.youzu.ss2game.android
            """
            if self.game_name=="com.zenjc.test0":
                poco_name ="少三2台湾16"
            elif self.game_name=="com.youzu.ss2game.test":
                poco_name="少三2台湾"
            elif self.game_name=="com.youzu.ss2game.android":
                poco_name="少三2国内"
            else:
                print("请修改快捷方式同目录MyPoco\info_tab\config.ini——section")
                raise Exception
            my_poco = MyPoco(poco_name, self.counter)
            stop_app(self.game_name)
            time.sleep(2)
            start_app(self.game_name)  # 启动游戏
            time.sleep(9)
            my_poco.my_touch_pos([0.4829059829059829, 0.43333333333333335])  # 初始化点击
            my_poco.my_touch_pos([0.49675480759708, 0.8109375])  # 唤起登录界面
            my_poco.my_touch_pos([0.4829059829059829, 0.7074074074074074])  # adk   login
            time.sleep(2)
            # [0.82524035014344, 0.11953125]
            #     my_poco.my_touch_pos([0.49963942306634, 0.4640625])#登录点击
            #     account = my_poco.get_random_account()
            #     text(str(account))
            #     my_poco.my_touch_pos([0.5, 0.61796875])#账号确认
            if my_poco.game_is_die():
                my_poco.add_msg_in_log("login时闪退了")
            else:
                my_poco.my_touch_pos(self.list_input)  # 关闭广告
                my_poco.my_touch_pos([0.49675480759708, 0.8109375])  # 开始游戏
                time.sleep(5)
                if my_poco.game_is_die():
                    my_poco.add_msg_in_log("开始游戏闪退了")
                    # raise Exception
                time.sleep(2)
                stop_app(self.game_name)
                time.sleep(2)

__phone_id__1 = "5f93611f"
__phone_id__2 = ""
game_name="com.zenjc.test0"#看看是哪个包
game_name="com.youzu.ss2game.test"#看看是哪个包
# game_name = "com.youzu.ss2game.android"#看看是哪个包
list_input1 = [0.82524035014344, 0.11953125]#分辨率适配
list_input2 =[0.89638669984881, 0.11953125]#分辨率适配
thread1 = myThread(1, "Thread-1", __phone_id__1, game_name,list_input1)
thread2 = myThread(2, "Thread-2", __phone_id__2, game_name,list_input1)
# 开启新线程
# thread1.start()
thread2.start()
# thread1.join()
thread2.join()
print("退出主线程")
