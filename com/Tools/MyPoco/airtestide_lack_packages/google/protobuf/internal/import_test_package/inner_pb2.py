# -*- coding: utf-8 -*-
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/protobuf/internal/import_test_package/inner.proto

from google.protobuf import symbol_database as _symbol_database, reflection as _reflection, message as _message, \
    descriptor as _descriptor

# @@protoc_insertion_point(imports)

_sym_db = _symbol_database.Default()




DESCRIPTOR = _descriptor.FileDescriptor(
  name='google/protobuf/internal/import_test_package/inner.proto',
  package='google.protobuf.python.internal.import_test_package',
  syntax='proto2',
  serialized_options=None,
  serialized_pb=b'\n8google/protobuf/internal/import_test_package/inner.proto\x12\x33google.protobuf.python.internal.import_test_package\"\x1a\n\x05Inner\x12\x11\n\x05value\x18\x01 \x01(\x05:\x02\x35\x37'
)




_INNER = _descriptor.Descriptor(
  name='Inner',
  full_name='google.protobuf.python.internal.import_test_package.Inner',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  fields=[
    _descriptor.FieldDescriptor(
      name='value', full_name='google.protobuf.python.internal.import_test_package.Inner.value', index=0,
      number=1, type=5, cpp_type=1, label=1,
      has_default_value=True, default_value=57,
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
  serialized_start=113,
  serialized_end=139,
)

DESCRIPTOR.message_types_by_name['Inner'] = _INNER
_sym_db.RegisterFileDescriptor(DESCRIPTOR)

Inner = _reflection.GeneratedProtocolMessageType('Inner', (_message.Message,), {
  'DESCRIPTOR' : _INNER,
  '__module__' : 'google.protobuf.internal.import_test_package.inner_pb2'
  # @@protoc_insertion_point(class_scope:google.protobuf.python.internal.import_test_package.Inner)
  })
_sym_db.RegisterMessage(Inner)


# @@protoc_insertion_point(module_scope)
