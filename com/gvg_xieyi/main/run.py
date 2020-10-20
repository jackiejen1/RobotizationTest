#coding=utf-8
'''
Created on 2020年6月26日

@author: hexq
'''
import os
# os.system("locust --no-web -c 500 -r 50 -t 30m -f NvShen3Robot.py")
import time

os.system("locust --no-web -c 90 -r 5 -t 12m -f gvg_function.py --logfile log.txt")


# -c  总人数
# -r 启动速度
# -t  执行时间
# -f 你要跑的脚本


