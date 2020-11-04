from redis import Redis

"""
用于将用户id存到redis里面
"""
USERSIZE = 10000
# 使用时请修改 host 为对应的redis服务器地址

# r = Redis(host='172.25.48.95', decode_responses=True)
r = Redis(host='10.18.98.136', password='username_redis', decode_responses=True)
r.delete('wen')
# 如果需要写入特定的某数据数据时，修改下面的for循环，完成数据准备工作，
#  默认提供的是 写入 1，N之前的数字
# for i in range(USERSIZE + 1):
#     if i == 250:
#
#         r.lpush('userindex', i)
#     else:
#         r.lpush('userindex',i)
i = 0
j = 0
while j < USERSIZE + 1:
    si = str(i)
    if si.find('250') == -1 and si.find("69") == -1:
        uindex = "wen{:0>6d}".format(i)
        r.rpush('wen', uindex)
        j += 1
    i += 1
print("done")
print("测试获取一个userid")
print(r.rpop('wen'))
