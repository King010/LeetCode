//
//  LRU缓存.swift
//  testMacOS
//
//  Created by 腾飞张 on 2024/3/28.
//

import Cocoa

class LinkedNode {
    var key: Int
    var val: Int
    var preNode: LinkedNode?
    var nextNode: LinkedNode?
    
    init(key: Int, val: Int, preNode: LinkedNode? = nil, nextNode: LinkedNode? = nil) {
        self.key = key
        self.val = val
        self.preNode = preNode
        self.nextNode = nextNode
    }
}

class LRUCache {
    var capacity = 0
    var headNode = LinkedNode(key: 0, val: 0)
    var tailNode = LinkedNode(key: 0, val: 0)
    var container = [Int: LinkedNode]()
    var hasCount = 0
    init(_ capacity: Int) {
        self.capacity = capacity
        headNode.nextNode = tailNode
        tailNode.preNode = headNode
    }
    
    func get(_ key: Int) -> Int {
        if let node = container[key] {
            removeNode(key: key)
            insertNode(key, node.val)
            return node.val
        }
        return -1
    }
    
    func put(_ key: Int, _ value: Int) {
        if var node = container[key] {
            node.val = value
            self.removeNode(key: key)
            self.insertNode(key, value)
        } else {
            if hasCount == 0 {
                headNode.nextNode = tailNode
                tailNode.nextNode = headNode
            }
            if hasCount >= capacity {
                removeTail()
            }
            insertNode(key, value)
        }
    }
    
    func insertNode(_ key: Int, _ value: Int) {
        let newNode = LinkedNode(key: key, val: value)
        let nextNode = headNode.nextNode
        nextNode?.preNode = newNode
        headNode.nextNode = newNode
        newNode.preNode = headNode
        newNode.nextNode = nextNode
        container[key] = newNode
        hasCount += 1
    }
    
    func removeTail() {
        if let node = tailNode.preNode {
            node.preNode?.nextNode = tailNode
            tailNode.preNode = node.preNode
            node.nextNode = nil
            node.preNode = nil
            hasCount -= 1
            container.removeValue(forKey: node.key)
        }
    }
    
    func removeNode(key: Int) {
        if let node = container[key] {
            let nextNode = node.nextNode
            node.preNode?.nextNode = nextNode
            node.nextNode?.preNode = node.preNode
            node.preNode = nil
            node.nextNode = nil
            hasCount -= 1
        }
    }
}
/**
 * Your LRUCache object will be instantiated and called as such:
 * let obj = LRUCache(capacity)
 * let ret_1: Int = obj.get(key)
 * obj.put(key, value)
 */
