//
//  labuladong二叉树基础.swift
//  testMacOS
//
//  Created by 腾飞张 on 2025/2/27.
//

import Cocoa

class LabuladongTreeTestClass: NSObject {
    func getTreeNodeLevel(root: TreeNode, animNode: TreeNode) {}

    func getTreeNodeLevel(root: TreeNode?, animNode: TreeNode, depth: Int) -> Int {
        if root == nil {
            return -1
        }
        if root === animNode {
            return depth
        }
        var res = depth
        if let left = root?.left {
            res = getTreeNodeLevel(root: left, animNode: animNode, depth: depth + 1)
        }
        if let right = root?.right {
            res = getTreeNodeLevel(root: right, animNode: animNode, depth: depth + 1)
        }
        return res
    }
    
//    int /*count*/(TreeNode* root) {
    var count = 0
    func treeCount(root: TreeNode?) -> Int {
        if (root == nil) {
            return 0
        }
        let leftCount = treeCount(root: root?.left)
        let rightCount = treeCount(root: root?.right)
        return leftCount + rightCount + 1
    }
    
}
