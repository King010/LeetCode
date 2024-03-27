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
        
        if left == rit {
            return head
        }
        
        var lengthNode = head
        var length = 0
        while (lengthNode != nil) {
            lengthNode = lengthNode?.next
            length += 1
        }
        if (right - left + 1) == length {
            return reverseList(head: head)
        }
        
        var tailHead = head
        var preHead = head
        if left == 1 {
        } else {
            for _ in 0..<(left-2) {
                preHead = preHead?.next
            }
        }
        
        for _ in 0..<(right-1) {
            tailHead = tailHead?.next
        }
        let tmpTailNode = tailHead?.next
        tailHead?.next = nil
        
        var tmpHead = preHead?.next
        if left == 1{
            tmpHead = preHead
        }
//        preHead?.next = nil
        let newReverseHead = reverseList(head: tmpHead)
//        preHead?.next = newReverseHead
        while preHead?.next != nil {
            preHead = preHead?.next
        }
        preHead?.next = tmpTailNode
        return head
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
//        let node4 = ListNode(4)
//        let node5 = ListNode(5)
        node1.next = node2
        node2.next = node3
//        node3.next = node4
//        node4.next = node5
//        let newHead = reverseList(head: node1)
        let newHead = reverseBetween(node1, 1, 2)
        print(newHead)
    }
}
