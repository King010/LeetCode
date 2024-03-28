//
//  环形链表.swift
//  testMacOS
//
//  Created by 腾飞张 on 2024/3/28.
//

import Cocoa

class HasCycleClass {
    func hasCycle(_ head: ListNode?) -> Bool {
        var fastNode = head
        var slowNode = head
        while fastNode?.next != nil, fastNode != nil {
            fastNode = fastNode?.next?.next
            slowNode = slowNode?.next
            if slowNode === fastNode {
                return true
            }
        }
        return false
    }
}
