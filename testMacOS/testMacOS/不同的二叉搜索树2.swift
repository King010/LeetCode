//
//  不同的二叉搜索树2.swift
//  testMacOS
//
//  Created by 腾飞张 on 2024/4/2.
//

import Cocoa

class GenerateTreesClass: NSObject {
    func generateTrees(_ n: Int) -> [TreeNode?] {
        return generateRoot(1, n)
    }

    func generateRoot(_ left: Int, _ right: Int) -> [TreeNode?] {
        var allTrees = [TreeNode?]()
        if left > right {
            allTrees.append(nil)
            return allTrees
        }
        for i in left ... right {
            var leftTrees = generateRoot(left, i - 1)
            var rightTrees = generateRoot(i + 1, right)
            for leftNode in leftTrees {
                for rightNode in rightTrees {
                    let current = TreeNode(i)
                    current.left = leftNode
                    current.right = rightNode
                    allTrees.append(current)
                }
            }
        }
        return allTrees
    }
}
