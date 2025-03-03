//
//  填充节点的右侧指针.swift
//  testMacOS
//
//  Created by 腾飞张 on 2025/3/1.
//

import Cocoa

class ConnectTreeNodeNextClass: NSObject {
    func connect(_ root: Node?) -> Node? {
        var queue = [Node]()
        if let root = root {
            queue.append(root)
        }
        var levelArray = [Node]()
        while !queue.isEmpty {
            var index = 0
            while index + 1 < levelArray.count {
                levelArray[index].next = levelArray[index+1]
                index = index + 1
            }
            levelArray.removeAll()
            for _ in 0..<queue.count {
                let node = queue.first!
                queue.removeFirst()
                if let left = node.left {
                    queue.append(left)
                    levelArray.append(left)
                }
                if let right = node.right {
                    queue.append(right)
                    levelArray.append(right)
                }
            }
            
        }
        return root
    }
    
    func connect2(_ root: Node?) -> Node? {
        var queue = [Node]()
        if let root = root {
            queue.append(root)
        }
        while !queue.isEmpty {
            var index = 0
            while index + 1 < queue.count {
                queue[index].next = queue[index+1]
                index = index + 1
            }
            for _ in 0..<queue.count {
                let node = queue.first!
                queue.removeFirst()
                if let left = node.left {
                    queue.append(left)
                }
                if let right = node.right {
                    queue.append(right)
                }
            }
        }
        return root
    }
    
    func dfs(_ root1: Node?, _ root2: Node?) {
        if root1 == nil || root2 == nil {
            return
        }
        root1?.next = root2
        dfs(root1?.left, root1?.right)
        dfs(root1?.right, root2?.left)
        dfs(root2?.left, root2?.right)
    }
    
    func main() {
        
    }
}
