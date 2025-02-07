//
//  K个一组反转链表.swift
//  testMacOS
//
//  Created by 腾飞张 on 2024/3/28.
//

import Cocoa

/**
 输入：head = [1,2,3,4,5], k = 2
 输出：[2,1,4,3,5]
 */

class ReverseKGroupClass: NSObject {
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        let returnNode = ListNode(-1)
        returnNode.next = head
        var endNode: ListNode? = returnNode
        var preNode: ListNode? = returnNode
        returnNode.next = head
        while endNode?.next != nil {
            for _ in 0 ..< k {
                endNode = endNode?.next
            }
            if endNode == nil {
                break
            } else {
                let startNode = preNode?.next
                let endNextNode = endNode?.next
                endNode?.next = nil
                let newStartNode = reverseList(head: startNode)
                preNode?.next = newStartNode
                startNode?.next = endNextNode
                preNode = startNode
                endNode = preNode
            }
        }
        return returnNode.next
    }
    
    func main() {
        let node1 = ListNode(1)
        let node2 = ListNode(2)
        let node3 = ListNode(3)
        let node4 = ListNode(4)
        let node5 = ListNode(5)
        node1.next = node2
        node2.next = node3
        node3.next = node4
        node4.next = node5
        
        let newNode = reverseKGroup(node1, 2)
        print(newNode)
    }

    // 1  2  3
    func reverseList(head: ListNode?) -> ListNode? {
        var newHead = head
        var preNode: ListNode?
        var curNode = head
        while curNode != nil {
            let nextNode = curNode?.next
            curNode?.next = preNode
            preNode = curNode
            curNode = nextNode
        }
        return preNode
    }
}

