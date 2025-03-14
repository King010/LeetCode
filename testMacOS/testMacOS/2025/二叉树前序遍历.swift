//
//  二叉树前序遍历.swift
//  testMacOS
//
//  Created by 腾飞张 on 2025/3/3.
//

import Cocoa

class PreOrderTreeNodeClass: NSObject {
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        var res = [Int]()
        if root == nil {
            return res
        }
        var stack = [TreeNode]()
        var tmpRoot = root
        while stack.count > 0 || tmpRoot != nil {
            while tmpRoot != nil {
                res.append(tmpRoot!.val)
                stack.append(tmpRoot!)
                tmpRoot = tmpRoot?.left
            }
            let currentNode = stack.last
            stack.removeLast()
            tmpRoot = currentNode?.right
        }
        return res
    }
    
//    输入：root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 1
//    输出：3
//    解释：节点 5 和节点 1 的最近公共祖先是节点 3 。
//                           3
//                    5                1
//               6         2        0     8
//                        7  4
//[6, 5, 7, 2, 4, 3, 0, 1, 8]
    
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var res = [Int]()
        if root == nil {
            return res
        }
        var stack = [TreeNode]()
        var tmpRoot = root
        while stack.count > 0 || tmpRoot != nil {
            while tmpRoot != nil {
                stack.append(tmpRoot!)
                tmpRoot = tmpRoot?.left
            }
            let currentNode = stack.last
            res.append(currentNode!.val)
            stack.removeLast()
            tmpRoot = currentNode?.right
        }
        return res
    }
    
    /**
                1
                    2
                        3
                            4
     */
    
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        var res = [Int]()
        if root == nil {
            return res
        }
        var stack = [TreeNode]()
        var tmpRoot = root
        var preNode: TreeNode?
        while stack.count > 0 || tmpRoot != nil {
            while tmpRoot != nil {
                stack.append(tmpRoot!)
                tmpRoot = tmpRoot?.left
            }
            let currentNode = stack.last
            if currentNode?.right != nil && currentNode !== preNode {
                tmpRoot = currentNode?.right
            } else {
                preNode = currentNode
                res.append(currentNode!.val)
                stack.removeLast()
                tmpRoot = nil
            }
        }
        return res
    }

    func main() {
//        let Node7 = TreeNode(7, nil, nil)
//        let Node4 = TreeNode(4, nil, nil)
//        let Node2 = TreeNode(2, Node7, Node4)
//        let Node6 = TreeNode(6, nil, nil)
//        let Node5 = TreeNode(5, Node6, Node2)
//        let Node0 = TreeNode(0, nil, nil)
//        let Node8 = TreeNode(8, nil, nil)
//        let Node1 = TreeNode(1, Node0, Node8)
//        let Node3 = TreeNode(3, Node5, Node1)
        
        let Node4 = TreeNode(4, nil, nil)
        let Node3 = TreeNode(3, nil, Node4)
        let Node2 = TreeNode(2, nil, Node3)
        let Node1 = TreeNode(1, nil, Node2)

        let result = postorderTraversal(Node1)
        print(result)
    }
}
