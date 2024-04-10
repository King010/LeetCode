//
//  根据前序和后序构造二叉树.swift
//  testMacOS
//
//  Created by 腾飞张 on 2024/4/2.
//

import Cocoa

/**
 preorder = [1,2,4,5,3,6,7], postorder = [4,5,2,6,7,3,1]
 输出：[1,2,3,4,5,6,7]
 
 https://leetcode.cn/problems/construct-binary-tree-from-preorder-and-postorder-traversal/description/
 */

class ConstructFromPrePostClass: NSObject {
    func constructFromPrePost(_ preorder: [Int], _ postorder: [Int]) -> TreeNode? {
        if preorder.count == 0 {
            return nil
        }
        
        var root = TreeNode(preorder.first!)
        if preorder.count == 1 {
            return root
        }
        
        var left = 0
        for i in 0..<postorder.count {
            if postorder[i] == preorder[1] {
                left = i + 1
            }
        }
        root.left = constructFromPrePost(Array( preorder[1..<left+1]), Array(postorder[0..<left]))
        root.right = constructFromPrePost(Array(preorder[left+1..<preorder.count]), Array(preorder[left..<postorder.count-1]))
        
        return root
    }
}
