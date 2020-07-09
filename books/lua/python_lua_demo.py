# _*_coding:utf-8 _*_
#!/usr/bin/python3
#Reference:********************************
# encoding: utf-8
#@Time: 2020/7/7  15:25
#@Author: 洞洞
#@File: python_lua_demo.py
#@Function:
#@Method:
#Reference:********************************
import os
import lupa
# 实例化一个lua解释器
# lua = lupa.LuaRuntime()
# LIBS = [r"\com\Tools\MyPoco\protocol\trunk\src\battle.lua",]
# llibs = {}

def get_file_name(filename):
    import os
    (_, tmp) = os.path.split(filename)
    (f_name, ext) = os.path.splitext(tmp)
    return f_name

def load_libs():
    this_path = os.path.abspath(os.path.dirname(os.path.dirname(os.path.dirname(__file__))))
    global LIBS, llibs
    for lib_p in LIBS:
        lib_p = this_path+lib_p
        f = open(lib_p,'r',encoding = "utf-8" )
        code_str = f.readlines()
        filename = get_file_name(lib_p)
        llibs[filename] = lua.execute('\n'.join(code_str))

if __name__ == '__main__':
    # load_libs()
    # print(llibs['battle'].initBattle())
    lua = lupa.LuaRuntime()
    lua.execute("package.path = \";../../com/Tools/MyPoco/protocol/trunk/src/?.lua;\" .. package.path")
    lua.execute("require(\"battle\")")
    lua.execute("initBattle()")
    # lua.