# -*- coding: utf-8 -*-
# 数据打包入口
"""
======by zhongj
去除掉以前的多分支判断逻辑
将各协议打包函数分拆，使用字典方式调用对应的协议打包函数，
全部协议数据在 all_protocol 字典中保存对应的关系
例子： {“协议名称”:协议打包函数}
新增加协议时需要在 all_protocol 字典中添加对应的协议以及打包函数名

对外暴露函数 为 pack_varint，pack_data，其它均为内部函数
=======by zhongj
"""
import struct
#from Crypto.Cipher import AES
#from Crypto.Util.Padding import pad


def protobuf_protocol(data, api_attr):
    msg_data_str = data
    pack_length = len(msg_data_str) + 32#24
    cmd = api_attr['send_cmd']
    uid = api_attr['uid']
    sid = api_attr['sid']
    cid = 0
    head_data = struct.pack(">IIQQQ", pack_length, cmd, uid, sid, cid)
    msg_data_str = head_data + msg_data_str
    return msg_data_str


# 全部协议打包函数字典
all_protocol = {
    'protobuf-ss': protobuf_protocol,
}


# 给外部调用的函数
def pack_varint(val):
    total = b''
    if val < 0:
        val = (1 << 32) + val
    while val >= 0x80:
        bits = val & 0x7F
        val >>= 7
        total += struct.pack('B', (0x80 | bits))
    bits = val & 0x7F
    total += struct.pack('B', bits)
    return total


# 给外部调用的主函数
def pack_data(data, api_attr=None):
    msg_data_str = b''
    protocol = api_attr['protocol']
    if protocol in all_protocol.keys():
        data = all_protocol[protocol](data, api_attr)
        return data
    else:
        print("not found protocol process")
        return msg_data_str
