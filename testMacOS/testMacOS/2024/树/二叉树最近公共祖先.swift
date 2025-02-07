//
//  最近公共祖先.swift
//  testMacOS
//
//  Created by 腾飞张 on 2024/3/27.
//

import Cocoa

/**

 输入：root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 1
 输出：3
 解释：节点 5 和节点 1 的最近公共祖先是节点 3 。
                        3
                 5                         1
            6               2           0             8
                   7  4
 https://leetcode.cn/problems/lowest-common-ancestor-of-a-binary-tree/description/
 */
//5  4
class LowestCommonAncestorClass: NSObject {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        if root == nil {
            return nil
        }

        if (root?.val == q?.val) || (root?.val == p?.val) {
            return root
        }
        let leftResult = lowestCommonAncestor(root?.left, p, q) // 5
        let rightResult = lowestCommonAncestor(root?.right, p, q)//
        if leftResult != nil, rightResult != nil {
            return root
        }
        if leftResult != nil {
            return leftResult
        }
        if rightResult != nil {
            return rightResult
        }
        return nil
    }
 
    //[37,-34,-48,null,-100,-101,48,null,null,null,null,-54,null,-71,-22,null,null,null,8]
    //-71  48
    
    /**
                                    37
                        -34                                             -48
                            -100                            -101     48
                                                   -54
                                                  -71  -22
     */
    func main() {
        let Node7 = TreeNode(7, nil, nil)
        let Node4 = TreeNode(4, nil, nil)
        let Node2 = TreeNode(2, Node7, Node4)
        let Node6 = TreeNode(6, nil, nil)
        let Node5 = TreeNode(5, Node6, Node2)
        let Node0 = TreeNode(0, nil, nil)
        let Node8 = TreeNode(8, nil, nil)
        let Node1 = TreeNode(1, Node0, Node8)
        let Node3 = TreeNode(3, Node5, Node1)
        let result = lowestCommonAncestor(Node3, Node5, Node4)
        print(result)
    }
    
//    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
//            return par(root, p, q)
//        }
//
//    func par(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
//        if root == nil {
//            return nil
//        }
//
//        if (root === q) || (root === p) {
//            return root
//        }
//        let leftResult = par(root?.left, p, q)
//        let rightResult = par(root?.right, p, q)
//        if (leftResult != nil) && (rightResult != nil) {
//            return root
//        }
//        if leftResult != nil {
//            return root?.left
//        }
//        if rightResult != nil {
//            return root?.right
//        }
//        return nil
//    }
}
