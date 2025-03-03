//
//  二叉树的序列化和反序列化.swift
//  testMacOS
//
//  Created by 腾飞张 on 2025/3/3.
//

import Cocoa

/**
 
 输入：root = [1,2,3,null,null,4,5]
 
 输出：[1,2,3,null,null,4,5]
 
 "1,2,#,4,#,#,3,#,#,"
 
 https://leetcode.cn/problems/serialize-and-deserialize-binary-tree/
 */

class TreeSerializeDeserializeClass: NSObject {
    var serializeString = ""
    
    func serialize(_ root: TreeNode?) -> String {
        preOrder(root)
        return serializeString
    }
    
    func preOrder(_ root: TreeNode?) {
        if root == nil {
            serializeString.append("#,")
            return
        }
        serializeString.append("\(root?.val ?? 0),")
        preOrder(root?.left)
        preOrder(root?.right)
    }
    
    func deserialize(_ data: String) -> TreeNode? {
        var tmpData = data
        let sArray = Array(data)
        var newArray = sArray.split(separator: ",", omittingEmptySubsequences: false).map { arraySlice in
            String(arraySlice)
        }
        print(newArray)
        return deserializeInout(&newArray)
    }
    
    func deserializeInout(_ data: inout [String]) -> TreeNode? {
        let sArray = Array(data)
        if sArray.isEmpty {
            return nil
        }
        if sArray.first == "#" {
            data.removeFirst()
            return nil
        }
        let string = String(sArray.first!)
        let value = Int(string)!
        let root = TreeNode(value)
        data.removeFirst()
        let left = deserializeInout(&data)
        let right = deserializeInout(&data)
        root.left = left
        root.right = right
        return root
    }
    
    func main() {
//        let root = "12#4##3##"
        // 1,2,#,4,#,#,3,#,#,
//        let root = "1,2,#,4,#,#,3,#,#,"
        let root = "4,-7,-3,#,#,-9,-3,9,-7,-4,#,6,#,-6,-6,#,#,0,6,5,#,9,#,#,-1,-4,#,#,#,-2"
        let resultRootNode = deserialize(root)
        let resultString = serialize(resultRootNode)
        print(resultString)
    }
}
