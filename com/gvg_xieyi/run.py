#coding=utf-8
'''
Created on 2020年6月26日

@author: hexq
'''
import os
# os.system("locust --no-web -c 570 -r 50 -t 30m -f NvShen3Robot.py")

os.system("locust --no-web -c 230 -r 5 -t 12m -f gvg_function.py --logfile log.txt")


# -c  总人数 todo 看这里，上面那个-c后面的100，就是要跑多少人，比如你创建了12个军团，就是12*48人 就输入576
# -r 启动速度 其他的不用管
# -t  执行时间
# -f 你要跑的脚本


