//
//  二叉树的锯齿形层序遍历.swift
//  testMacOS
//
//  Created by 腾飞张 on 2024/3/27.
//

import Cocoa

/**
 输入：root = [3,9,20,null,null,15,7]
 输出：[[3],[20,9],[15,7]]

                3
            9         20
                    15   16

 [[3],[9,15],[20],[15,7]]

 [3,9,20,null,null,15,7]

 */

class ZigzagLevelOrderClass: NSObject {
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        var queue = [TreeNode]()
        var result = [[Int]]()
        guard let root else { return result }
        queue.append(root)
        var state = false
        // 3  20  9
        while queue.count > 0 {
            var currentResult = [Int]()
            let count = queue.count
            for _ in 0 ..< count {
                if let currentLeft = queue.first?.left {
                    queue.append(currentLeft)
                }
                if let currentRight = queue.first?.right {
                    queue.append(currentRight)
                }
                if state {
                    currentResult.insert(queue.first!.val, at: 0)
                } else {
                    currentResult.append(queue.first!.val)
                }
                queue.removeFirst()
            }
            result.append(currentResult)
            state = !state
        }
        return result
    }

    func main() {
        let Node3 = TreeNode(3, nil, nil)
        let Node9 = TreeNode(9, nil, nil)
        let Node20 = TreeNode(20, nil, nil)
        let Node15 = TreeNode(15, nil, nil)
        let Node7 = TreeNode(7, nil, nil)
        Node3.left = Node9
        Node3.right = Node20
        Node20.left = Node15
        Node20.right = Node7
        let result = zigzagLevelOrder(Node3)
        print(result)
    }
}
