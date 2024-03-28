//
//  翻转链表2.swift
//  testMacOS
//
//  Created by 腾飞张 on 2024/3/27.
//

import Cocoa

/**
 输入：head = [1,2,3,4,5], left = 2, right = 4
 输出：[1,4,3,2,5]
 https://leetcode.cn/problems/reverse-linked-list-ii/description/

 //  [3,5]   1,  2
  */
class ListReverseBetween: NSObject {
    func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
        var leftNode = head
        var rightNode: ListNode? = head
        var preNode: ListNode?

        var start = 1
        while start < right, rightNode != nil {
            rightNode = rightNode?.next
            if start < left {
                preNode = leftNode
                leftNode = leftNode?.next
            }
            start += 1
        }
        let tailNode = rightNode?.next
        rightNode?.next = nil
        preNode?.next = nil
        let tmpHeadNode = reverseList(head: leftNode)
        leftNode?.next = tailNode

        if left == 1 {
            return tmpHeadNode
        } else {
            preNode?.next = tmpHeadNode
            return head
        }
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
        node1.next = node2
        node2.next = node3
        node3.next = node4
        node4.next = node5
//        let newHead = reverseList(head: node1)
        let newHead = reverseBetween(node1, 2, 4)
        print(newHead)
    }
}

//递归实现
//func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
//    if left == 1 { // 相当于反转前N个节点
//        return reverseN(head, right)
//    }
//    // 前进到反转的起点触发 base case
//    head?.next = reverseBetween(head?.next, left-1, right-1)
//    return head
//}
//var successor: ListNode? = nil // 后继节点：记录在反转前N个节点时，第N+1个节点
//// 反转以Head为起始的N个节点，返回新的头结点
//func reverseN(_ head: ListNode?, _ n: Int) -> ListNode? {
//    if n == 1 { // n = 1 反转一个元素，即不反转直接返回
//        // 记录后继节点
//        successor = head?.next
//        return head
//    }
//    // 以 head.next 为起点，需要反转前 n - 1 个节点, last为反转之后的头结点
//    let last = reverseN(head?.next, n-1)
//    head?.next?.next = head
//    // 让反转之后的 tail 节点和后继节点连起来
//    head?.next = successor
//    return last
//}
