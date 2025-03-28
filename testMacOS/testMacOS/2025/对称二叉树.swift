//
//  对称二叉树.swift
//  testMacOS
//
//  Created by 腾飞张 on 2025/3/27.
//

import Cocoa

class IsSymmetricClass: NSObject {
    func isSymmetric(_ root: TreeNode?) -> Bool {
        var res = false
        res = digui(root?.left, root?.right)
        return res
    }

    func digui(_ leftNode: TreeNode?, _ rightNode: TreeNode?) -> Bool {
        if leftNode == nil, rightNode == nil {
            return true
        }
        if leftNode?.val == rightNode?.val {
            return digui(leftNode?.left, rightNode?.right) && digui(leftNode?.right, rightNode?.left)
        } else {
            return false
        }
    }
}
