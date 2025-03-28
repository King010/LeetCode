//
//  临时算法文件.swift
//  testMacOS
//
//  Created by 腾飞张 on 2025/3/24.
//

import Cocoa

/**

        1
            2
        3       4
                    5

 */

class TempFunctionClass: NSObject {
    var res = [Int]()

    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        if root == nil {
            return res
        }
        postOrder(root)
        return res
    }

    func postOrder(_ root: TreeNode?) {
        if root == nil {
            return
        }
        postOrder(root?.left)
        postOrder(root?.right)
        res.append(root!.val)
    }

    /**
                        3
                    9               20
                        15          7

     */

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
//        let result = postOrderTraversal(Node3)
        // [[3], [20, 9], [15, 7]]
//        print(result)
    }
}
