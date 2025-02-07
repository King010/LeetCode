//
//  重排链表.swift
//  testMacOS
//
//  Created by 腾飞张 on 2024/3/28.
//

import Cocoa

/**
 输入：head = [1,2,3,4]
 输出：[1,4,2,3]

 1,2,3,4,5,6,7

 白话文：倒数第一个插到第一个后面，倒数第二个插到原第二个后面
 思路，找到中间节点，翻转中间节点后的链表
 再讲两个链表合并

 */

class ReorderListClass: NSObject {
    func reorderList(_ head: ListNode?) {
        var length = 0
        var head1 = head
        while head1 != nil {
            length += 1
            head1 = head1?.next
        }
        let middleNode = findMiddleNode(head)
        let rightNode = middleNode?.next
        middleNode?.next = nil
        let list2Head = reverseList(head: rightNode)
        mergeTowList(head, list2Head, length)
    }

    /**
        1,2,3
        4,5,6
     */
    func mergeTowList(_ h1: ListNode?, _ h2: ListNode?, _ length: Int) -> ListNode? {
        var head1 = h1
        var head2 = h2
        let length = length
        var head1Next: ListNode?
        var head2Next: ListNode?
        var state = true
        for _ in 0 ..< length {
            if state {
                head1Next = head1?.next
                head1?.next = head2
                head1 = head1Next
            } else {
                head2Next = head2?.next
                head2?.next = head1
                head2 = head2Next
            }
            state = !state
        }
        return h1
    }

    // 1,2,3,4
    func findMiddleNode(_ head: ListNode?) -> ListNode? {
        var fastNode = head
        var slowNode = head
        while fastNode?.next?.next != nil {
            fastNode = fastNode?.next?.next
            slowNode = slowNode?.next
        }
        return slowNode
    }

    func findMiddleNode1(_ head: ListNode?) -> ListNode? {
        var fastNode = head
        var slowNode = head
        while fastNode != nil, fastNode?.next != nil {
            slowNode = slowNode?.next
            fastNode = fastNode?.next?.next
        }
        return slowNode
    }

    func reverseList(head: ListNode?) -> ListNode? {
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

    func main() {
        let node1 = ListNode(1)
        let node2 = ListNode(2)
        let node3 = ListNode(3)
        let node4 = ListNode(4)
        let node5 = ListNode(5)
        let node6 = ListNode(6)
        node1.next = node2
        node2.next = node3

        node3.next = node4
//        node4.next = node5
//        node5.next = node6
        findMiddleNode1(node1)
//        reorderList(node1)
//        mergeTowList(node1, node4, 6)
        print(node1)
    }
}

// class ReorderListClass: NSObject {
//    func reorderList(_ head: ListNode?) {
//        var length = 0
//        var tmpHead = head
//        while tmpHead != nil {
//            tmpHead = tmpHead?.next
//            length += 1
//        }
//        for idx in 0..<length {
//            insetLastNodeInAnim(head, idx)
//        }
//    }
//
//
//    func insetLastNodeInAnim(_ head: ListNode?, _ index: Int) {
//        var preHead = head
//        var index = index
//        var insertNode = head
//        var head = head
//        while head?.next != nil {
//            preHead = head
//            head = head?.next
//        }
//        preHead?.next = nil
//        while index > 0 {
//            index -= 1
//            insertNode = insertNode?.next
//        }
//        let rightNode = insertNode?.next
//        insertNode?.next = head
//        head?.next = rightNode
//    }
//
//    func main() {
//        let node1 = ListNode(1)
//        let node2 = ListNode(2)
//        let node3 = ListNode(3)
//        let node4 = ListNode(4)
//        let node5 = ListNode(5)
//        node1.next = node2
//        node2.next = node3
//        node3.next = node4
//        node4.next = node5
//
//        insetLastNodeInAnim(node1, 1)
//        print(node1)
//    }
//
////    func findLastKNode(_ head: ListNode?, _ index: Int) -> ListNode? {
////        var tailNode = head
////        var index = index
////        while index > 0 {
////            index -= 1
////            tailNode = tailNode?.next
////        }
////        var tmpNode = head
////        while tailNode?.next != nil {
////            tmpNode = tmpNode?.next
////            tailNode = tailNode?.next
////        }
////        return tmpNode
////    }
// }
