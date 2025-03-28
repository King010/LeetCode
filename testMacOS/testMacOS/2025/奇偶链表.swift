//
//  奇偶链表.swift
//  testMacOS
//
//  Created by 腾飞张 on 2025/3/24.
//

import Cocoa

/**
 https://leetcode.cn/problems/odd-even-linked-list/

 给定单链表的头节点 head ，将所有索引为奇数的节点和索引为偶数的节点分别组合在一起，然后返回重新排序的列表。

 第一个节点的索引被认为是 奇数 ， 第二个节点的索引为 偶数 ，以此类推。

 请注意，偶数组和奇数组内部的相对顺序应该与输入时保持一致。

 你必须在 O(1) 的额外空间复杂度和 O(n) 的时间复杂度下解决这个问题。
 
 1   2   3   4   5
 */

class OddEvenListClass: NSObject {
//    func oddEvenList(_ head: ListNode?) -> ListNode? {
//        var jishuIndex = head
//        var oushuIndex = head?.next
//        let oushuHead = head?.next
//
//        while jishuIndex != nil || oushuIndex != nil {
//            let jishuNode = jishuIndex?.next?.next
//            let oushuNode = oushuIndex?.next?.next
//                        
//            jishuIndex?.next = jishuNode
//            jishuIndex = jishuIndex?.next
//            
//            oushuIndex?.next = oushuNode
//            oushuIndex = oushuIndex?.next
//        }
//        jishuIndex = head
//        while jishuIndex?.next != nil {
//            jishuIndex = jishuIndex?.next
//        }
//        jishuIndex?.next = oushuHead
//        return head
//    }
    
    func oddEvenList(_ head: inout [Int]) {
        var jishuIndex = 0
        var oushuIndex = 0
    }

    func main() {
        var arr = [1,2,3,4,5]
        oddEvenList(&arr)
        print(arr)
    }
}
