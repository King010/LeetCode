//
//  二叉树的深度.swift
//  testMacOS
//
//  Created by 腾飞张 on 2025/3/27.
//

import Cocoa

class CalculateDepthClass: NSObject {
    func calculateDepth(_ root: TreeNode?) -> Int {
        return digui(root)
    }

    func digui(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }

        let leftDepth = digui(root?.left) + 1
        let rightDepth = digui(root?.right) + 1

        return max(leftDepth, rightDepth)
    }
}
