# -*- coding: utf-8 -*-
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: cg.ss_proto

from MyPoco.airtestide_lack_packages.google.protobuf.internal import enum_type_wrapper
from MyPoco.airtestide_lack_packages.google.protobuf import descriptor as _descriptor
from MyPoco.airtestide_lack_packages.google.protobuf import message as _message
from MyPoco.airtestide_lack_packages.google.protobuf import reflection as _reflection
from MyPoco.airtestide_lack_packages.google.protobuf import symbol_database as _symbol_database
# @@protoc_insertion_point(imports)

_sym_db = _symbol_database.Default()


import MyPoco.protocol.protocol_file_ss2.out_base_pb2 as out__base__pb2


DESCRIPTOR = _descriptor.FileDescriptor(
  name='cg.ss_proto',
  package='cg',
  syntax='proto2',
  serialized_options=None,
  serialized_pb=b'\n\x08\x63g.ss_proto\x12\x02\x63g\x1a\x0eout_base.ss_proto\"\xa0\x01\n\tC2G_Login\x12\r\n\x05token\x18\x01 \x02(\t\x12\x11\n\tserver_id\x18\x02 \x02(\x04\x12\x0f\n\x07version\x18\x03 \x01(\r\x12\x13\n\x0bsequence_id\x18\x04 \x01(\x04\x12 \n\x06\x63lient\x18\x05 \x01(\x0b\x32\x10.out_base.Client\x12\x15\n\ruuid_reg_time\x18\x06 \x01(\r\x12\x12\n\ngateway_ip\x18\x07 \x01(\t\"\xb4\x01\n\tG2C_Login\x12\x0b\n\x03ret\x18\x01 \x02(\r\x12\x0b\n\x03uid\x18\x02 \x01(\x04\x12\x0b\n\x03sid\x18\x03 \x01(\x04\x12\x0f\n\x07version\x18\x04 \x01(\r\x12\x0c\n\x04time\x18\x05 \x01(\r\x12\x0c\n\x04zone\x18\x06 \x01(\r\x12\x13\n\x0bsequence_id\x18\x07 \x01(\x04\x12\x12\n\nauto_flush\x18\x08 \x01(\x08\x12\x13\n\x0bgit_version\x18\t \x01(\t\x12\x15\n\rneed_activate\x18\n \x01(\x08\";\n\nC2G_Create\x12\x0c\n\x04name\x18\x01 \x02(\t\x12\x0c\n\x04type\x18\x02 \x01(\r\x12\x11\n\tserver_id\x18\x03 \x01(\x04\"3\n\nG2C_Create\x12\x0b\n\x03ret\x18\x01 \x02(\r\x12\x0b\n\x03uid\x18\x02 \x01(\x04\x12\x0b\n\x03sid\x18\x03 \x01(\x04\"\x0b\n\tC2G_SayHi\"5\n\tG2C_SayHi\x12\n\n\x02id\x18\x01 \x02(\x04\x12\x0f\n\x07\x63urrent\x18\x02 \x03(\x04\x12\x0b\n\x03\x64\x65l\x18\x03 \x03(\x04\"\x0f\n\rC2G_KeepAlive\"\x0f\n\rG2C_KeepAlive\"\r\n\x0b\x43\x32G_Offline\"\x1d\n\x0bG2C_Offline\x12\x0e\n\x06reason\x18\x01 \x01(\r\"\x10\n\x0e\x43\x32G_OfflineNew\" \n\x0eG2C_OfflineNew\x12\x0e\n\x06reason\x18\x01 \x01(\r\"D\n\rG2C_Broadcast\x12\x0b\n\x03ids\x18\x01 \x03(\x04\x12\x0b\n\x03\x63md\x18\x02 \x02(\r\x12\x0b\n\x03sid\x18\x03 \x02(\r\x12\x0c\n\x04info\x18\x04 \x01(\x0c\">\n\x0c\x43\x32G_Activate\x12\r\n\x05token\x18\x01 \x02(\t\x12\x0c\n\x04\x63ode\x18\x02 \x02(\t\x12\x11\n\tserver_id\x18\x03 \x02(\x04\"\x1b\n\x0cG2C_Activate\x12\x0b\n\x03ret\x18\x01 \x02(\r*\x96\x01\n\x03RET\x12\r\n\tRET_ERROR\x10\x00\x12\n\n\x06RET_OK\x10\x01\x12\x17\n\x13RET_SERVER_MAINTAIN\x10\x02\x12\x16\n\x12RET_USER_NOT_EXIST\x10\x03\x12\x18\n\x14RET_USER_NAME_REPEAT\x10\x04\x12\x14\n\x10RET_LOGIN_REPEAT\x10\x05\x12\x13\n\x0fRET_LOGIC_CLEAR\x10\x06*\xfe\x02\n\x02ID\x12\x0c\n\x08MSG_NONE\x10\x00\x12\x0e\n\tMSG_BEGIN\x10\x91N\x12\x0c\n\x07MSG_END\x10\xf3N\x12\x12\n\rMSG_C2G_Login\x10\x92N\x12\x12\n\rMSG_G2C_Login\x10\x93N\x12\x13\n\x0eMSG_C2G_Create\x10\x94N\x12\x13\n\x0eMSG_G2C_Create\x10\x95N\x12\x16\n\x11MSG_C2G_KeepAlive\x10\x96N\x12\x16\n\x11MSG_G2C_KeepAlive\x10\x97N\x12\x12\n\rMSG_C2G_SayHi\x10\x98N\x12\x12\n\rMSG_G2C_SayHi\x10\x99N\x12\x14\n\x0fMSG_C2G_Offline\x10\x9aN\x12\x14\n\x0fMSG_G2C_Offline\x10\x9bN\x12\x16\n\x11MSG_G2C_Broadcast\x10\x9cN\x12\x15\n\x10MSG_C2G_Activate\x10\x9dN\x12\x15\n\x10MSG_G2C_Activate\x10\x9eN\x12\x17\n\x12MSG_C2G_OfflineNew\x10\x9fN\x12\x17\n\x12MSG_G2C_OfflineNew\x10\xa0N'
  ,
  dependencies=[out__base__pb2.DESCRIPTOR,])

_RET = _descriptor.EnumDescriptor(
  name='RET',
  full_name='cg.RET',
  filename=None,
  file=DESCRIPTOR,
  values=[
    _descriptor.EnumValueDescriptor(
      name='RET_ERROR', index=0, number=0,
      serialized_options=None,
      type=None),
    _descriptor.EnumValueDescriptor(
      name='RET_OK', index=1, number=1,
      serialized_options=None,
      type=None),
    _descriptor.EnumValueDescriptor(
      name='RET_SERVER_MAINTAIN', index=2, number=2,
      serialized_options=None,
      type=None),
    _descriptor.EnumValueDescriptor(
      name='RET_USER_NOT_EXIST', index=3, number=3,
      serialized_options=None,
      type=None),
    _descriptor.EnumValueDescriptor(
      name='RET_USER_NAME_REPEAT', index=4, number=4,
      serialized_options=None,
      type=None),
    _descriptor.EnumValueDescriptor(
      name='RET_LOGIN_REPEAT', index=5, number=5,
      serialized_options=None,
      type=None),
    _descriptor.EnumValueDescriptor(
      name='RET_LOGIC_CLEAR', index=6, number=6,
      serialized_options=None,
      type=None),
  ],
  containing_type=None,
  serialized_options=None,
  serialized_start=856,
  serialized_end=1006,
)
_sym_db.RegisterEnumDescriptor(_RET)

RET = enum_type_wrapper.EnumTypeWrapper(_RET)
_ID = _descriptor.EnumDescriptor(
  name='ID',
  full_name='cg.ID',
  filename=None,
  file=DESCRIPTOR,
  values=[
    _descriptor.EnumValueDescriptor(
      name='MSG_NONE', index=0, number=0,
      serialized_options=None,
      type=None),
    _descriptor.EnumValueDescriptor(
      name='MSG_BEGIN', index=1, number=10001,
      serialized_options=None,
      type=None),
    _descriptor.EnumValueDescriptor(
      name='MSG_END', index=2, number=10099,
      serialized_options=None,
      type=None),
    _descriptor.EnumValueDescriptor(
      name='MSG_C2G_Login', index=3, number=10002,
      serialized_options=None,
      type=None),
    _descriptor.EnumValueDescriptor(
      name='MSG_G2C_Login', index=4, number=10003,
      serialized_options=None,
      type=None),
    _descriptor.EnumValueDescriptor(
      name='MSG_C2G_Create', index=5, number=10004,
      serialized_options=None,
      type=None),
    _descriptor.EnumValueDescriptor(
      name='MSG_G2C_Create', index=6, number=10005,
      serialized_options=None,
      type=None),
    _descriptor.EnumValueDescriptor(
      name='MSG_C2G_KeepAlive', index=7, number=10006,
      serialized_options=None,
      type=None),
    _descriptor.EnumValueDescriptor(
      name='MSG_G2C_KeepAlive', index=8, number=10007,
      serialized_options=None,
      type=None),
    _descriptor.EnumValueDescriptor(
      name='MSG_C2G_SayHi', index=9, number=10008,
      serialized_options=None,
      type=None),
    _descriptor.EnumValueDescriptor(
      name='MSG_G2C_SayHi', index=10, number=10009,
      serialized_options=None,
      type=None),
    _descriptor.EnumValueDescriptor(
      name='MSG_C2G_Offline', index=11, number=10010,
      serialized_options=None,
      type=None),
    _descriptor.EnumValueDescriptor(
      name='MSG_G2C_Offline', index=12, number=10011,
      serialized_options=None,
      type=None),
    _descriptor.EnumValueDescriptor(
      name='MSG_G2C_Broadcast', index=13, number=10012,
      serialized_options=None,
      type=None),
    _descriptor.EnumValueDescriptor(
      name='MSG_C2G_Activate', index=14, number=10013,
      serialized_options=None,
      type=None),
    _descriptor.EnumValueDescriptor(
      name='MSG_G2C_Activate', index=15, number=10014,
      serialized_options=None,
      type=None),
    _descriptor.EnumValueDescriptor(
      name='MSG_C2G_OfflineNew', index=16, number=10015,
      serialized_options=None,
      type=None),
    _descriptor.EnumValueDescriptor(
      name='MSG_G2C_OfflineNew', index=17, number=10016,
      serialized_options=None,
      type=None),
  ],
  containing_type=None,
  serialized_options=None,
  serialized_start=1009,
  serialized_end=1391,
)
_sym_db.RegisterEnumDescriptor(_ID)

ID = enum_type_wrapper.EnumTypeWrapper(_ID)
RET_ERROR = 0
RET_OK = 1
RET_SERVER_MAINTAIN = 2
RET_USER_NOT_EXIST = 3
RET_USER_NAME_REPEAT = 4
RET_LOGIN_REPEAT = 5
RET_LOGIC_CLEAR = 6
MSG_NONE = 0
MSG_BEGIN = 10001
MSG_END = 10099
MSG_C2G_Login = 10002
MSG_G2C_Login = 10003
MSG_C2G_Create = 10004
MSG_G2C_Create = 10005
MSG_C2G_KeepAlive = 10006
MSG_G2C_KeepAlive = 10007
MSG_C2G_SayHi = 10008
MSG_G2C_SayHi = 10009
MSG_C2G_Offline = 10010
MSG_G2C_Offline = 10011
MSG_G2C_Broadcast = 10012
MSG_C2G_Activate = 10013
MSG_G2C_Activate = 10014
MSG_C2G_OfflineNew = 10015
MSG_G2C_OfflineNew = 10016



_C2G_LOGIN = _descriptor.Descriptor(
  name='C2G_Login',
  full_name='cg.C2G_Login',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  fields=[
    _descriptor.FieldDescriptor(
      name='token', full_name='cg.C2G_Login.token', index=0,
      number=1, type=9, cpp_type=9, label=2,
      has_default_value=False, default_value=b"".decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
    _descriptor.FieldDescriptor(
      name='server_id', full_name='cg.C2G_Login.server_id', index=1,
      number=2, type=4, cpp_type=4, label=2,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
    _descriptor.FieldDescriptor(
      name='version', full_name='cg.C2G_Login.version', index=2,
      number=3, type=13, cpp_type=3, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
    _descriptor.FieldDescriptor(
      name='sequence_id', full_name='cg.C2G_Login.sequence_id', index=3,
      number=4, type=4, cpp_type=4, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
    _descriptor.FieldDescriptor(
      name='client', full_name='cg.C2G_Login.client', index=4,
      number=5, type=11, cpp_type=10, label=1,
      has_default_value=False, default_value=None,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
    _descriptor.FieldDescriptor(
      name='uuid_reg_time', full_name='cg.C2G_Login.uuid_reg_time', index=5,
      number=6, type=13, cpp_type=3, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
    _descriptor.FieldDescriptor(
      name='gateway_ip', full_name='cg.C2G_Login.gateway_ip', index=6,
      number=7, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=b"".decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
  ],
  serialized_options=None,
  is_extendable=False,
  syntax='proto2',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=33,
  serialized_end=193,
)


_G2C_LOGIN = _descriptor.Descriptor(
  name='G2C_Login',
  full_name='cg.G2C_Login',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  fields=[
    _descriptor.FieldDescriptor(
      name='ret', full_name='cg.G2C_Login.ret', index=0,
      number=1, type=13, cpp_type=3, label=2,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
    _descriptor.FieldDescriptor(
      name='uid', full_name='cg.G2C_Login.uid', index=1,
      number=2, type=4, cpp_type=4, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
    _descriptor.FieldDescriptor(
      name='sid', full_name='cg.G2C_Login.sid', index=2,
      number=3, type=4, cpp_type=4, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
    _descriptor.FieldDescriptor(
      name='version', full_name='cg.G2C_Login.version', index=3,
      number=4, type=13, cpp_type=3, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
    _descriptor.FieldDescriptor(
      name='time', full_name='cg.G2C_Login.time', index=4,
      number=5, type=13, cpp_type=3, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
    _descriptor.FieldDescriptor(
      name='zone', full_name='cg.G2C_Login.zone', index=5,
      number=6, type=13, cpp_type=3, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
    _descriptor.FieldDescriptor(
      name='sequence_id', full_name='cg.G2C_Login.sequence_id', index=6,
      number=7, type=4, cpp_type=4, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
    _descriptor.FieldDescriptor(
      name='auto_flush', full_name='cg.G2C_Login.auto_flush', index=7,
      number=8, type=8, cpp_type=7, label=1,
      has_default_value=False, default_value=False,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
    _descriptor.FieldDescriptor(
      name='git_version', full_name='cg.G2C_Login.git_version', index=8,
      number=9, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=b"".decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
    _descriptor.FieldDescriptor(
      name='need_activate', full_name='cg.G2C_Login.need_activate', index=9,
      number=10, type=8, cpp_type=7, label=1,
      has_default_value=False, default_value=False,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
  ],
  serialized_options=None,
  is_extendable=False,
  syntax='proto2',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=196,
  serialized_end=376,
)


_C2G_CREATE = _descriptor.Descriptor(
  name='C2G_Create',
  full_name='cg.C2G_Create',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  fields=[
    _descriptor.FieldDescriptor(
      name='name', full_name='cg.C2G_Create.name', index=0,
      number=1, type=9, cpp_type=9, label=2,
      has_default_value=False, default_value=b"".decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
    _descriptor.FieldDescriptor(
      name='type', full_name='cg.C2G_Create.type', index=1,
      number=2, type=13, cpp_type=3, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
    _descriptor.FieldDescriptor(
      name='server_id', full_name='cg.C2G_Create.server_id', index=2,
      number=3, type=4, cpp_type=4, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
  ],
  serialized_options=None,
  is_extendable=False,
  syntax='proto2',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=378,
  serialized_end=437,
)


_G2C_CREATE = _descriptor.Descriptor(
  name='G2C_Create',
  full_name='cg.G2C_Create',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  fields=[
    _descriptor.FieldDescriptor(
      name='ret', full_name='cg.G2C_Create.ret', index=0,
      number=1, type=13, cpp_type=3, label=2,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
    _descriptor.FieldDescriptor(
      name='uid', full_name='cg.G2C_Create.uid', index=1,
      number=2, type=4, cpp_type=4, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
    _descriptor.FieldDescriptor(
      name='sid', full_name='cg.G2C_Create.sid', index=2,
      number=3, type=4, cpp_type=4, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
  ],
  serialized_options=None,
  is_extendable=False,
  syntax='proto2',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=439,
  serialized_end=490,
)


_C2G_SAYHI = _descriptor.Descriptor(
  name='C2G_SayHi',
  full_name='cg.C2G_SayHi',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  fields=[
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
  ],
  serialized_options=None,
  is_extendable=False,
  syntax='proto2',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=492,
  serialized_end=503,
)


_G2C_SAYHI = _descriptor.Descriptor(
  name='G2C_SayHi',
  full_name='cg.G2C_SayHi',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  fields=[
    _descriptor.FieldDescriptor(
      name='id', full_name='cg.G2C_SayHi.id', index=0,
      number=1, type=4, cpp_type=4, label=2,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
    _descriptor.FieldDescriptor(
      name='current', full_name='cg.G2C_SayHi.current', index=1,
      number=2, type=4, cpp_type=4, label=3,
      has_default_value=False, default_value=[],
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
    _descriptor.FieldDescriptor(
      name='del', full_name='cg.G2C_SayHi.del', index=2,
      number=3, type=4, cpp_type=4, label=3,
      has_default_value=False, default_value=[],
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
  ],
  serialized_options=None,
  is_extendable=False,
  syntax='proto2',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=505,
  serialized_end=558,
)


_C2G_KEEPALIVE = _descriptor.Descriptor(
  name='C2G_KeepAlive',
  full_name='cg.C2G_KeepAlive',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  fields=[
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
  ],
  serialized_options=None,
  is_extendable=False,
  syntax='proto2',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=560,
  serialized_end=575,
)


_G2C_KEEPALIVE = _descriptor.Descriptor(
  name='G2C_KeepAlive',
  full_name='cg.G2C_KeepAlive',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  fields=[
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
  ],
  serialized_options=None,
  is_extendable=False,
  syntax='proto2',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=577,
  serialized_end=592,
)


_C2G_OFFLINE = _descriptor.Descriptor(
  name='C2G_Offline',
  full_name='cg.C2G_Offline',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  fields=[
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
  ],
  serialized_options=None,
  is_extendable=False,
  syntax='proto2',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=594,
  serialized_end=607,
)


_G2C_OFFLINE = _descriptor.Descriptor(
  name='G2C_Offline',
  full_name='cg.G2C_Offline',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  fields=[
    _descriptor.FieldDescriptor(
      name='reason', full_name='cg.G2C_Offline.reason', index=0,
      number=1, type=13, cpp_type=3, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
  ],
  serialized_options=None,
  is_extendable=False,
  syntax='proto2',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=609,
  serialized_end=638,
)


_C2G_OFFLINENEW = _descriptor.Descriptor(
  name='C2G_OfflineNew',
  full_name='cg.C2G_OfflineNew',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  fields=[
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
  ],
  serialized_options=None,
  is_extendable=False,
  syntax='proto2',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=640,
  serialized_end=656,
)


_G2C_OFFLINENEW = _descriptor.Descriptor(
  name='G2C_OfflineNew',
  full_name='cg.G2C_OfflineNew',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  fields=[
    _descriptor.FieldDescriptor(
      name='reason', full_name='cg.G2C_OfflineNew.reason', index=0,
      number=1, type=13, cpp_type=3, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
  ],
  serialized_options=None,
  is_extendable=False,
  syntax='proto2',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=658,
  serialized_end=690,
)


_G2C_BROADCAST = _descriptor.Descriptor(
  name='G2C_Broadcast',
  full_name='cg.G2C_Broadcast',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  fields=[
    _descriptor.FieldDescriptor(
      name='ids', full_name='cg.G2C_Broadcast.ids', index=0,
      number=1, type=4, cpp_type=4, label=3,
      has_default_value=False, default_value=[],
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
    _descriptor.FieldDescriptor(
      name='cmd', full_name='cg.G2C_Broadcast.cmd', index=1,
      number=2, type=13, cpp_type=3, label=2,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
    _descriptor.FieldDescriptor(
      name='sid', full_name='cg.G2C_Broadcast.sid', index=2,
      number=3, type=13, cpp_type=3, label=2,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
    _descriptor.FieldDescriptor(
      name='info', full_name='cg.G2C_Broadcast.info', index=3,
      number=4, type=12, cpp_type=9, label=1,
      has_default_value=False, default_value=b"",
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
  ],
  serialized_options=None,
  is_extendable=False,
  syntax='proto2',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=692,
  serialized_end=760,
)


_C2G_ACTIVATE = _descriptor.Descriptor(
  name='C2G_Activate',
  full_name='cg.C2G_Activate',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  fields=[
    _descriptor.FieldDescriptor(
      name='token', full_name='cg.C2G_Activate.token', index=0,
      number=1, type=9, cpp_type=9, label=2,
      has_default_value=False, default_value=b"".decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
    _descriptor.FieldDescriptor(
      name='code', full_name='cg.C2G_Activate.code', index=1,
      number=2, type=9, cpp_type=9, label=2,
      has_default_value=False, default_value=b"".decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
    _descriptor.FieldDescriptor(
      name='server_id', full_name='cg.C2G_Activate.server_id', index=2,
      number=3, type=4, cpp_type=4, label=2,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
  ],
  serialized_options=None,
  is_extendable=False,
  syntax='proto2',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=762,
  serialized_end=824,
)


_G2C_ACTIVATE = _descriptor.Descriptor(
  name='G2C_Activate',
  full_name='cg.G2C_Activate',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  fields=[
    _descriptor.FieldDescriptor(
      name='ret', full_name='cg.G2C_Activate.ret', index=0,
      number=1, type=13, cpp_type=3, label=2,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
  ],
  serialized_options=None,
  is_extendable=False,
  syntax='proto2',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=826,
  serialized_end=853,
)

_C2G_LOGIN.fields_by_name['client'].message_type = out__base__pb2._CLIENT
DESCRIPTOR.message_types_by_name['C2G_Login'] = _C2G_LOGIN
DESCRIPTOR.message_types_by_name['G2C_Login'] = _G2C_LOGIN
DESCRIPTOR.message_types_by_name['C2G_Create'] = _C2G_CREATE
DESCRIPTOR.message_types_by_name['G2C_Create'] = _G2C_CREATE
DESCRIPTOR.message_types_by_name['C2G_SayHi'] = _C2G_SAYHI
DESCRIPTOR.message_types_by_name['G2C_SayHi'] = _G2C_SAYHI
DESCRIPTOR.message_types_by_name['C2G_KeepAlive'] = _C2G_KEEPALIVE
DESCRIPTOR.message_types_by_name['G2C_KeepAlive'] = _G2C_KEEPALIVE
DESCRIPTOR.message_types_by_name['C2G_Offline'] = _C2G_OFFLINE
DESCRIPTOR.message_types_by_name['G2C_Offline'] = _G2C_OFFLINE
DESCRIPTOR.message_types_by_name['C2G_OfflineNew'] = _C2G_OFFLINENEW
DESCRIPTOR.message_types_by_name['G2C_OfflineNew'] = _G2C_OFFLINENEW
DESCRIPTOR.message_types_by_name['G2C_Broadcast'] = _G2C_BROADCAST
DESCRIPTOR.message_types_by_name['C2G_Activate'] = _C2G_ACTIVATE
DESCRIPTOR.message_types_by_name['G2C_Activate'] = _G2C_ACTIVATE
DESCRIPTOR.enum_types_by_name['RET'] = _RET
DESCRIPTOR.enum_types_by_name['ID'] = _ID
_sym_db.RegisterFileDescriptor(DESCRIPTOR)

C2G_Login = _reflection.GeneratedProtocolMessageType('C2G_Login', (_message.Message,), {
  'DESCRIPTOR' : _C2G_LOGIN,
  '__module__' : 'cg_pb2'
  # @@protoc_insertion_point(class_scope:cg.C2G_Login)
  })
_sym_db.RegisterMessage(C2G_Login)

G2C_Login = _reflection.GeneratedProtocolMessageType('G2C_Login', (_message.Message,), {
  'DESCRIPTOR' : _G2C_LOGIN,
  '__module__' : 'cg_pb2'
  # @@protoc_insertion_point(class_scope:cg.G2C_Login)
  })
_sym_db.RegisterMessage(G2C_Login)

C2G_Create = _reflection.GeneratedProtocolMessageType('C2G_Create', (_message.Message,), {
  'DESCRIPTOR' : _C2G_CREATE,
  '__module__' : 'cg_pb2'
  # @@protoc_insertion_point(class_scope:cg.C2G_Create)
  })
_sym_db.RegisterMessage(C2G_Create)

G2C_Create = _reflection.GeneratedProtocolMessageType('G2C_Create', (_message.Message,), {
  'DESCRIPTOR' : _G2C_CREATE,
  '__module__' : 'cg_pb2'
  # @@protoc_insertion_point(class_scope:cg.G2C_Create)
  })
_sym_db.RegisterMessage(G2C_Create)

C2G_SayHi = _reflection.GeneratedProtocolMessageType('C2G_SayHi', (_message.Message,), {
  'DESCRIPTOR' : _C2G_SAYHI,
  '__module__' : 'cg_pb2'
  # @@protoc_insertion_point(class_scope:cg.C2G_SayHi)
  })
_sym_db.RegisterMessage(C2G_SayHi)

G2C_SayHi = _reflection.GeneratedProtocolMessageType('G2C_SayHi', (_message.Message,), {
  'DESCRIPTOR' : _G2C_SAYHI,
  '__module__' : 'cg_pb2'
  # @@protoc_insertion_point(class_scope:cg.G2C_SayHi)
  })
_sym_db.RegisterMessage(G2C_SayHi)

C2G_KeepAlive = _reflection.GeneratedProtocolMessageType('C2G_KeepAlive', (_message.Message,), {
  'DESCRIPTOR' : _C2G_KEEPALIVE,
  '__module__' : 'cg_pb2'
  # @@protoc_insertion_point(class_scope:cg.C2G_KeepAlive)
  })
_sym_db.RegisterMessage(C2G_KeepAlive)

G2C_KeepAlive = _reflection.GeneratedProtocolMessageType('G2C_KeepAlive', (_message.Message,), {
  'DESCRIPTOR' : _G2C_KEEPALIVE,
  '__module__' : 'cg_pb2'
  # @@protoc_insertion_point(class_scope:cg.G2C_KeepAlive)
  })
_sym_db.RegisterMessage(G2C_KeepAlive)

C2G_Offline = _reflection.GeneratedProtocolMessageType('C2G_Offline', (_message.Message,), {
  'DESCRIPTOR' : _C2G_OFFLINE,
  '__module__' : 'cg_pb2'
  # @@protoc_insertion_point(class_scope:cg.C2G_Offline)
  })
_sym_db.RegisterMessage(C2G_Offline)

G2C_Offline = _reflection.GeneratedProtocolMessageType('G2C_Offline', (_message.Message,), {
  'DESCRIPTOR' : _G2C_OFFLINE,
  '__module__' : 'cg_pb2'
  # @@protoc_insertion_point(class_scope:cg.G2C_Offline)
  })
_sym_db.RegisterMessage(G2C_Offline)

C2G_OfflineNew = _reflection.GeneratedProtocolMessageType('C2G_OfflineNew', (_message.Message,), {
  'DESCRIPTOR' : _C2G_OFFLINENEW,
  '__module__' : 'cg_pb2'
  # @@protoc_insertion_point(class_scope:cg.C2G_OfflineNew)
  })
_sym_db.RegisterMessage(C2G_OfflineNew)

G2C_OfflineNew = _reflection.GeneratedProtocolMessageType('G2C_OfflineNew', (_message.Message,), {
  'DESCRIPTOR' : _G2C_OFFLINENEW,
  '__module__' : 'cg_pb2'
  # @@protoc_insertion_point(class_scope:cg.G2C_OfflineNew)
  })
_sym_db.RegisterMessage(G2C_OfflineNew)

G2C_Broadcast = _reflection.GeneratedProtocolMessageType('G2C_Broadcast', (_message.Message,), {
  'DESCRIPTOR' : _G2C_BROADCAST,
  '__module__' : 'cg_pb2'
  # @@protoc_insertion_point(class_scope:cg.G2C_Broadcast)
  })
_sym_db.RegisterMessage(G2C_Broadcast)

C2G_Activate = _reflection.GeneratedProtocolMessageType('C2G_Activate', (_message.Message,), {
  'DESCRIPTOR' : _C2G_ACTIVATE,
  '__module__' : 'cg_pb2'
  # @@protoc_insertion_point(class_scope:cg.C2G_Activate)
  })
_sym_db.RegisterMessage(C2G_Activate)

G2C_Activate = _reflection.GeneratedProtocolMessageType('G2C_Activate', (_message.Message,), {
  'DESCRIPTOR' : _G2C_ACTIVATE,
  '__module__' : 'cg_pb2'
  # @@protoc_insertion_point(class_scope:cg.G2C_Activate)
  })
_sym_db.RegisterMessage(G2C_Activate)


# @@protoc_insertion_point(module_scope)