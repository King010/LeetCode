//
//  二叉树展开为链表.swift
//  testMacOS
//
//  Created by 腾飞张 on 2025/3/1.
//

import Cocoa

class TreeNodeFlattenClass: NSObject {
    func flatten(_ root: TreeNode?) {
        if root == nil {
            return
        }
        flatten(root?.left)
        flatten(root?.right)
        
        let left = root?.left
        let right = root?.right
        
        root?.left = nil
        root?.right = left
        
//        let right = root?.right
//        root?.left?.right = right
//        root?.right = root?.left
//        root?.left = nil
        
        var p = root
        while p?.right != nil {
            p = p?.right
        }
        p?.right = right
    }
    
    func dfs(_ root: TreeNode?) {
        if root == nil {
            return
        }
        dfs(root?.left)
        dfs(root?.right)
        let rightList = root?.right
        root?.left?.right = rightList
        root?.right = root?.left
        root?.left = nil
        
    }
    
    
    func main() {
        
    }
    
}
