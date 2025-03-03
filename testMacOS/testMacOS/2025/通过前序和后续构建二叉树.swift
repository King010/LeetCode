//
//  通过前序和后续构建二叉树.swift
//  testMacOS
//
//  Created by 腾飞张 on 2025/3/3.
//

/**
 输入：preorder = [1,2,4,5,3,6,7], postorder = [4,5,2,6,7,3,1]
 输出：[1,2,3,4,5,6,7]

 https://leetcode.cn/problems/construct-binary-tree-from-preorder-and-postorder-traversal/description/
 */

import Cocoa

class ConstructFromPrePostClass: NSObject {
    /**

     // 划分右子树
     let leftPostOrder = Array(postorder[0...leftRootIndex])
     let rightPostOrder = Array(postorder[leftRootIndex+1..<postorder.count-1])

        let leftPreOrder = Array(preorder[1...leftRootIndex+1])
     let rightPreOrder = Array(preorder[leftRootIndex+2...])

     */
    func constructFromPrePost(_ preorder: [Int], _ postorder: [Int]) -> TreeNode? {
        if preorder.isEmpty || postorder.isEmpty {
            return nil
        }
        let rootNode = TreeNode(preorder.first!)
        if preorder.count == 1 {
            return rootNode
        }
        guard let rootIndex = postorder.firstIndex(where: { value in
            value == preorder[1]
        }) else { return nil }

        let leftPostOrder = Array(postorder[...rootIndex])
        let rightPostOrder = Array(postorder[(rootIndex+1) ..< postorder.count - 1])

        let leftPreOrder = Array(preorder[1 ... leftPostOrder.count])
        let rightPreOrder = Array(preorder[(leftPostOrder.count+1)...])

        let leftNode = constructFromPrePost(leftPreOrder, leftPostOrder)
        let rightNode = constructFromPrePost(rightPreOrder, rightPostOrder)
        rootNode.left = leftNode
        rootNode.right = rightNode
        return rootNode
    }

    func main() {
        let preorder = [1, 2, 4, 5, 3, 6, 7], postorder = [4, 5, 2, 6, 7, 3, 1]
        let result = constructFromPrePost(preorder, postorder)
        print(result)
    }
}
