//
//  反转链表.swift
//  testMacOS
//
//  Created by 腾飞张 on 2024/3/28.
//

import Cocoa

/**
 输入：head = [1,2,3,4,5]
 输出：[5,4,3,2,1]
 https://leetcode.cn/problems/reverse-linked-list/description/
 */

class ReverseListClass: NSObject {
    func reverseList(_ head: ListNode?) -> ListNode? {
           var returnNode = head
           
           guard let newHead = head,let _ = newHead.next else {
               return head
           }
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
