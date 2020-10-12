#coding=utf-8
'''
Created on 2020年6月26日

@author: hexq
'''
import os
# os.system("locust --no-web -c 500 -r 50 -t 30m -f NvShen3Robot.py")
os.system("locust --no-web -c 1000 -r 50 -t 60m -f locust_test.py --logfile log.txt")


# -c  总人数
# -r 启动速度
# -t  执行时间
# -f 你要跑的脚本


