//
//  二叉树镜像.swift
//  testMacOS
//
//  Created by 腾飞张 on 2025/3/27.
//

import Cocoa

class FlipTreeClass: NSObject {
    func flipTree(_ root: TreeNode?) -> TreeNode? {
        digui(root)
        return root
    }

    func digui(_ root: TreeNode?) {
        if root?.left == nil, root?.right == nil {
            return
        }
        var tmp = root?.left
        root?.left = root?.right
        root?.right = tmp
        
        digui(root?.left)
        digui(root?.right)
    }
}
