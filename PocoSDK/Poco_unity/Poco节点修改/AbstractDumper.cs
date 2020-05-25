using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;


namespace Poco
{
    public class AbstractDumper : IDumper
    {
        public virtual AbstractNode getRoot()
        {
            return null;
        }

        public Dictionary<string, object> dumpHierarchy()
        {
            return dumpHierarchyImpl(getRoot(), true, "", nodeDic);
        }
        public Dictionary<string, object> dumpHierarchy(bool onlyVisibleNode)
        {
            return dumpHierarchyImpl(getRoot(), onlyVisibleNode, "", nodeDic);
        }
        /// <summary>
        ///  父节点
        /// </summary>
        private string parentName = string.Empty;
        /// <summary>
        /// key:节点名字
        /// value：出现次数
        /// </summary>
        private Dictionary<string, int> nodeDic =  new Dictionary<string, int>();
        private Dictionary<string, object> dumpHierarchyImpl(AbstractNode node, bool onlyVisibleNode, string parentName,Dictionary<string,int> curDic)
        {
            if (node == null)
            {
                return null;
            }
            Dictionary<string, object> payload = node.enumerateAttrs();
            Dictionary<string, object> result = new Dictionary<string, object>();
            //当前节点名字
            string name = (string)node.getAttr("name");
            if (!curDic.ContainsKey(name))
            {
                if (!string.IsNullOrEmpty(name))
                {
                    curDic.Add(name, 0);
                }
            }
            else
            {
                //子节点索引递增
                int value = curDic[name] + 1;
                curDic[name] = value;
                name += value.ToString();
;            }

            if (!string.IsNullOrEmpty(parentName))
            {
                if (!string.IsNullOrEmpty(name))
                {
                    name = parentName + "/" + name;
                }
                else
                    name = parentName;
            }
           
            result.Add("name",name);
            payload["name"] = name;
            result.Add("payload", payload);

            List<object> children = new List<object>();
            //当前兄弟节点
            Dictionary<string, int> curNodeDic = new Dictionary<string, int>();
            foreach (AbstractNode child in node.getChildren())
            {
                if (!onlyVisibleNode || (bool)child.getAttr("visible"))
                {
                    children.Add(dumpHierarchyImpl(child, onlyVisibleNode, name, curNodeDic));
                }
            }
            if (children.Count > 0)
            {
                result.Add("children", children);
                curNodeDic.Clear();
            }
            return result;
        }

        public virtual List<float> getPortSize()
        {
            return null;
        }
    }

    public interface IDumper
    {
        AbstractNode getRoot();

        Dictionary<string, object> dumpHierarchy();
        Dictionary<string, object> dumpHierarchy(bool onlyVisibleNode);

        List<float> getPortSize();
    }
}
