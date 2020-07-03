# coding=utf-8
# 1.先设置编码，utf-8可支持中英文，如上，一般放在第一行
# 2.注释：包括记录创建时间，创建人，项目名称。
'''
和夜神模拟器建立连接，打开传入的app
获取包Activity：打开需要获取的APP，adb shell dumpsys window | findstr mCurrenFocus
项目名称：少三2
创建人：洞洞
创建时间：2019/08/09
'''
# 3.导入模块
from appium import webdriver
import time
class LinkSimulator :
    def __init__(self,apppackage,appactivity,platformVersion):
        """
        Args:
            apppackage: 包名
            appactivity: 包Activity
            platformVersion: 安卓版本
        """
        self.apppackage = apppackage;
        self.appactivity = appactivity;
        self.platformVersion = platformVersion;

    def goRun(self):
        """
        建立连接并打开软件，之后需要跟上后续操作
        Returns:driver对象，后续使用该对象
        """
        desired_caps = {}
        desired_caps['platformName'] = 'Android'  # android的apk还是IOS的ipa
        desired_caps['platformVersion'] = self.platformVersion # android系统的版本号
        desired_caps['deviceName'] = '127.0.0.1:62001'  # 手机设备名称，通过adb devices 查看
        desired_caps['appPackage'] = self.apppackage  # apk的包名
        desired_caps['appActivity'] = self.appactivity  # apk的launcherActivity
        desired_caps["noReset"] = "true"
        # desired_caps['unicodeKeyboard'] = True #使用unicodeKeyboard的编码方式来发送字符串
        # desired_caps['resetKeyboard'] = True #将键盘给隐藏起来
        driver = webdriver.Remote('http://127.0.0.1:4723/wd/hub', desired_caps)
        time.sleep(5)

        return driver;
