
from MyPoco.airtestide_lack_packages.google.protobuf import descriptor as descriptor_mod

FD = descriptor_mod.FieldDescriptor

def pb2dict(obj):
    adict = {}
    if not obj.IsInitialized():
        return None
    for field in obj.DESCRIPTOR.fields:
        if not getattr(obj, field.name):
            continue
        if not field.label == FD.LABEL_REPEATED:
            if not field.type == FD.TYPE_MESSAGE:
                adict[field.name] = getattr(obj, field.name)
            else:
                value = pb2dict(getattr(obj, field.name))
                if value:
                    adict[field.name] = value
        else:
            if field.type == FD.TYPE_MESSAGE:
                adict[field.name] = [pb2dict(v) for v in getattr(obj, field.name)]
            else:
                adict[field.name] = [v for v in getattr(obj, field.name)]
    return adict

# from types import StringTypes
import logging
l = logging.getLogger('dict_to_protbuf')
__all__ = ['dict_to_protobuf']

def parse_list(values, message):
    '''parse list to protobuf message'''
    if values:
        if isinstance(values[0], dict):  # value needs to be further parsed
            for v in values:
                cmd = message.add()
                parse_dict(v, cmd)
        else:  # value can be set
            message.extend(values)

def parse_dict(values, message):
    for k, v in values.items():
        if isinstance(v, dict):  # value needs to be further parsed
            parse_dict(v, getattr(message, k))
        elif isinstance(v, list):
            parse_list(v, getattr(message, k))
        else:  # value can be set
            try:
                setattr(message, k, v)
            except AttributeError:
                logging.basicConfig()
                l.warning('try to access invalid attributes %r.%r = %r', message, k, v)

def dict_to_protobuf(value, message):
    parse_dict(value, message)
