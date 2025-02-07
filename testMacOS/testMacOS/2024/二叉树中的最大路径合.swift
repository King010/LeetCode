//
//  二叉树中的最大路径合.swift
//  testMacOS
//
//  Created by 腾飞张 on 2024/3/29.
//

import Cocoa

class TreeMaxPathSumClass: NSObject {
    var maxSum = Int.min

    func maxPathSum(_ root: TreeNode?) -> Int {
        getMaxSumNode(root)
        return maxSum
    }
    
    func getMaxSumNode(_ root: TreeNode?) -> Int {
        if (root == nil) {
            return 0
        }
        var leftMax = 0
        var rightMax = 0
        if let leftNode = root?.left {
            leftMax = max(0, getMaxSumNode(leftNode))
        }
        if let rightNode = root?.right {
            rightMax = max(0, getMaxSumNode(rightNode))
        }
        
        maxSum = max(maxSum, ((root?.val ?? 0) + leftMax + rightMax))
        return (root?.val ?? 0) + max(leftMax, rightMax)
    }
    
    func main() {
        let Node3 = TreeNode(3, nil, nil)
        let Node2 = TreeNode(2, nil, nil)
        let Node1 = TreeNode(1, Node2, Node3)
        
        let result = maxPathSum(Node1)
        print(result)
    }
    
}
