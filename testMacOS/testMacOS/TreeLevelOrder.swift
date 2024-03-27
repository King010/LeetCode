//
//  TreeLevel.swift
//  testMacOS
//
//  Created by 腾飞张 on 2024/3/25.
//

import Cocoa

/**
 https://leetcode.cn/problems/binary-tree-level-order-traversal/description/
 root = [3,9,20,null,null,15,7]
 输出：[[3],[9,20],[15,7]]
          3
        9       20
               15 7
  */
class TreeLevelOrder: NSObject {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        var list = [TreeNode]()
        guard let root = root else { return [[Int]]() }
        list.append(root)
        var result = [[Int]]()
        while list.count > 0 {
            var tmpValue = [Int]()
            for _ in 0 ..< list.count {
                if let leftNode = list.first?.left {
                    list.append(leftNode)
                }
                if let rightNode = list.first?.right {
                    list.append(rightNode)
                }
                if let val = list.first?.val {
                    tmpValue.append(val)
                }
                list.removeFirst()
            }
            result.append(tmpValue)
        }
        return result
    }
}
