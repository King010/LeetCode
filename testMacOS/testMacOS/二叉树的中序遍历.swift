//
//  二叉树的中序遍历.swift
//  testMacOS
//
//  Created by 腾飞张 on 2024/3/29.
//

import Cocoa

/**
 
                1
            2       3
        4     5         6
            8   9
 
                1
                    2
                  3
 
 https://leetcode.cn/problems/binary-tree-inorder-traversal/
 */

class InorderTraversal: NSObject {
    var res = [Int]()
    
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        feidigui(root)
        return res
    }
    
    func feidigui(_ root: TreeNode?) {
        var stack = [TreeNode]()
        var tmpRoot = root
        guard let root else { return }
       
        while stack.count > 0 || tmpRoot != nil {
            while tmpRoot != nil {
                stack.append(tmpRoot!)
                tmpRoot = tmpRoot?.left
            }
            var currentNode = stack.last
            res.append(stack.last!.val)
            stack.removeLast()
            tmpRoot = currentNode?.right
        }
    }
    
    func main() {
        let Node3 = TreeNode(3, nil, nil)
        let Node2 = TreeNode(2, nil, nil)
        let Node1 = TreeNode(1, nil, Node2)
        Node2.left = Node3
        let result = inorderTraversal(Node1)
        print(result)
    }
    
    func digui(_ root: TreeNode?) {
        guard let root else { return }
        if let leftNode = root.left {
            digui(leftNode)
        }
        res.append(root.val)
        if let rightNode = root.right {
            digui(rightNode)
        }
    }
}
