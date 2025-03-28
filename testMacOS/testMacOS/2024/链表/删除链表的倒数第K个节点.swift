//
//  删除链表的倒数第K个节点.swift
//  testMacOS
//
//  Created by 腾飞张 on 2024/3/29.
//

import Cocoa
//1,2,3,4,5
class RemoveNthFromEndClass: NSObject {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var newHead = head
        var number = n - 1
        while number > 0 {
            number -= 1
            newHead = newHead?.next
        }
        var tmpHead = head
        var preNode: ListNode?
        while newHead?.next != nil {
            preNode = tmpHead
            tmpHead = tmpHead?.next
            newHead = newHead?.next
        }
        
        if tmpHead === head {
            return head?.next
        }
        
        preNode?.next = tmpHead?.next
        return head
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
        let result = removeNthFromEnd(node1, 1)
        print(result)
        
    }
}
