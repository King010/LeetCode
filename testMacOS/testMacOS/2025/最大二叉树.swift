//
//  最大二叉树.swift
//  testMacOS
//
//  Created by 腾飞张 on 2025/3/3.
//

import Cocoa

/**
 输入：nums = [3,2,1,6,0,5]
 输出：[6,3,5,null,2,0,null,null,1]
 解释：递归调用如下所示：
 - [3,2,1,6,0,5] 中的最大值是 6 ，左边部分是 [3,2,1] ，右边部分是 [0,5] 。
     - [3,2,1] 中的最大值是 3 ，左边部分是 [] ，右边部分是 [2,1] 。
         - 空数组，无子节点。
         - [2,1] 中的最大值是 2 ，左边部分是 [] ，右边部分是 [1] 。
             - 空数组，无子节点。
             - 只有一个元素，所以子节点是一个值为 1 的节点。
     - [0,5] 中的最大值是 5 ，左边部分是 [0] ，右边部分是 [] 。
         - 只有一个元素，所以子节点是一个值为 0 的节点。
         - 空数组，无子节点。

 https://leetcode.cn/problems/maximum-binary-tree/description/
 
 思路，数组从最大值分为左右两个子数组，依次递归实现
 */

class ConstructMaximumBinaryTreeClass: NSObject {
    func constructMaximumBinaryTree(_ nums: [Int]) -> TreeNode? {
        if nums.count == 0 {
            return nil
        }
        var max: (Int, Int) = (Int.min, Int.min) // 0 是idx,  1是value
        for (idx, item) in nums.enumerated() {
            if item > max.1 {
                max.0 = idx
                max.1 = item
            }
        }

        let leftArray = Array(nums[0 ..< max.0])
        let rightArray = Array(nums[(max.0 + 1)...])
        let leftNode = constructMaximumBinaryTree(leftArray)
        let rightNode = constructMaximumBinaryTree(rightArray)
        let root = TreeNode(max.1, leftNode, rightNode)
        return root
    }

    func main() {
//        let Node4 = TreeNode(0, nil, nil)
//        let Node3 = TreeNode(8, nil, nil)
//        let Node2 = TreeNode(3, Node5, Node1)
//        let Node1 = TreeNode(1, Node0, Node8)
        let result = constructMaximumBinaryTree([3, 2, 1])
        print(result)
    }
}
