//
//  二叉树的右视图.swift
//  testMacOS
//
//  Created by 腾飞张 on 2024/3/29.
//

import Cocoa

/**
 //层序遍历取最后的值
 https://leetcode.cn/problems/binary-tree-right-side-view/submissions/518070547/
 */

class RightSideViewClass: NSObject {
    func rightSideView(_ root: TreeNode?) -> [Int] {
        var list = [TreeNode]()
        guard let root = root else { return [Int]() }
        list.append(root)
        var result = [Int]()
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
            if let last = tmpValue.last {
                result.append(last)
            }
        }
        return result
    }
}
