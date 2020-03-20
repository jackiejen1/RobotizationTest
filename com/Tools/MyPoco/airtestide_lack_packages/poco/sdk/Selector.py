# coding=utf-8
from .DefaultMatcher import DefaultMatcher
from .exceptions import NoSuchTargetException
import configparser, os,time
import threading

__author__ = 'lxn3032'
__all__ = ['ISelector', 'Selector']


class ISelector(object):
    """
    This interface defines the standard selector behavior. Selector is used for selecting the specific UI element(s)
    by given query expression (formal definitions are in specific implementation classes).
    """

    def select(self, cond, multiple=False):
        """
        Args:
            cond (:obj:`tuple`): query expressiom
            multiple (:obj:`bool`): whether or not to select the multiple elements. If set to True, the method
                                    terminates immediately once the node is found, otherwise it traverses through all
                                    nodes and then exists

        Returns:
            :obj:`list`: list <inherited from :py:class:`AbstractNode <poco.sdk.AbstractNode>`>
        """

        raise NotImplementedError


class Selector(ISelector):
    """
    This class implements the standard Selector interface that uses DFS algorithm to travers through tree-like hierarchy
    structure. It supports flexible query expressions such as parental relationship, attribute predicate, etc. Any
    combinations of expressions mentioned above are also allowed as the query conditions.
    
    The query expression can be defined as follows::

        expr := (op0, (expr0, expr1))
        expr := ('index', (expr, :obj:`int`))
        expr := <other query condition> See implementation of Matcher.

    - ``op0`` can be one of the following ('>', '/', '-'), each operator stands for as follows::

        '>': offsprings, select all offsprings matched expr1 from all roots matched expr0.
        '/': children, select all children matched expr1 from all roots matched expr0.
        '-': siblings, select all siblings matched expr1 from all roots matched expr0.
        '^': parent, select the parent of 1st UI element matched expr0. expr1 is always None.

    - ``'index'``: select specific n-th UI element from the previous results

    - ``others``: passes the expression to matcher

    Args:
        dumper (any implementation of :py:class:`IDumper <poco.sdk.AbstractDumper.IDumper>`):  dumper for the selector
        matcher (any implementation of :py:class:`IMatcher <poco.sdk.DefaultMatcher.IMatcher>`): :py:class:`DefaultMatcher
         <poco.sdk.DefaultMatcher.DefaultMatcher>` instance by default.
    """

    def __init__(self, dumper, matcher=None):
        self.dumper = dumper
        self.matcher = matcher or DefaultMatcher()

    def getRoot(self):
        """
        Get a default root node.

        Returns:
            default root node from the dumper.
        """
        start_time=time.time()
        # new_poco_dic = {"ui_path_list": []}
        # poco_subscript = 0
        # new_poco_dic = self.get_ui_tree_num(self.dumper.getRoot().__dict__, "", new_poco_dic, poco_subscript)
        new_poco_dic = self.get_ui_tree(self.dumper.getRoot().__dict__, {})# 新规则
        file_name = str(threading.get_ident())
        file_path = r"D:\\poco_list_file\\" + file_name + ".txt"
        with open(file_path, 'w') as f:
            f.write(str(new_poco_dic))
        end_time = time.time()
        use_time = end_time-start_time
        print("poco数据获取用时%f" % use_time)
        return self.dumper.getRoot()
    def get_ui_tree(self, dic,new_poco_dic):#用于新poco规则
        """
        遍历节点，生成字典{name:payload}
        :param dic: 根节点字典
        :param new_poco_dic: 生成的字典，贯穿整个UI树
        :return: new_poco_dic
        """
        dics = dic
        keys = dic.keys()
        if 'node' in keys:#第一次进来
            dics = dic['node']
            keys = dics.keys()
        if "name" in dics.keys():
            this_name = dics['name']
            new_poco_dic[this_name] = dics['payload']
        if "text" in dics['payload'].keys():
            # 获取text内容
            this_text = dics['payload']['text']
            if this_text != "":
                # text作为key
                # 名字、text都在元素列表里面
                new_poco_dic[this_text] = dics['payload']
        if 'children' in keys:
            childs_list = dics['children']
            for i in range(len(childs_list)):
                childs_dic = childs_list[i]
                new_poco_dic = self.get_ui_tree(childs_dic,new_poco_dic)

        return new_poco_dic
    def get_ui_tree_num(self, dic, ui_path, new_poco_dic, poco_subscript):
        dics = dic
        keys = dic.keys()
        if 'node' in keys:
            dics = dic['node']
            keys = dics.keys()
        # 名字加编号
        if "name" in dics.keys():
            this_name =  dics['name']
            if "未命名" in this_name:
                ui_path_name = this_name
            else:
                ui_path_name = this_name + str(poco_subscript)
            # 名字拼接路径
            ui_path = ui_path + ui_path_name
            new_poco_dic["ui_path_list"].append(ui_path_name)
            new_poco_dic["ui_path_list"].append(ui_path)
            # 名字加编号作为key
            new_poco_dic[ui_path_name] = dics['payload']
            # 名字拼接路径为key
            new_poco_dic[ui_path] = dics['payload']
        if "text" in dics['payload'].keys():
            # 获取text内容
            ui_path_text = dics['payload']['text']
            if ui_path_text != "":
                # text作为key
                # 名字加编号、名字拼接路径、text都在元素列表里面
                new_poco_dic["ui_path_list"].append(ui_path_text)
                new_poco_dic[ui_path_text] = dics['payload']
        if 'children' in keys:
            poco_subscript = 0
            children_name_list = []
            childs_list = dics['children']
            ui_path = ui_path + "/"
            for i in range(len(childs_list)):
                childs_dic = childs_list[i]
                # 遍历所有的子节点name储存起来,用来给重复的加编号
                if "name" in childs_dic.keys():
                    children_name_list.append(childs_dic["name"])
            for i in range(len(childs_list)):
                childs_dic = childs_list[i]
                if len(children_name_list)>0:
                    now_name = children_name_list.pop(0)# 因为删除之后列表改变，只删除最前面的即可
                    # 如果列表中还有一样的名字，就编号+1
                    new_poco_dic = self.get_ui_tree_num(childs_dic, ui_path, new_poco_dic, poco_subscript)
                    if now_name in children_name_list:#
                        poco_subscript = poco_subscript+1
                    else:
                    # 如果列表里面没有了，就置零
                        poco_subscript = 0
        return new_poco_dic

    def select(self, cond, multiple=False):
        """
        See Also: :py:meth:`select <poco.sdk.Selector.ISelector.select>` method in ``ISelector``.
        """
        return self.selectImpl(cond, multiple, self.getRoot(), 9999, True, True)

    def selectImpl(self, cond, multiple, root, maxDepth, onlyVisibleNode, includeRoot):
        """
        Selector internal implementation. 
        TODO: add later.

        .. note:: This doc shows only the outline of the algorithm. Do not call this method in your code as this
         is an internal method.

        Args:
            cond (:obj:`tuple`): query expression
            multiple (:obj:`bool`): whether or not to select multiple nodes. If true, all nodes that matches the given
             condition will return, otherwise, only the first node matches will.
            root (inherited from :py:class:`AbstractNode <poco.sdk.AbstractNode>`): start traversing from the given
             root node
            maxDepth (:obj:`bool`): max traversing depth
            onlyVisibleNode (:obj:`bool`): If True, skip those node which visibility (the value of visible attribute) is
             False.
            includeRoot (:obj:`bool`): whether not not to include the root node if its child(ren) match(es) the node

        Returns:
            :obj:`list` <inherited from :py:class:`AbstractNode <poco.sdk.AbstractNode>`>: The same as
             :py:meth:`select <poco.sdk.Selector.ISelector.select>`.
        """

        result = []
        if not root:
            return result

        op, args = cond
        if op in ('>', '/'):
            # children or offsprings
            # 父子直系相对节点选择
            parents = [root]
            for index, arg in enumerate(args):
                midResult = []
                for parent in parents:
                    if op == '/' and index != 0:
                        _maxDepth = 1
                    else:
                        _maxDepth = maxDepth
                    # 按路径进行遍历一定要multiple为true才不会漏掉
                    _res = self.selectImpl(arg, True, parent, _maxDepth, onlyVisibleNode, False)
                    [midResult.append(r) for r in _res if r not in midResult]
                parents = midResult
            result = parents
        elif op == '-':
            # sibling
            # 兄弟节点选择
            query1, query2 = args
            result1 = self.selectImpl(query1, multiple, root, maxDepth, onlyVisibleNode, includeRoot)
            for n in result1:
                sibling_result = self.selectImpl(query2, multiple, n.getParent(), 1, onlyVisibleNode, includeRoot)
                [result.append(r) for r in sibling_result if r not in result]
        elif op == 'index':
            cond, i = args
            try:
                # set multiple=True, self.selectImpl will return a list
                result = [self.selectImpl(cond, True, root, maxDepth, onlyVisibleNode, includeRoot)[i]]
            except IndexError:
                raise NoSuchTargetException(
                    u'Query results index out of range. Index={} condition "{}" from root "{}".'.format(i, cond, root))
        elif op == '^':
            # parent
            # only select parent of the first matched UI element
            query1, _ = args
            result1 = self.selectImpl(query1, False, root, maxDepth, onlyVisibleNode, includeRoot)
            if result1:
                parent_node = result1[0].getParent()
                if parent_node is not None:
                    result = [parent_node]
        else:
            self._selectTraverse(cond, root, result, multiple, maxDepth, onlyVisibleNode, includeRoot)
        return result

    def _selectTraverse(self, cond, node, outResult, multiple, maxDepth, onlyVisibleNode, includeRoot):
        # exclude invisible UI element if onlyVisibleNode specified
        # 剪掉不可见节点branch
        if onlyVisibleNode and not node.getAttr('visible'):
            return False

        if self.matcher.match(cond, node):
            # To select node from parent or ancestor, the parent or ancestor are excluded.
            # 父子/祖先后代节点选择时，默认是不包含父节点/祖先节点的
            # 在下面的children循环中则需要包含，因为每个child在_selectTraverse中就当做是root
            if includeRoot:
                if node not in outResult:
                    outResult.append(node)
                if not multiple:
                    return True

        # When maximum search depth reached, children of this node is still require to travers.
        # 最大搜索深度耗尽并不表示遍历结束，其余child节点仍需遍历
        if maxDepth == 0:
            return False
        maxDepth -= 1

        for child in node.getChildren():
            finished = self._selectTraverse(cond, child, outResult, multiple, maxDepth, onlyVisibleNode, True)
            if finished:
                return True

        return False
