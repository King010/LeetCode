//
//  通过中序和后续构建二叉树.swift
//  testMacOS
//
//  Created by 腾飞张 on 2025/3/3.
//

/**
 输入：inorder = [9,3,15,20,7], postorder = [9,15,7,20,3]
 输出：[3,9,20,null,null,15,7]

 */

import Cocoa

class IPorderBuildTreeClass: NSObject {
    func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        if inorder.isEmpty || postorder.isEmpty {
            return nil
        }
        guard let rootIndex = inorder.firstIndex(where: { value in
            value == postorder.last
        }) else { return nil }

        let leftInorder = Array(inorder[0..<rootIndex])
        let rightInorder = Array(inorder[(rootIndex+1)...])

        let leftPreOrder = Array(postorder[0..<leftInorder.count])
        let rightPreOrder = Array(postorder[leftInorder.count..<(postorder.count-1)])

        let leftNode = buildTree(leftInorder, leftPreOrder)
        let rightNode = buildTree(rightInorder, rightPreOrder)

        let rootNode = TreeNode(postorder.last!, leftNode, rightNode)
        return rootNode
    }
    
    func main() {
        let inorder = [2,1], postorder = [2,1]
        let result = buildTree(inorder, postorder)
        print(result)
    }
}
