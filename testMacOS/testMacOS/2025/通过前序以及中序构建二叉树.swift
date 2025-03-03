//
//  通过前序以及中序构建二叉树.swift
//  testMacOS
//
//  Created by 腾飞张 on 2025/3/3.
//

import Cocoa

/**
 输入: preorder = [3,9,20,15,7], inorder = [9,3,15,20,7]
 输出: [3,9,20,null,null,15,7]
 */

class PIreorderBuildTreeClass: NSObject {
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        if preorder.isEmpty || inorder.isEmpty {
            return nil
        }
        let rootNode: (Int, Int) = (0, preorder.first!) // 0 是idx,  1是value
        var animIdx = 0
        for (idx, item) in inorder.enumerated() {
            if item == rootNode.1 {
                animIdx = idx
                break
            }
        }

        let newLeftOrder = Array(inorder[0..<animIdx])
        let newRightOrder = Array(inorder[(animIdx + 1)...])

        let newLeftPreOrder = Array(preorder[1..<(1 + newLeftOrder.count)])
        let newrightPreOrder = Array(preorder[(1 + newLeftOrder.count)...])

        let leftNode = buildTree(newLeftPreOrder, newLeftOrder)
        let rightNode = buildTree(newrightPreOrder, newRightOrder)
        let root = TreeNode(rootNode.1, leftNode, rightNode)
        return root
    }

    func buildTree1(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        if preorder.isEmpty || inorder.isEmpty { return nil }

        let rootVal = preorder.first! // 根节点值
        let root = TreeNode(rootVal)

        // 找到根节点在 inorder 的位置
        guard let rootIndex = inorder.firstIndex(of: rootVal) else { return nil }

        // 划分 inorder 左右子树
        let leftInorder = Array(inorder[..<rootIndex])
        let rightInorder = Array(inorder[(rootIndex + 1)...])

        // **划分 preorder 左右子树**
        let leftPreorder = Array(preorder[1..<(1 + leftInorder.count)]) // 左子树个数和 `leftInorder` 一样
        let rightPreorder = Array(preorder[(1 + leftInorder.count)...]) // 右子树的剩余部分

        root.left = buildTree(leftPreorder, leftInorder)
        root.right = buildTree(rightPreorder, rightInorder)

        return root
    }

    func main() {
        let preorder = [3, 9, 20, 15, 7], inorder = [9, 3, 15, 20, 7]
        let result = buildTree(preorder, inorder)
        print(result)
    }
}
