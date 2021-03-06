# -*- coding: utf-8 -*-

import ast
import os
import sys
import threading
import time

from PyQt5 import QtCore, QtWidgets
from PyQt5.QtCore import QDir

from MyPoco.my_poco import MyPoco


class Ui_Dialog(object):
    def __init__(self):
        pass

    def setupUi(self, Dialog):
        self.my_poco = None
        Dialog.setObjectName("Dialog")
        Dialog.resize(933, 610)
        self.verticalGroupBox_2 = QtWidgets.QGroupBox(Dialog)
        self.verticalGroupBox_2.setGeometry(QtCore.QRect(0, 360, 921, 241))
        self.verticalGroupBox_2.setObjectName("verticalGroupBox_2")
        self.verticalLayout_2 = QtWidgets.QVBoxLayout(self.verticalGroupBox_2)
        self.verticalLayout_2.setObjectName("verticalLayout_2")
        self.verticalLayout = QtWidgets.QVBoxLayout()
        self.verticalLayout.setObjectName("verticalLayout")
        self.jindutiao = QtWidgets.QProgressBar(self.verticalGroupBox_2)
        self.jindutiao.setProperty("value", 0)
        self.jindutiao.setObjectName("jindutiao")
        self.verticalLayout.addWidget(self.jindutiao)
        self.logtext = QtWidgets.QTextBrowser(self.verticalGroupBox_2)
        self.logtext.setObjectName("logtext")
        self.verticalLayout.addWidget(self.logtext)
        self.verticalLayout_2.addLayout(self.verticalLayout)
        self.groupBox_6 = QtWidgets.QGroupBox(Dialog)
        self.groupBox_6.setGeometry(QtCore.QRect(0, 0, 931, 361))
        self.groupBox_6.setObjectName("groupBox_6")
        self.tool = QtWidgets.QToolBox(self.groupBox_6)
        self.tool.setGeometry(QtCore.QRect(0, 70, 911, 261))
        self.tool.setObjectName("tool")
        self.page_8 = QtWidgets.QWidget()
        self.page_8.setGeometry(QtCore.QRect(0, 0, 911, 209))
        self.page_8.setObjectName("page_8")
        self.groupBox_2 = QtWidgets.QGroupBox(self.page_8)
        self.groupBox_2.setGeometry(QtCore.QRect(10, 40, 901, 161))
        self.groupBox_2.setObjectName("groupBox_2")
        self.groupBox = QtWidgets.QGroupBox(self.groupBox_2)
        self.groupBox.setGeometry(QtCore.QRect(160, 10, 301, 141))
        self.groupBox.setObjectName("groupBox")
        self.input_account = QtWidgets.QLineEdit(self.groupBox)
        self.input_account.setGeometry(QtCore.QRect(10, 20, 201, 31))
        self.input_account.setObjectName("input_account")
        self.is_random = QtWidgets.QRadioButton(self.groupBox)
        self.is_random.setGeometry(QtCore.QRect(20, 60, 100, 16))
        self.is_random.setObjectName("is_random")
        self.sever_name = QtWidgets.QComboBox(self.groupBox)
        self.sever_name.setGeometry(QtCore.QRect(10, 80, 201, 31))
        self.sever_name.setObjectName("sever_name")
        self.sever_name.addItem('请选择')
        self.sever_name.addItem('QA1')
        self.sever_name.addItem('QA2')
        self.sever_name.addItem('QA3')
        self.sever_name.addItem('QA4')
        self.sever_name.addItem('QA5')
        self.sever_name.addItem('QA6')
        self.sever_name.addItem('QA7')
        self.sever_name.addItem('QA8')
        self.sever_name.addItem('新QA1')
        self.sever_name.addItem('新QA2')
        self.sever_name.addItem('新QA3')
        self.sever_name.addItem('新QA4')
        self.sever_name.addItem('新QA5')
        self.input_account_text = QtWidgets.QLabel(self.groupBox)
        self.input_account_text.setGeometry(QtCore.QRect(220, 30, 54, 12))
        self.input_account_text.setObjectName("input_account_text")
        self.sever_name_text = QtWidgets.QLabel(self.groupBox)
        self.sever_name_text.setGeometry(QtCore.QRect(220, 80, 130, 20))
        self.sever_name_text.setObjectName("sever_name_text")
        self.groupBox_3 = QtWidgets.QGroupBox(self.groupBox_2)
        self.groupBox_3.setGeometry(QtCore.QRect(0, 0, 161, 151))
        self.groupBox_3.setObjectName("groupBox_3")
        self.account_type = QtWidgets.QComboBox(self.groupBox_3)
        self.account_type.setGeometry(QtCore.QRect(10, 50, 140, 31))
        self.account_type.setObjectName("account_type")
        self.account_type.addItem('请选择创建账号类型')
        self.account_type.addItem('已有账号')
        self.account_type.addItem('手动指定')
        # self.account_type.addItem('V1')
        # self.account_type.addItem('V2')
        # self.new_account_2 = QtWidgets.QToolBox(self.groupBox_3)
        # self.new_account_2.setGeometry(QtCore.QRect(0, 10, 161, 131))
        # self.new_account_2.setObjectName("new_account_2")
        # self.page_5 = QtWidgets.QWidget()
        # self.page_5.setGeometry(QtCore.QRect(0, 0, 161, 53))
        # self.page_5.setObjectName("page_5")
        # self.set_account = QtWidgets.QRadioButton(self.page_5)
        # self.set_account.setGeometry(QtCore.QRect(20, 10, 89, 16))
        # self.set_account.setObjectName("set_account")
        # self.new_account_2.addItem(self.page_5, "")
        # self.page_6 = QtWidgets.QWidget()
        # self.page_6.setGeometry(QtCore.QRect(0, 0, 161, 53))
        # self.page_6.setObjectName("page_6")
        # self.account_v1 = QtWidgets.QRadioButton(self.page_6)
        # self.account_v1.setGeometry(QtCore.QRect(20, 10, 89, 16))
        # self.account_v1.setObjectName("account_v1")
        # self.new_account_2.addItem(self.page_6, "")
        # self.page_9 = QtWidgets.QWidget()
        # self.page_9.setObjectName("page_9")
        # self.account_v2 = QtWidgets.QRadioButton(self.page_9)
        # self.account_v2.setGeometry(QtCore.QRect(20, 10, 89, 16))
        # self.account_v2.setObjectName("account_v2")
        # self.new_account_2.addItem(self.page_9, "")
        self.groupBox_4 = QtWidgets.QGroupBox(self.groupBox_2)
        self.groupBox_4.setGeometry(QtCore.QRect(460, 10, 431, 141))
        self.groupBox_4.setObjectName("groupBox_4")
        self.resource_dic = QtWidgets.QTextEdit(self.groupBox_4)
        self.resource_dic.setGeometry(QtCore.QRect(0, 33, 351, 101))
        self.resource_dic.setObjectName("resource_dic")
        self.resource_text = QtWidgets.QLabel(self.groupBox_4)
        self.resource_text.setGeometry(QtCore.QRect(10, 10, 330, 20))
        self.resource_text.setObjectName("resource_text")
        self.pushnew_account = QtWidgets.QPushButton(self.groupBox_4)
        self.pushnew_account.setGeometry(QtCore.QRect(360, 50, 61, 61))
        self.pushnew_account.setObjectName("pushnew_account")
        self.tool.addItem(self.page_8, "")
        self.page_7 = QtWidgets.QWidget()
        self.page_7.setGeometry(QtCore.QRect(0, 0, 911, 209))
        self.page_7.setObjectName("page_7")
        self.Activities_2 = QtWidgets.QToolBox(self.page_7)
        self.Activities_2.setGeometry(QtCore.QRect(40, 10, 801, 205))
        self.Activities_2.setObjectName("Activities_2")
        self.page = QtWidgets.QWidget()
        self.page.setGeometry(QtCore.QRect(0, 0, 801, 117))
        self.page.setObjectName("page")
        self.formLayoutWidget_4 = QtWidgets.QWidget(self.page)
        self.formLayoutWidget_4.setGeometry(QtCore.QRect(40, 40, 711, 31))
        self.formLayoutWidget_4.setObjectName("formLayoutWidget_4")
        self.formLayout_5 = QtWidgets.QFormLayout(self.formLayoutWidget_4)
        self.formLayout_5.setContentsMargins(0, 0, 0, 0)
        self.formLayout_5.setObjectName("formLayout_5")
        self.hengsao = QtWidgets.QPushButton(self.formLayoutWidget_4)
        self.hengsao.setObjectName("hengsao")
        self.formLayout_5.setWidget(0, QtWidgets.QFormLayout.LabelRole, self.hengsao)
        self.horizontalLayout_9 = QtWidgets.QHBoxLayout()
        self.horizontalLayout_9.setObjectName("horizontalLayout_9")
        self.lineEdit_16 = QtWidgets.QLineEdit(self.formLayoutWidget_4)
        self.lineEdit_16.setObjectName("lineEdit_16")
        self.horizontalLayout_9.addWidget(self.lineEdit_16)
        self.lineEdit_15 = QtWidgets.QLineEdit(self.formLayoutWidget_4)
        self.lineEdit_15.setObjectName("lineEdit_15")
        self.horizontalLayout_9.addWidget(self.lineEdit_15)
        self.lineEdit_14 = QtWidgets.QLineEdit(self.formLayoutWidget_4)
        self.lineEdit_14.setObjectName("lineEdit_14")
        self.horizontalLayout_9.addWidget(self.lineEdit_14)
        self.lineEdit_13 = QtWidgets.QLineEdit(self.formLayoutWidget_4)
        self.lineEdit_13.setObjectName("lineEdit_13")
        self.horizontalLayout_9.addWidget(self.lineEdit_13)
        self.formLayout_5.setLayout(0, QtWidgets.QFormLayout.FieldRole, self.horizontalLayout_9)
        self.value_text_1 = QtWidgets.QLabel(self.page)
        self.value_text_1.setGeometry(QtCore.QRect(150, 10, 130, 20))
        self.value_text_1.setObjectName("value_text_1")
        self.value_text_2 = QtWidgets.QLabel(self.page)
        self.value_text_2.setGeometry(QtCore.QRect(320, 10, 130, 20))
        self.value_text_2.setObjectName("value_text_2")
        self.value_text_3 = QtWidgets.QLabel(self.page)
        self.value_text_3.setGeometry(QtCore.QRect(470, 10, 130, 20))
        self.value_text_3.setObjectName("value_text_3")
        self.value_text_4 = QtWidgets.QLabel(self.page)
        self.value_text_4.setGeometry(QtCore.QRect(650, 10, 140, 20))
        self.value_text_4.setObjectName("value_text_4")
        self.Activities_2.addItem(self.page, "")
        self.page_2 = QtWidgets.QWidget()
        self.page_2.setGeometry(QtCore.QRect(0, 0, 801, 117))
        self.page_2.setObjectName("page_2")
        self.formLayoutWidget_5 = QtWidgets.QWidget(self.page_2)
        self.formLayoutWidget_5.setGeometry(QtCore.QRect(40, 40, 711, 31))
        self.formLayoutWidget_5.setObjectName("formLayoutWidget_5")
        self.formLayout_6 = QtWidgets.QFormLayout(self.formLayoutWidget_5)
        self.formLayout_6.setContentsMargins(0, 0, 0, 0)
        self.formLayout_6.setObjectName("formLayout_6")
        self.haoling = QtWidgets.QPushButton(self.formLayoutWidget_5)
        self.haoling.setObjectName("haoling")
        self.formLayout_6.setWidget(0, QtWidgets.QFormLayout.LabelRole, self.haoling)
        self.horizontalLayout_10 = QtWidgets.QHBoxLayout()
        self.horizontalLayout_10.setObjectName("horizontalLayout_10")
        self.lineEdit_22 = QtWidgets.QLineEdit(self.formLayoutWidget_5)
        self.lineEdit_22.setObjectName("lineEdit_22")
        self.horizontalLayout_10.addWidget(self.lineEdit_22)
        self.lineEdit_23 = QtWidgets.QLineEdit(self.formLayoutWidget_5)
        self.lineEdit_23.setObjectName("lineEdit_23")
        self.horizontalLayout_10.addWidget(self.lineEdit_23)
        self.lineEdit_24 = QtWidgets.QLineEdit(self.formLayoutWidget_5)
        self.lineEdit_24.setObjectName("lineEdit_24")
        self.horizontalLayout_10.addWidget(self.lineEdit_24)
        # self.lineEdit_25 = QtWidgets.QLineEdit(self.formLayoutWidget_5)
        # self.lineEdit_25.setObjectName("lineEdit_25")
        # self.horizontalLayout_10.addWidget(self.lineEdit_25)
        self.formLayout_6.setLayout(0, QtWidgets.QFormLayout.FieldRole, self.horizontalLayout_10)
        self.value_text_5 = QtWidgets.QLabel(self.page_2)
        self.value_text_5.setGeometry(QtCore.QRect(190, 10, 130, 20))
        self.value_text_5.setObjectName("value_text_5")
        self.value_text_6 = QtWidgets.QLabel(self.page_2)
        self.value_text_6.setGeometry(QtCore.QRect(390, 10, 130, 20))
        self.value_text_6.setObjectName("value_text_6")
        self.value_text_7 = QtWidgets.QLabel(self.page_2)
        self.value_text_7.setGeometry(QtCore.QRect(600, 10, 140, 20))
        self.value_text_7.setObjectName("value_text_7")
        # self.value_text_8 = QtWidgets.QLabel(self.page_2)
        # self.value_text_8.setGeometry(QtCore.QRect(640, 10, 130,20))
        # self.value_text_8.setObjectName("value_text_8")
        self.Activities_2.addItem(self.page_2, "")
        self.page_3 = QtWidgets.QWidget()
        self.page_3.setGeometry(QtCore.QRect(0, 0, 801, 117))
        self.page_3.setObjectName("page_3")
        self.formLayoutWidget_6 = QtWidgets.QWidget(self.page_3)
        self.formLayoutWidget_6.setGeometry(QtCore.QRect(40, 50, 711, 31))
        self.formLayoutWidget_6.setObjectName("formLayoutWidget_6")
        self.formLayout_7 = QtWidgets.QFormLayout(self.formLayoutWidget_6)
        self.formLayout_7.setContentsMargins(0, 0, 0, 0)
        self.formLayout_7.setObjectName("formLayout_7")
        self.xianshijinjiang = QtWidgets.QPushButton(self.formLayoutWidget_6)
        self.xianshijinjiang.setObjectName("xianshijinjiang")
        self.formLayout_7.setWidget(0, QtWidgets.QFormLayout.LabelRole, self.xianshijinjiang)
        self.horizontalLayout_11 = QtWidgets.QHBoxLayout()
        self.horizontalLayout_11.setObjectName("horizontalLayout_11")
        self.lineEdit_26 = QtWidgets.QLineEdit(self.formLayoutWidget_6)
        self.lineEdit_26.setObjectName("lineEdit_26")
        self.horizontalLayout_11.addWidget(self.lineEdit_26)
        self.lineEdit_27 = QtWidgets.QLineEdit(self.formLayoutWidget_6)
        self.lineEdit_27.setObjectName("lineEdit_27")
        self.horizontalLayout_11.addWidget(self.lineEdit_27)
        self.lineEdit_28 = QtWidgets.QLineEdit(self.formLayoutWidget_6)
        self.lineEdit_28.setObjectName("lineEdit_28")
        self.horizontalLayout_11.addWidget(self.lineEdit_28)
        self.lineEdit_29 = QtWidgets.QLineEdit(self.formLayoutWidget_6)
        self.lineEdit_29.setObjectName("lineEdit_29")
        self.horizontalLayout_11.addWidget(self.lineEdit_29)
        self.lineEdit_34 = QtWidgets.QLineEdit(self.formLayoutWidget_6)
        self.lineEdit_34.setObjectName("lineEdit_34")
        self.horizontalLayout_11.addWidget(self.lineEdit_34)
        self.formLayout_7.setLayout(0, QtWidgets.QFormLayout.FieldRole, self.horizontalLayout_11)
        self.value_text_9 = QtWidgets.QLabel(self.page_3)
        self.value_text_9.setGeometry(QtCore.QRect(128, 20, 130, 20))
        self.value_text_9.setObjectName("value_text_9")
        self.value_text_10 = QtWidgets.QLabel(self.page_3)
        self.value_text_10.setGeometry(QtCore.QRect(256, 20, 130, 20))
        self.value_text_10.setObjectName("value_text_10")
        self.value_text_11 = QtWidgets.QLabel(self.page_3)
        self.value_text_11.setGeometry(QtCore.QRect(384, 20, 130, 20))
        self.value_text_11.setObjectName("value_text_11")
        self.value_text_12 = QtWidgets.QLabel(self.page_3)
        self.value_text_12.setGeometry(QtCore.QRect(512, 20, 130, 20))
        self.value_text_12.setObjectName("value_text_12")
        self.value_text_121 = QtWidgets.QLabel(self.page_3)
        self.value_text_121.setGeometry(QtCore.QRect(640, 20, 140, 20))
        self.value_text_121.setObjectName("value_text_121")
        self.Activities_2.addItem(self.page_3, "")
        self.page_4 = QtWidgets.QWidget()
        self.page_4.setGeometry(QtCore.QRect(0, 0, 801, 117))
        self.page_4.setObjectName("page_4")
        self.formLayoutWidget_7 = QtWidgets.QWidget(self.page_4)
        self.formLayoutWidget_7.setGeometry(QtCore.QRect(40, 40, 711, 31))
        self.formLayoutWidget_7.setObjectName("formLayoutWidget_7")
        self.formLayout_8 = QtWidgets.QFormLayout(self.formLayoutWidget_7)
        self.formLayout_8.setContentsMargins(0, 0, 0, 0)
        self.formLayout_8.setObjectName("formLayout_8")
        self.huashen = QtWidgets.QPushButton(self.formLayoutWidget_7)
        self.huashen.setObjectName("huashen")
        self.formLayout_8.setWidget(0, QtWidgets.QFormLayout.LabelRole, self.huashen)
        self.horizontalLayout_12 = QtWidgets.QHBoxLayout()
        self.horizontalLayout_12.setObjectName("horizontalLayout_12")
        self.lineEdit_30 = QtWidgets.QLineEdit(self.formLayoutWidget_7)
        self.lineEdit_30.setObjectName("lineEdit_30")
        self.horizontalLayout_12.addWidget(self.lineEdit_30)
        self.lineEdit_31 = QtWidgets.QLineEdit(self.formLayoutWidget_7)
        self.lineEdit_31.setObjectName("lineEdit_31")
        self.horizontalLayout_12.addWidget(self.lineEdit_31)
        self.lineEdit_32 = QtWidgets.QLineEdit(self.formLayoutWidget_7)
        self.lineEdit_32.setObjectName("lineEdit_32")
        self.horizontalLayout_12.addWidget(self.lineEdit_32)
        self.lineEdit_33 = QtWidgets.QLineEdit(self.formLayoutWidget_7)
        self.lineEdit_33.setObjectName("lineEdit_33")
        self.horizontalLayout_12.addWidget(self.lineEdit_33)
        self.formLayout_8.setLayout(0, QtWidgets.QFormLayout.FieldRole, self.horizontalLayout_12)
        self.value_text_13 = QtWidgets.QLabel(self.page_4)
        self.value_text_13.setGeometry(QtCore.QRect(160, 10, 130, 20))
        self.value_text_13.setObjectName("value_text_13")
        self.value_text_14 = QtWidgets.QLabel(self.page_4)
        self.value_text_14.setGeometry(QtCore.QRect(320, 10, 130, 20))
        self.value_text_14.setObjectName("value_text_14")
        self.value_text_15 = QtWidgets.QLabel(self.page_4)
        self.value_text_15.setGeometry(QtCore.QRect(490, 10, 130, 20))
        self.value_text_15.setObjectName("value_text_15")
        self.value_text_16 = QtWidgets.QLabel(self.page_4)
        self.value_text_16.setGeometry(QtCore.QRect(630, 10, 140, 20))
        self.value_text_16.setObjectName("value_text_16")
        self.Activities_2.addItem(self.page_4, "")
        self.page_5 = QtWidgets.QWidget()
        self.page_5.setGeometry(QtCore.QRect(0, 0, 801, 117))
        self.page_5.setObjectName("page_5")
        self.formLayoutWidget_8 = QtWidgets.QWidget(self.page_5)
        self.formLayoutWidget_8.setGeometry(QtCore.QRect(40, 40, 711, 31))
        self.formLayoutWidget_8.setObjectName("formLayoutWidget_8")
        self.formLayout_9 = QtWidgets.QFormLayout(self.formLayoutWidget_8)
        self.formLayout_9.setContentsMargins(0, 0, 0, 0)
        self.formLayout_9.setObjectName("formLayout_9")
        self.fujia = QtWidgets.QPushButton(self.formLayoutWidget_8)
        self.fujia.setObjectName("fujia")
        self.formLayout_9.setWidget(0, QtWidgets.QFormLayout.LabelRole, self.fujia)
        self.horizontalLayout_13 = QtWidgets.QHBoxLayout()
        self.horizontalLayout_13.setObjectName("horizontalLayout_13")
        self.lineEdit_35 = QtWidgets.QLineEdit(self.formLayoutWidget_8)
        self.lineEdit_35.setObjectName("lineEdit_35")
        self.horizontalLayout_13.addWidget(self.lineEdit_35)
        self.lineEdit_36 = QtWidgets.QLineEdit(self.formLayoutWidget_8)
        self.lineEdit_36.setObjectName("lineEdit_36")
        self.horizontalLayout_13.addWidget(self.lineEdit_36)
        self.lineEdit_37 = QtWidgets.QLineEdit(self.formLayoutWidget_8)
        self.lineEdit_37.setObjectName("lineEdit_37")
        self.horizontalLayout_13.addWidget(self.lineEdit_37)
        # self.lineEdit_38 = QtWidgets.QLineEdit(self.formLayoutWidget_8)
        # self.lineEdit_38.setObjectName("lineEdit_38")
        # self.horizontalLayout_13.addWidget(self.lineEdit_38)
        self.formLayout_9.setLayout(0, QtWidgets.QFormLayout.FieldRole, self.horizontalLayout_13)
        self.value_text_17 = QtWidgets.QLabel(self.page_5)
        self.value_text_17.setGeometry(QtCore.QRect(180, 10, 130, 20))
        self.value_text_17.setObjectName("value_text_17")
        self.value_text_18 = QtWidgets.QLabel(self.page_5)
        self.value_text_18.setGeometry(QtCore.QRect(380, 10, 130, 20))
        self.value_text_18.setObjectName("value_text_18")
        self.value_text_19 = QtWidgets.QLabel(self.page_5)
        self.value_text_19.setGeometry(QtCore.QRect(550, 10, 130, 20))
        self.value_text_19.setObjectName("value_text_19")
        # self.value_text_20 = QtWidgets.QLabel(self.page_5)
        # self.value_text_20.setGeometry(QtCore.QRect(630, 10, 140, 20))
        # self.value_text_20.setObjectName("value_text_20")
        self.Activities_2.addItem(self.page_5, "")

        self.tool.addItem(self.page_7, "")
        self.game_name_2 = QtWidgets.QComboBox(self.groupBox_6)
        self.game_name_2.setGeometry(QtCore.QRect(10, 20, 201, 31))
        self.game_name_2.setObjectName("game_name_2")
        self.game_name_2.addItem('请选择游戏版本')
        self.game_name_2.addItem('少三2')
        self.game_name_2.addItem('少三2台湾')
        self.game_name_2.addItem('少三2日本')
        self.game_name_2.addItem('少三2新马')
        self.game_name_2.addItem('少三2韩国')
        self.clear_log = QtWidgets.QPushButton(self.groupBox_6)
        self.clear_log.setGeometry(QtCore.QRect(500, 30, 100, 30))
        self.clear_log.setObjectName("clear_log")
        self.clear_resource = QtWidgets.QPushButton(self.groupBox_6)
        self.clear_resource.setGeometry(QtCore.QRect(700, 30, 100, 30))
        self.clear_resource.setObjectName("clear_resource")
        self.game_name_text_2 = QtWidgets.QLabel(self.groupBox_6)
        self.game_name_text_2.setGeometry(QtCore.QRect(220, 30, 54, 12))
        self.game_name_text_2.setObjectName("game_name_text_2")
        self.lineEdit_24.setText("True/False")
        self.lineEdit_13.setText("True")
        self.lineEdit_33.setText("True")
        self.lineEdit_34.setText("True")
        self.lineEdit_28.setText("魏/蜀/吴/群/金/紫金")
        self.retranslateUi(Dialog)
        self.tool.setCurrentIndex(0)
        # self.new_account_2.setCurrentIndex(0)
        self.Activities_2.setCurrentIndex(3)
        QtCore.QMetaObject.connectSlotsByName(Dialog)
        Dialog.show()

    def add_resource(self, name, num):
        """
        添加道具，使用协议，不区分地区
        :param name: 道具名字
        :param num: 添加数量
        :return:
        """
        add_type, add_value = self.my_poco.protocol.mri.get_type_id_from_name(name)
        self.my_poco.protocol.add_resource_pb(add_type, add_value, num)

    def del_resource(self):
        """
        删除道具，使用协议，不区分地区
        :return:
        """
        self.my_poco.del_all_resource_pb()
        # 删除道具
        add_type, add_value = self.my_poco.protocol.mri.get_type_id_from_name("元宝")
        yuanbaoshuliang = self.my_poco.protocol.get_resource_pb_yuanbao()
        self.my_poco.protocol.del_resource_pb(add_type, add_value, yuanbaoshuliang)
        self.add_log("账号：" + self.account + "资源清除完毕")

    def add_log(self, str_into):
        """
        显示日志
        :param str_into:
        :return:
        """
        new_log = self.logtext.toPlainText()
        set_log = new_log + "\r\n" + str_into
        self.logtext.setText(set_log)

    def clear_log_text(self):
        """
        显示日志
        :return:
        """
        self.logtext.setText("")

    def add_jindu(self, num):
        """
        添加进度条
        :param num: 每次增加的数值
        :return:
        """
        new_num = self.jindutiao.value()
        set_num = int(new_num) + num
        if set_num > 100:
            set_num = 100
        self.jindutiao.setProperty("value", set_num)

    def clear_jindu(self):
        """
        清空进度条
        """
        self.jindutiao.setProperty("value", 0)

    def haoling_def(self):
        name = self.lineEdit_22.text()
        num = self.lineEdit_23.text()
        is_join = self.lineEdit_24.text()
        if is_join == "True":
            is_join = True
        else:
            is_join = False
        if self.my_poco is not None:
            try:
                self.my_poco.GM_fengkuang_haoling(name, int(num), join=is_join)
            except Exception:
                self.add_log("活动进行失败，想知道失败原因，坐等后续优化.....")
                return ""
        else:
            self.add_log("请先登录")
        self.add_log("旗子捐献成功")

    def hengcaoqianjun_def(self):
        _id = self.lineEdit_16.text()
        name = self.lineEdit_15.text()
        num = self.lineEdit_14.text()
        is_stop = self.lineEdit_13.text()
        if is_stop == "True":
            is_stop = True
        else:
            is_stop = False
        if self.my_poco != None:
            try:
                log = self.my_poco.GM_fengkuang_hengsaoqianjun(int(_id), name, int(num), is_stop=is_stop)
            except Exception:
                self.add_log("活动进行失败，想知道失败原因，坐等后续优化.....")
                return ""
        else:
            self.add_log("请先登录")
        self.add_log(log)

    def huashen_def(self):
        _id = self.lineEdit_30.text()
        name = self.lineEdit_31.text()
        num = self.lineEdit_32.text()
        is_stop = self.lineEdit_33.text()
        if is_stop == "True":
            is_stop = True
        else:
            is_stop = False
        if self.my_poco != None:
            try:
                log = self.my_poco.GM_fengkuang_huashen(int(_id), name, int(num), is_stop=is_stop)
            except Exception:
                self.add_log("活动进行失败，想知道失败原因，坐等后续优化.....")
                return ""
        else:
            self.add_log("请先登录")
        self.add_log(log)

    def xianshijinjiang_def(self):
        _id = self.lineEdit_26.text()
        huodong_name = self.lineEdit_27.text()
        zhenying = self.lineEdit_28.text()
        resource_name = self.lineEdit_29.text()
        is_stop = self.lineEdit_34.text()
        if is_stop == "True":
            is_stop = True
        else:
            is_stop = False
        if self.my_poco is not None:
            try:
                log = self.my_poco.GM_fengkuang_xianshijinjiang(int(_id), huodong_name, zhenying, resource_name,
                                                                is_stop=is_stop)
            except Exception:
                self.add_log("活动进行失败，想知道失败原因，坐等后续优化.....")
                return ""
        else:
            self.add_log("请先登录")
        self.add_log(log)

    def fujiatianxia_def(self):
        _id = self.lineEdit_35.text()
        sub_type = self.lineEdit_36.text()
        cishu = self.lineEdit_37.text()
        if self.my_poco != None:
            try:
                log_str_z, tongji_str_z, shijiancishu = self.my_poco.GM_fengkuang_fujia(int(_id), int(sub_type),
                                                                                        int(cishu))
            except Exception:
                self.add_log("活动进行失败，想知道失败原因，坐等后续优化.....")
        else:
            self.add_log("请先登录")
        self.add_log("总计获得：")
        self.add_log(log_str_z)
        self.add_log(tongji_str_z)
        self.add_log(shijiancishu)

    def win_clicked(self):
        """
        绑定事件
        :return:
        """
        self.clear_log.clicked.connect(self.clear_log_text)
        self.pushnew_account.clicked.connect(self.new_account)
        self.clear_resource.clicked.connect(self.del_resource)
        self.huashen.clicked.connect(self.huashen_def)
        self.hengsao.clicked.connect(self.hengcaoqianjun_def)
        self.haoling.clicked.connect(self.haoling_def)
        self.xianshijinjiang.clicked.connect(self.xianshijinjiang_def)
        self.fujia.clicked.connect(self.fujiatianxia_def)

    def retranslateUi(self, Dialog):
        self.input_account.setText("请输入账号")
        _translate = QtCore.QCoreApplication.translate
        Dialog.setWindowTitle(_translate("Dialog", "Dialog"))
        self.groupBox_6.setTitle(_translate("Dialog", "GroupBox"))
        self.groupBox_2.setTitle(_translate("Dialog", "GroupBox"))
        self.groupBox.setTitle(_translate("Dialog", "GroupBox"))
        self.is_random.setText(_translate("Dialog", "*是否随机账号"))
        self.input_account_text.setText(_translate("Dialog", "输入账号"))
        self.sever_name_text.setText(_translate("Dialog", "区服"))
        self.groupBox_3.setTitle(_translate("Dialog", "GroupBox"))
        # self.set_account.setText(_translate("Dialog", "手动指定账号"))
        # self.new_account_2.setItemText(self.new_account_2.indexOf(self.page_5), _translate("Dialog", "手动指定账号"))
        # self.account_v1.setText(_translate("Dialog", "指定账号v1"))
        # self.new_account_2.setItemText(self.new_account_2.indexOf(self.page_6), _translate("Dialog", "指定账号v1"))
        # self.account_v2.setText(_translate("Dialog", "指定账号v2"))
        # self.new_account_2.setItemText(self.new_account_2.indexOf(self.page_9), _translate("Dialog", "指定账号v2"))
        self.groupBox_4.setTitle(_translate("Dialog", "GroupBox"))
        self.resource_text.setText(_translate("Dialog", "输入需要的资源"))
        self.pushnew_account.setText(_translate("Dialog", "创建账号"))
        self.clear_log.setText(_translate("Dialog", "清空log"))
        self.clear_resource.setText(_translate("Dialog", "清空所有资源"))
        self.tool.setItemText(self.tool.indexOf(self.page_8), _translate("Dialog", "创建账号"))
        self.hengsao.setText(_translate("Dialog", "开始"))
        self.value_text_1.setText(_translate("Dialog", "活动ID"))
        self.value_text_2.setText(_translate("Dialog", "道具名字"))
        self.value_text_3.setText(_translate("Dialog", "道具数量"))
        self.value_text_4.setText(_translate("Dialog", "是否抽到停止True/False"))
        self.Activities_2.setItemText(self.Activities_2.indexOf(self.page), _translate("Dialog", "横扫千军"))
        self.haoling.setText(_translate("Dialog", "开始"))
        self.value_text_5.setText(_translate("Dialog", "军团名称"))
        self.value_text_6.setText(_translate("Dialog", "捐献的数量"))
        self.value_text_7.setText(_translate("Dialog", "加入/创建军团True/False"))
        # self.value_text_8.setText(_translate("Dialog", "TextLabel"))
        self.Activities_2.setItemText(self.Activities_2.indexOf(self.page_2), _translate("Dialog", "号令天下"))
        self.xianshijinjiang.setText(_translate("Dialog", "开始"))
        self.value_text_9.setText(_translate("Dialog", "活动ID"))
        self.value_text_10.setText(_translate("Dialog", "第几期活动名称"))
        self.value_text_11.setText(_translate("Dialog", "阵营"))
        self.value_text_12.setText(_translate("Dialog", "道具名字"))
        self.value_text_121.setText(_translate("Dialog", "是否抽到停止True/False"))
        self.Activities_2.setItemText(self.Activities_2.indexOf(self.page_3), _translate("Dialog", "限时金将"))
        self.huashen.setText(_translate("Dialog", "开始"))
        self.value_text_13.setText(_translate("Dialog", "活动ID"))
        self.value_text_14.setText(_translate("Dialog", "道具名字"))
        self.value_text_15.setText(_translate("Dialog", "道具数量"))
        self.value_text_16.setText(_translate("Dialog", "是否抽到停止True/False"))
        self.Activities_2.setItemText(self.Activities_2.indexOf(self.page_4), _translate("Dialog", "化身活动"))
        self.fujia.setText(_translate("Dialog", "开始"))
        self.value_text_17.setText(_translate("Dialog", "活动ID"))
        self.value_text_18.setText(_translate("Dialog", "1金/2紫金"))
        self.value_text_19.setText(_translate("Dialog", "抽卡次数"))
        # self.value_text_20.setText(_translate("Dialog", "是否抽到停止True/False"))
        self.Activities_2.setItemText(self.Activities_2.indexOf(self.page_5), _translate("Dialog", "富甲天下"))

        self.tool.setItemText(self.tool.indexOf(self.page_7), _translate("Dialog", "活动"))
        self.game_name_text_2.setText(_translate("Dialog", "游戏名"))
        self.resource_dic.setText('''请输入需要的资源，格式："":,{"角色经验":999999999,}''')
        self.win_clicked()

    def new_account(self):
        exe_path = QDir.currentPath()
        exe_path = os.path.abspath(exe_path + "/MyPoco")
        self.clear_jindu()
        game_name = self.game_name_2.currentText()  # 获取游戏名称
        if "请选择" == game_name:
            self.add_log("请选择游戏")
            self.clear_jindu()
            return ""
        sever_name = self.sever_name.currentText()  # 获取游戏名称
        account_type = self.account_type.currentText()
        self.add_jindu(10)
        if sever_name == "请选择":
            self.add_log("请选择服务器")
            self.clear_jindu()
            return ""
        if self.is_random.isChecked():
            self.my_poco = MyPoco(game_name, None, ui_path=exe_path)
            account = self.my_poco.get_random_account()
        else:
            account = self.input_account.text()
            if account == "请输入账号" or account == "":
                self.add_log("请输入账号")
                self.clear_jindu()
                return ""
        self.add_jindu(10)
        self.add_log("当前正在创建的账号为：" + account)
        self.account = account
        if "手动指定" == account_type:
            self.add_jindu(10)
            self.my_poco = MyPoco(game_name, None, ui_path=exe_path)
            try:
                self.my_poco.make_new_role(sever_name, self.account)
            except Exception:
                self.add_log("创建失败")
                self.clear_jindu()
                return ""
        elif "已有账号" == account_type:
            if self.is_random.isChecked():
                self.add_log("无法使用随机账号,请手动输入已存在的账号")
                self.clear_jindu()
                return ""
            self.my_poco = MyPoco(game_name, None, ui_path=exe_path)
            try:
                self.my_poco.make_new_role(sever_name, self.account)
            except Exception:
                self.add_log("创建失败")
                self.clear_jindu()
                return ""
            self.add_jindu(10)
        elif "V1" == account_type:
            self.add_jindu(10)
            self.add_log("创建中.......")
            time.sleep(3)
            try:
                v1th = v1Thread(game_name, self.account, sever_name, exe_path)
                v1th.start()
                # self.add_log("虽然提示你创建完了，但是还没有，多等一会")
                v1th.join()
            except Exception:
                self.add_log("创建账号失败")
                self.clear_jindu()
                return ""
        elif "V2" == account_type:
            self.add_jindu(10)
            self.add_log("创建中.......")
            time.sleep(3)
            try:
                v2th = v2Thread(game_name, self.account, sever_name, exe_path)
                v2th.start()
                v2th.join()
                # self.add_log("虽然提示你创建完了，但是还没有，多等一会")
            except Exception:
                self.add_log("创建账号失败")
                self.clear_jindu()
                return ""
        else:
            self.add_jindu(10)
            self.add_log("请选择要创建账号的类型")
            self.clear_jindu()
            return ""
        self.add_jindu(50)
        resource_dic_str = self.resource_dic.toPlainText()
        if "请输入需要的资源" in resource_dic_str:
            pass
        else:
            resource_dic = ast.literal_eval(resource_dic_str)
            for key in resource_dic.keys():
                self.add_resource(key, int(resource_dic[key]))
                self.add_jindu(1)
            self.add_log("道具" + resource_dic_str + "添加成功")
        log_text = "角色创建完毕，账号为:" + account + ",在" + game_name + "-" + sever_name + "服"
        self.add_log(log_text)
        self.add_jindu(100)


class v1Thread(threading.Thread):
    def __init__(self, game_name_input, account_input, sever_name_input, ui_path_input):
        threading.Thread.__init__(self)
        self.game_name = game_name_input
        self.account = account_input
        self.sever_name = sever_name_input
        self.ui_path = ui_path_input

    def run(self):
        my_poco = MyPoco(self.game_name, None, ui_path=self.ui_path)
        my_poco.make_new_role(self.sever_name, self.account)
        my_poco.GM_yijian_account_v1(self.account)


class v2Thread(threading.Thread):
    def __init__(self, game_name_input, account_input, sever_name_input, ui_path_input):
        threading.Thread.__init__(self)
        self.game_name = game_name_input
        self.account = account_input
        self.sever_name = sever_name_input
        self.ui_path = ui_path_input

    def run(self):
        my_poco = MyPoco(self.game_name, None, ui_path=self.ui_path)
        my_poco.make_new_role(self.sever_name, self.account)
        my_poco.GM_yijian_account_v2(self.account)


if __name__ == "__main__":
    app = QtWidgets.QApplication(sys.argv)
    form = QtWidgets.QWidget()
    w = Ui_Dialog()
    w.setupUi(form)
    form.show()
    sys.exit(app.exec_())
