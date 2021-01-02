# -*- coding: utf-8 -*-
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/protobuf/util/json_format.proto

from google.protobuf import symbol_database as _symbol_database, reflection as _reflection, message as _message, \
    descriptor as _descriptor

# @@protoc_insertion_point(imports)

_sym_db = _symbol_database.Default()




DESCRIPTOR = _descriptor.FileDescriptor(
  name='google/protobuf/util/json_format.proto',
  package='protobuf_unittest',
  syntax='proto2',
  serialized_options=None,
  serialized_pb=b'\n&google/protobuf/util/json_format.proto\x12\x11protobuf_unittest\"\x89\x01\n\x13TestFlagsAndStrings\x12\t\n\x01\x41\x18\x01 \x02(\x05\x12K\n\rrepeatedgroup\x18\x02 \x03(\n24.protobuf_unittest.TestFlagsAndStrings.RepeatedGroup\x1a\x1a\n\rRepeatedGroup\x12\t\n\x01\x66\x18\x03 \x02(\t\"!\n\x14TestBase64ByteArrays\x12\t\n\x01\x61\x18\x01 \x02(\x0c\"G\n\x12TestJavaScriptJSON\x12\t\n\x01\x61\x18\x01 \x01(\x05\x12\r\n\x05\x66inal\x18\x02 \x01(\x02\x12\n\n\x02in\x18\x03 \x01(\t\x12\x0b\n\x03Var\x18\x04 \x01(\t\"Q\n\x18TestJavaScriptOrderJSON1\x12\t\n\x01\x64\x18\x01 \x01(\x05\x12\t\n\x01\x63\x18\x02 \x01(\x05\x12\t\n\x01x\x18\x03 \x01(\x08\x12\t\n\x01\x62\x18\x04 \x01(\x05\x12\t\n\x01\x61\x18\x05 \x01(\x05\"\x89\x01\n\x18TestJavaScriptOrderJSON2\x12\t\n\x01\x64\x18\x01 \x01(\x05\x12\t\n\x01\x63\x18\x02 \x01(\x05\x12\t\n\x01x\x18\x03 \x01(\x08\x12\t\n\x01\x62\x18\x04 \x01(\x05\x12\t\n\x01\x61\x18\x05 \x01(\x05\x12\x36\n\x01z\x18\x06 \x03(\x0b\x32+.protobuf_unittest.TestJavaScriptOrderJSON1\"$\n\x0cTestLargeInt\x12\t\n\x01\x61\x18\x01 \x02(\x03\x12\t\n\x01\x62\x18\x02 \x02(\x04\"\xa0\x01\n\x0bTestNumbers\x12\x30\n\x01\x61\x18\x01 \x01(\x0e\x32%.protobuf_unittest.TestNumbers.MyType\x12\t\n\x01\x62\x18\x02 \x01(\x05\x12\t\n\x01\x63\x18\x03 \x01(\x02\x12\t\n\x01\x64\x18\x04 \x01(\x08\x12\t\n\x01\x65\x18\x05 \x01(\x01\x12\t\n\x01\x66\x18\x06 \x01(\r\"(\n\x06MyType\x12\x06\n\x02OK\x10\x00\x12\x0b\n\x07WARNING\x10\x01\x12\t\n\x05\x45RROR\x10\x02\"T\n\rTestCamelCase\x12\x14\n\x0cnormal_field\x18\x01 \x01(\t\x12\x15\n\rCAPITAL_FIELD\x18\x02 \x01(\x05\x12\x16\n\x0e\x43\x61melCaseField\x18\x03 \x01(\x05\"|\n\x0bTestBoolMap\x12=\n\x08\x62ool_map\x18\x01 \x03(\x0b\x32+.protobuf_unittest.TestBoolMap.BoolMapEntry\x1a.\n\x0c\x42oolMapEntry\x12\x0b\n\x03key\x18\x01 \x01(\x08\x12\r\n\x05value\x18\x02 \x01(\x05:\x02\x38\x01\"O\n\rTestRecursion\x12\r\n\x05value\x18\x01 \x01(\x05\x12/\n\x05\x63hild\x18\x02 \x01(\x0b\x32 .protobuf_unittest.TestRecursion\"\x86\x01\n\rTestStringMap\x12\x43\n\nstring_map\x18\x01 \x03(\x0b\x32/.protobuf_unittest.TestStringMap.StringMapEntry\x1a\x30\n\x0eStringMapEntry\x12\x0b\n\x03key\x18\x01 \x01(\t\x12\r\n\x05value\x18\x02 \x01(\t:\x02\x38\x01\"\xc4\x01\n\x14TestStringSerializer\x12\x15\n\rscalar_string\x18\x01 \x01(\t\x12\x17\n\x0frepeated_string\x18\x02 \x03(\t\x12J\n\nstring_map\x18\x03 \x03(\x0b\x32\x36.protobuf_unittest.TestStringSerializer.StringMapEntry\x1a\x30\n\x0eStringMapEntry\x12\x0b\n\x03key\x18\x01 \x01(\t\x12\r\n\x05value\x18\x02 \x01(\t:\x02\x38\x01\"$\n\x18TestMessageWithExtension*\x08\x08\x64\x10\x80\x80\x80\x80\x02\"z\n\rTestExtension\x12\r\n\x05value\x18\x01 \x01(\t2Z\n\x03\x65xt\x12+.protobuf_unittest.TestMessageWithExtension\x18\x64 \x01(\x0b\x32 .protobuf_unittest.TestExtension'
)



_TESTNUMBERS_MYTYPE = _descriptor.EnumDescriptor(
  name='MyType',
  full_name='protobuf_unittest.TestNumbers.MyType',
  filename=None,
  file=DESCRIPTOR,
  values=[
    _descriptor.EnumValueDescriptor(
      name='OK', index=0, number=0,
      serialized_options=None,
      type=None),
    _descriptor.EnumValueDescriptor(
      name='WARNING', index=1, number=1,
      serialized_options=None,
      type=None),
    _descriptor.EnumValueDescriptor(
      name='ERROR', index=2, number=2,
      serialized_options=None,
      type=None),
  ],
  containing_type=None,
  serialized_options=None,
  serialized_start=691,
  serialized_end=731,
)
_sym_db.RegisterEnumDescriptor(_TESTNUMBERS_MYTYPE)


_TESTFLAGSANDSTRINGS_REPEATEDGROUP = _descriptor.Descriptor(
  name='RepeatedGroup',
  full_name='protobuf_unittest.TestFlagsAndStrings.RepeatedGroup',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  fields=[
    _descriptor.FieldDescriptor(
      name='f', full_name='protobuf_unittest.TestFlagsAndStrings.RepeatedGroup.f', index=0,
      number=3, type=9, cpp_type=9, label=2,
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
  serialized_start=173,
  serialized_end=199,
)

_TESTFLAGSANDSTRINGS = _descriptor.Descriptor(
  name='TestFlagsAndStrings',
  full_name='protobuf_unittest.TestFlagsAndStrings',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  fields=[
    _descriptor.FieldDescriptor(
      name='A', full_name='protobuf_unittest.TestFlagsAndStrings.A', index=0,
      number=1, type=5, cpp_type=1, label=2,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
    _descriptor.FieldDescriptor(
      name='repeatedgroup', full_name='protobuf_unittest.TestFlagsAndStrings.repeatedgroup', index=1,
      number=2, type=10, cpp_type=10, label=3,
      has_default_value=False, default_value=[],
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
  ],
  extensions=[
  ],
  nested_types=[_TESTFLAGSANDSTRINGS_REPEATEDGROUP, ],
  enum_types=[
  ],
  serialized_options=None,
  is_extendable=False,
  syntax='proto2',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=62,
  serialized_end=199,
)


_TESTBASE64BYTEARRAYS = _descriptor.Descriptor(
  name='TestBase64ByteArrays',
  full_name='protobuf_unittest.TestBase64ByteArrays',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  fields=[
    _descriptor.FieldDescriptor(
      name='a', full_name='protobuf_unittest.TestBase64ByteArrays.a', index=0,
      number=1, type=12, cpp_type=9, label=2,
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
  serialized_start=201,
  serialized_end=234,
)


_TESTJAVASCRIPTJSON = _descriptor.Descriptor(
  name='TestJavaScriptJSON',
  full_name='protobuf_unittest.TestJavaScriptJSON',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  fields=[
    _descriptor.FieldDescriptor(
      name='a', full_name='protobuf_unittest.TestJavaScriptJSON.a', index=0,
      number=1, type=5, cpp_type=1, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
    _descriptor.FieldDescriptor(
      name='final', full_name='protobuf_unittest.TestJavaScriptJSON.final', index=1,
      number=2, type=2, cpp_type=6, label=1,
      has_default_value=False, default_value=float(0),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
    _descriptor.FieldDescriptor(
      name='in', full_name='protobuf_unittest.TestJavaScriptJSON.in', index=2,
      number=3, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=b"".decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
    _descriptor.FieldDescriptor(
      name='Var', full_name='protobuf_unittest.TestJavaScriptJSON.Var', index=3,
      number=4, type=9, cpp_type=9, label=1,
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
  serialized_start=236,
  serialized_end=307,
)


_TESTJAVASCRIPTORDERJSON1 = _descriptor.Descriptor(
  name='TestJavaScriptOrderJSON1',
  full_name='protobuf_unittest.TestJavaScriptOrderJSON1',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  fields=[
    _descriptor.FieldDescriptor(
      name='d', full_name='protobuf_unittest.TestJavaScriptOrderJSON1.d', index=0,
      number=1, type=5, cpp_type=1, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
    _descriptor.FieldDescriptor(
      name='c', full_name='protobuf_unittest.TestJavaScriptOrderJSON1.c', index=1,
      number=2, type=5, cpp_type=1, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
    _descriptor.FieldDescriptor(
      name='x', full_name='protobuf_unittest.TestJavaScriptOrderJSON1.x', index=2,
      number=3, type=8, cpp_type=7, label=1,
      has_default_value=False, default_value=False,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
    _descriptor.FieldDescriptor(
      name='b', full_name='protobuf_unittest.TestJavaScriptOrderJSON1.b', index=3,
      number=4, type=5, cpp_type=1, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
    _descriptor.FieldDescriptor(
      name='a', full_name='protobuf_unittest.TestJavaScriptOrderJSON1.a', index=4,
      number=5, type=5, cpp_type=1, label=1,
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
  serialized_start=309,
  serialized_end=390,
)


_TESTJAVASCRIPTORDERJSON2 = _descriptor.Descriptor(
  name='TestJavaScriptOrderJSON2',
  full_name='protobuf_unittest.TestJavaScriptOrderJSON2',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  fields=[
    _descriptor.FieldDescriptor(
      name='d', full_name='protobuf_unittest.TestJavaScriptOrderJSON2.d', index=0,
      number=1, type=5, cpp_type=1, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
    _descriptor.FieldDescriptor(
      name='c', full_name='protobuf_unittest.TestJavaScriptOrderJSON2.c', index=1,
      number=2, type=5, cpp_type=1, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
    _descriptor.FieldDescriptor(
      name='x', full_name='protobuf_unittest.TestJavaScriptOrderJSON2.x', index=2,
      number=3, type=8, cpp_type=7, label=1,
      has_default_value=False, default_value=False,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
    _descriptor.FieldDescriptor(
      name='b', full_name='protobuf_unittest.TestJavaScriptOrderJSON2.b', index=3,
      number=4, type=5, cpp_type=1, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
    _descriptor.FieldDescriptor(
      name='a', full_name='protobuf_unittest.TestJavaScriptOrderJSON2.a', index=4,
      number=5, type=5, cpp_type=1, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
    _descriptor.FieldDescriptor(
      name='z', full_name='protobuf_unittest.TestJavaScriptOrderJSON2.z', index=5,
      number=6, type=11, cpp_type=10, label=3,
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
  serialized_start=393,
  serialized_end=530,
)


_TESTLARGEINT = _descriptor.Descriptor(
  name='TestLargeInt',
  full_name='protobuf_unittest.TestLargeInt',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  fields=[
    _descriptor.FieldDescriptor(
      name='a', full_name='protobuf_unittest.TestLargeInt.a', index=0,
      number=1, type=3, cpp_type=2, label=2,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
    _descriptor.FieldDescriptor(
      name='b', full_name='protobuf_unittest.TestLargeInt.b', index=1,
      number=2, type=4, cpp_type=4, label=2,
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
  serialized_start=532,
  serialized_end=568,
)


_TESTNUMBERS = _descriptor.Descriptor(
  name='TestNumbers',
  full_name='protobuf_unittest.TestNumbers',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  fields=[
    _descriptor.FieldDescriptor(
      name='a', full_name='protobuf_unittest.TestNumbers.a', index=0,
      number=1, type=14, cpp_type=8, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
    _descriptor.FieldDescriptor(
      name='b', full_name='protobuf_unittest.TestNumbers.b', index=1,
      number=2, type=5, cpp_type=1, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
    _descriptor.FieldDescriptor(
      name='c', full_name='protobuf_unittest.TestNumbers.c', index=2,
      number=3, type=2, cpp_type=6, label=1,
      has_default_value=False, default_value=float(0),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
    _descriptor.FieldDescriptor(
      name='d', full_name='protobuf_unittest.TestNumbers.d', index=3,
      number=4, type=8, cpp_type=7, label=1,
      has_default_value=False, default_value=False,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
    _descriptor.FieldDescriptor(
      name='e', full_name='protobuf_unittest.TestNumbers.e', index=4,
      number=5, type=1, cpp_type=5, label=1,
      has_default_value=False, default_value=float(0),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
    _descriptor.FieldDescriptor(
      name='f', full_name='protobuf_unittest.TestNumbers.f', index=5,
      number=6, type=13, cpp_type=3, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
    _TESTNUMBERS_MYTYPE,
  ],
  serialized_options=None,
  is_extendable=False,
  syntax='proto2',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=571,
  serialized_end=731,
)


_TESTCAMELCASE = _descriptor.Descriptor(
  name='TestCamelCase',
  full_name='protobuf_unittest.TestCamelCase',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  fields=[
    _descriptor.FieldDescriptor(
      name='normal_field', full_name='protobuf_unittest.TestCamelCase.normal_field', index=0,
      number=1, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=b"".decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
    _descriptor.FieldDescriptor(
      name='CAPITAL_FIELD', full_name='protobuf_unittest.TestCamelCase.CAPITAL_FIELD', index=1,
      number=2, type=5, cpp_type=1, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
    _descriptor.FieldDescriptor(
      name='CamelCaseField', full_name='protobuf_unittest.TestCamelCase.CamelCaseField', index=2,
      number=3, type=5, cpp_type=1, label=1,
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
  serialized_start=733,
  serialized_end=817,
)


_TESTBOOLMAP_BOOLMAPENTRY = _descriptor.Descriptor(
  name='BoolMapEntry',
  full_name='protobuf_unittest.TestBoolMap.BoolMapEntry',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  fields=[
    _descriptor.FieldDescriptor(
      name='key', full_name='protobuf_unittest.TestBoolMap.BoolMapEntry.key', index=0,
      number=1, type=8, cpp_type=7, label=1,
      has_default_value=False, default_value=False,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
    _descriptor.FieldDescriptor(
      name='value', full_name='protobuf_unittest.TestBoolMap.BoolMapEntry.value', index=1,
      number=2, type=5, cpp_type=1, label=1,
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
  serialized_options=b'8\001',
  is_extendable=False,
  syntax='proto2',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=897,
  serialized_end=943,
)

_TESTBOOLMAP = _descriptor.Descriptor(
  name='TestBoolMap',
  full_name='protobuf_unittest.TestBoolMap',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  fields=[
    _descriptor.FieldDescriptor(
      name='bool_map', full_name='protobuf_unittest.TestBoolMap.bool_map', index=0,
      number=1, type=11, cpp_type=10, label=3,
      has_default_value=False, default_value=[],
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
  ],
  extensions=[
  ],
  nested_types=[_TESTBOOLMAP_BOOLMAPENTRY, ],
  enum_types=[
  ],
  serialized_options=None,
  is_extendable=False,
  syntax='proto2',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=819,
  serialized_end=943,
)


_TESTRECURSION = _descriptor.Descriptor(
  name='TestRecursion',
  full_name='protobuf_unittest.TestRecursion',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  fields=[
    _descriptor.FieldDescriptor(
      name='value', full_name='protobuf_unittest.TestRecursion.value', index=0,
      number=1, type=5, cpp_type=1, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
    _descriptor.FieldDescriptor(
      name='child', full_name='protobuf_unittest.TestRecursion.child', index=1,
      number=2, type=11, cpp_type=10, label=1,
      has_default_value=False, default_value=None,
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
  serialized_start=945,
  serialized_end=1024,
)


_TESTSTRINGMAP_STRINGMAPENTRY = _descriptor.Descriptor(
  name='StringMapEntry',
  full_name='protobuf_unittest.TestStringMap.StringMapEntry',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  fields=[
    _descriptor.FieldDescriptor(
      name='key', full_name='protobuf_unittest.TestStringMap.StringMapEntry.key', index=0,
      number=1, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=b"".decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
    _descriptor.FieldDescriptor(
      name='value', full_name='protobuf_unittest.TestStringMap.StringMapEntry.value', index=1,
      number=2, type=9, cpp_type=9, label=1,
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
  serialized_options=b'8\001',
  is_extendable=False,
  syntax='proto2',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=1113,
  serialized_end=1161,
)

_TESTSTRINGMAP = _descriptor.Descriptor(
  name='TestStringMap',
  full_name='protobuf_unittest.TestStringMap',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  fields=[
    _descriptor.FieldDescriptor(
      name='string_map', full_name='protobuf_unittest.TestStringMap.string_map', index=0,
      number=1, type=11, cpp_type=10, label=3,
      has_default_value=False, default_value=[],
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
  ],
  extensions=[
  ],
  nested_types=[_TESTSTRINGMAP_STRINGMAPENTRY, ],
  enum_types=[
  ],
  serialized_options=None,
  is_extendable=False,
  syntax='proto2',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=1027,
  serialized_end=1161,
)


_TESTSTRINGSERIALIZER_STRINGMAPENTRY = _descriptor.Descriptor(
  name='StringMapEntry',
  full_name='protobuf_unittest.TestStringSerializer.StringMapEntry',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  fields=[
    _descriptor.FieldDescriptor(
      name='key', full_name='protobuf_unittest.TestStringSerializer.StringMapEntry.key', index=0,
      number=1, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=b"".decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
    _descriptor.FieldDescriptor(
      name='value', full_name='protobuf_unittest.TestStringSerializer.StringMapEntry.value', index=1,
      number=2, type=9, cpp_type=9, label=1,
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
  serialized_options=b'8\001',
  is_extendable=False,
  syntax='proto2',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=1113,
  serialized_end=1161,
)

_TESTSTRINGSERIALIZER = _descriptor.Descriptor(
  name='TestStringSerializer',
  full_name='protobuf_unittest.TestStringSerializer',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  fields=[
    _descriptor.FieldDescriptor(
      name='scalar_string', full_name='protobuf_unittest.TestStringSerializer.scalar_string', index=0,
      number=1, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=b"".decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
    _descriptor.FieldDescriptor(
      name='repeated_string', full_name='protobuf_unittest.TestStringSerializer.repeated_string', index=1,
      number=2, type=9, cpp_type=9, label=3,
      has_default_value=False, default_value=[],
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
    _descriptor.FieldDescriptor(
      name='string_map', full_name='protobuf_unittest.TestStringSerializer.string_map', index=2,
      number=3, type=11, cpp_type=10, label=3,
      has_default_value=False, default_value=[],
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
  ],
  extensions=[
  ],
  nested_types=[_TESTSTRINGSERIALIZER_STRINGMAPENTRY, ],
  enum_types=[
  ],
  serialized_options=None,
  is_extendable=False,
  syntax='proto2',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=1164,
  serialized_end=1360,
)


_TESTMESSAGEWITHEXTENSION = _descriptor.Descriptor(
  name='TestMessageWithExtension',
  full_name='protobuf_unittest.TestMessageWithExtension',
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
  is_extendable=True,
  syntax='proto2',
  extension_ranges=[(100, 536870912), ],
  oneofs=[
  ],
  serialized_start=1362,
  serialized_end=1398,
)


_TESTEXTENSION = _descriptor.Descriptor(
  name='TestExtension',
  full_name='protobuf_unittest.TestExtension',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  fields=[
    _descriptor.FieldDescriptor(
      name='value', full_name='protobuf_unittest.TestExtension.value', index=0,
      number=1, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=b"".decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
  ],
  extensions=[
    _descriptor.FieldDescriptor(
      name='ext', full_name='protobuf_unittest.TestExtension.ext', index=0,
      number=100, type=11, cpp_type=10, label=1,
      has_default_value=False, default_value=None,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=True, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
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
  serialized_start=1400,
  serialized_end=1522,
)

_TESTFLAGSANDSTRINGS_REPEATEDGROUP.containing_type = _TESTFLAGSANDSTRINGS
_TESTFLAGSANDSTRINGS.fields_by_name['repeatedgroup'].message_type = _TESTFLAGSANDSTRINGS_REPEATEDGROUP
_TESTJAVASCRIPTORDERJSON2.fields_by_name['z'].message_type = _TESTJAVASCRIPTORDERJSON1
_TESTNUMBERS.fields_by_name['a'].enum_type = _TESTNUMBERS_MYTYPE
_TESTNUMBERS_MYTYPE.containing_type = _TESTNUMBERS
_TESTBOOLMAP_BOOLMAPENTRY.containing_type = _TESTBOOLMAP
_TESTBOOLMAP.fields_by_name['bool_map'].message_type = _TESTBOOLMAP_BOOLMAPENTRY
_TESTRECURSION.fields_by_name['child'].message_type = _TESTRECURSION
_TESTSTRINGMAP_STRINGMAPENTRY.containing_type = _TESTSTRINGMAP
_TESTSTRINGMAP.fields_by_name['string_map'].message_type = _TESTSTRINGMAP_STRINGMAPENTRY
_TESTSTRINGSERIALIZER_STRINGMAPENTRY.containing_type = _TESTSTRINGSERIALIZER
_TESTSTRINGSERIALIZER.fields_by_name['string_map'].message_type = _TESTSTRINGSERIALIZER_STRINGMAPENTRY
DESCRIPTOR.message_types_by_name['TestFlagsAndStrings'] = _TESTFLAGSANDSTRINGS
DESCRIPTOR.message_types_by_name['TestBase64ByteArrays'] = _TESTBASE64BYTEARRAYS
DESCRIPTOR.message_types_by_name['TestJavaScriptJSON'] = _TESTJAVASCRIPTJSON
DESCRIPTOR.message_types_by_name['TestJavaScriptOrderJSON1'] = _TESTJAVASCRIPTORDERJSON1
DESCRIPTOR.message_types_by_name['TestJavaScriptOrderJSON2'] = _TESTJAVASCRIPTORDERJSON2
DESCRIPTOR.message_types_by_name['TestLargeInt'] = _TESTLARGEINT
DESCRIPTOR.message_types_by_name['TestNumbers'] = _TESTNUMBERS
DESCRIPTOR.message_types_by_name['TestCamelCase'] = _TESTCAMELCASE
DESCRIPTOR.message_types_by_name['TestBoolMap'] = _TESTBOOLMAP
DESCRIPTOR.message_types_by_name['TestRecursion'] = _TESTRECURSION
DESCRIPTOR.message_types_by_name['TestStringMap'] = _TESTSTRINGMAP
DESCRIPTOR.message_types_by_name['TestStringSerializer'] = _TESTSTRINGSERIALIZER
DESCRIPTOR.message_types_by_name['TestMessageWithExtension'] = _TESTMESSAGEWITHEXTENSION
DESCRIPTOR.message_types_by_name['TestExtension'] = _TESTEXTENSION
_sym_db.RegisterFileDescriptor(DESCRIPTOR)

TestFlagsAndStrings = _reflection.GeneratedProtocolMessageType('TestFlagsAndStrings', (_message.Message,), {

  'RepeatedGroup' : _reflection.GeneratedProtocolMessageType('RepeatedGroup', (_message.Message,), {
    'DESCRIPTOR' : _TESTFLAGSANDSTRINGS_REPEATEDGROUP,
    '__module__' : 'google.protobuf.util.json_format_pb2'
    # @@protoc_insertion_point(class_scope:protobuf_unittest.TestFlagsAndStrings.RepeatedGroup)
    })
  ,
  'DESCRIPTOR' : _TESTFLAGSANDSTRINGS,
  '__module__' : 'google.protobuf.util.json_format_pb2'
  # @@protoc_insertion_point(class_scope:protobuf_unittest.TestFlagsAndStrings)
  })
_sym_db.RegisterMessage(TestFlagsAndStrings)
_sym_db.RegisterMessage(TestFlagsAndStrings.RepeatedGroup)

TestBase64ByteArrays = _reflection.GeneratedProtocolMessageType('TestBase64ByteArrays', (_message.Message,), {
  'DESCRIPTOR' : _TESTBASE64BYTEARRAYS,
  '__module__' : 'google.protobuf.util.json_format_pb2'
  # @@protoc_insertion_point(class_scope:protobuf_unittest.TestBase64ByteArrays)
  })
_sym_db.RegisterMessage(TestBase64ByteArrays)

TestJavaScriptJSON = _reflection.GeneratedProtocolMessageType('TestJavaScriptJSON', (_message.Message,), {
  'DESCRIPTOR' : _TESTJAVASCRIPTJSON,
  '__module__' : 'google.protobuf.util.json_format_pb2'
  # @@protoc_insertion_point(class_scope:protobuf_unittest.TestJavaScriptJSON)
  })
_sym_db.RegisterMessage(TestJavaScriptJSON)

TestJavaScriptOrderJSON1 = _reflection.GeneratedProtocolMessageType('TestJavaScriptOrderJSON1', (_message.Message,), {
  'DESCRIPTOR' : _TESTJAVASCRIPTORDERJSON1,
  '__module__' : 'google.protobuf.util.json_format_pb2'
  # @@protoc_insertion_point(class_scope:protobuf_unittest.TestJavaScriptOrderJSON1)
  })
_sym_db.RegisterMessage(TestJavaScriptOrderJSON1)

TestJavaScriptOrderJSON2 = _reflection.GeneratedProtocolMessageType('TestJavaScriptOrderJSON2', (_message.Message,), {
  'DESCRIPTOR' : _TESTJAVASCRIPTORDERJSON2,
  '__module__' : 'google.protobuf.util.json_format_pb2'
  # @@protoc_insertion_point(class_scope:protobuf_unittest.TestJavaScriptOrderJSON2)
  })
_sym_db.RegisterMessage(TestJavaScriptOrderJSON2)

TestLargeInt = _reflection.GeneratedProtocolMessageType('TestLargeInt', (_message.Message,), {
  'DESCRIPTOR' : _TESTLARGEINT,
  '__module__' : 'google.protobuf.util.json_format_pb2'
  # @@protoc_insertion_point(class_scope:protobuf_unittest.TestLargeInt)
  })
_sym_db.RegisterMessage(TestLargeInt)

TestNumbers = _reflection.GeneratedProtocolMessageType('TestNumbers', (_message.Message,), {
  'DESCRIPTOR' : _TESTNUMBERS,
  '__module__' : 'google.protobuf.util.json_format_pb2'
  # @@protoc_insertion_point(class_scope:protobuf_unittest.TestNumbers)
  })
_sym_db.RegisterMessage(TestNumbers)

TestCamelCase = _reflection.GeneratedProtocolMessageType('TestCamelCase', (_message.Message,), {
  'DESCRIPTOR' : _TESTCAMELCASE,
  '__module__' : 'google.protobuf.util.json_format_pb2'
  # @@protoc_insertion_point(class_scope:protobuf_unittest.TestCamelCase)
  })
_sym_db.RegisterMessage(TestCamelCase)

TestBoolMap = _reflection.GeneratedProtocolMessageType('TestBoolMap', (_message.Message,), {

  'BoolMapEntry' : _reflection.GeneratedProtocolMessageType('BoolMapEntry', (_message.Message,), {
    'DESCRIPTOR' : _TESTBOOLMAP_BOOLMAPENTRY,
    '__module__' : 'google.protobuf.util.json_format_pb2'
    # @@protoc_insertion_point(class_scope:protobuf_unittest.TestBoolMap.BoolMapEntry)
    })
  ,
  'DESCRIPTOR' : _TESTBOOLMAP,
  '__module__' : 'google.protobuf.util.json_format_pb2'
  # @@protoc_insertion_point(class_scope:protobuf_unittest.TestBoolMap)
  })
_sym_db.RegisterMessage(TestBoolMap)
_sym_db.RegisterMessage(TestBoolMap.BoolMapEntry)

TestRecursion = _reflection.GeneratedProtocolMessageType('TestRecursion', (_message.Message,), {
  'DESCRIPTOR' : _TESTRECURSION,
  '__module__' : 'google.protobuf.util.json_format_pb2'
  # @@protoc_insertion_point(class_scope:protobuf_unittest.TestRecursion)
  })
_sym_db.RegisterMessage(TestRecursion)

TestStringMap = _reflection.GeneratedProtocolMessageType('TestStringMap', (_message.Message,), {

  'StringMapEntry' : _reflection.GeneratedProtocolMessageType('StringMapEntry', (_message.Message,), {
    'DESCRIPTOR' : _TESTSTRINGMAP_STRINGMAPENTRY,
    '__module__' : 'google.protobuf.util.json_format_pb2'
    # @@protoc_insertion_point(class_scope:protobuf_unittest.TestStringMap.StringMapEntry)
    })
  ,
  'DESCRIPTOR' : _TESTSTRINGMAP,
  '__module__' : 'google.protobuf.util.json_format_pb2'
  # @@protoc_insertion_point(class_scope:protobuf_unittest.TestStringMap)
  })
_sym_db.RegisterMessage(TestStringMap)
_sym_db.RegisterMessage(TestStringMap.StringMapEntry)

TestStringSerializer = _reflection.GeneratedProtocolMessageType('TestStringSerializer', (_message.Message,), {

  'StringMapEntry' : _reflection.GeneratedProtocolMessageType('StringMapEntry', (_message.Message,), {
    'DESCRIPTOR' : _TESTSTRINGSERIALIZER_STRINGMAPENTRY,
    '__module__' : 'google.protobuf.util.json_format_pb2'
    # @@protoc_insertion_point(class_scope:protobuf_unittest.TestStringSerializer.StringMapEntry)
    })
  ,
  'DESCRIPTOR' : _TESTSTRINGSERIALIZER,
  '__module__' : 'google.protobuf.util.json_format_pb2'
  # @@protoc_insertion_point(class_scope:protobuf_unittest.TestStringSerializer)
  })
_sym_db.RegisterMessage(TestStringSerializer)
_sym_db.RegisterMessage(TestStringSerializer.StringMapEntry)

TestMessageWithExtension = _reflection.GeneratedProtocolMessageType('TestMessageWithExtension', (_message.Message,), {
  'DESCRIPTOR' : _TESTMESSAGEWITHEXTENSION,
  '__module__' : 'google.protobuf.util.json_format_pb2'
  # @@protoc_insertion_point(class_scope:protobuf_unittest.TestMessageWithExtension)
  })
_sym_db.RegisterMessage(TestMessageWithExtension)

TestExtension = _reflection.GeneratedProtocolMessageType('TestExtension', (_message.Message,), {
  'DESCRIPTOR' : _TESTEXTENSION,
  '__module__' : 'google.protobuf.util.json_format_pb2'
  # @@protoc_insertion_point(class_scope:protobuf_unittest.TestExtension)
  })
_sym_db.RegisterMessage(TestExtension)

_TESTEXTENSION.extensions_by_name['ext'].message_type = _TESTEXTENSION
TestMessageWithExtension.RegisterExtension(_TESTEXTENSION.extensions_by_name['ext'])

_TESTBOOLMAP_BOOLMAPENTRY._options = None
_TESTSTRINGMAP_STRINGMAPENTRY._options = None
_TESTSTRINGSERIALIZER_STRINGMAPENTRY._options = None
# @@protoc_insertion_point(module_scope)
