//
//  从未排序的链表中移除重复元素.swift
//  testMacOS
//
//  Created by 腾飞张 on 2025/2/7.
//

import Foundation

class DeleteUnSortDuplicatesClass: NSObject {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        if head == nil {
            return nil
        }
        var head = head
        var currentNode = head
        var preNode: ListNode?

        while currentNode != nil {
            var nextNode = currentNode?.next
            var exist = false
            while nextNode != nil, nextNode!.val == currentNode!.val {
                nextNode = nextNode?.next
                exist = true
            }
            if !exist {
                preNode = currentNode
                currentNode = currentNode?.next
                preNode?.next = currentNode
            } else {
                if preNode == nil {
                    currentNode = nextNode
                    head = currentNode
                } else {
                    currentNode = nextNode
                    preNode?.next = currentNode
                }
            }
        }
        return head
    }

    func main() {
        let node1 = ListNode(1)
        let node2 = ListNode(2)
        let node3 = ListNode(3)
        let node4 = ListNode(2)
//        let node5 = ListNode(5)
//
//        let node31 = ListNode(3)
//        let node41 = ListNode(4)
//        let node42 = ListNode(4)

        node1.next = node2
        node2.next = node3
        node3.next = node4
//        node31.next = node4
//        node4.next = node5

        let result = deleteDuplicates(node1)
        print(result)
    }
}
