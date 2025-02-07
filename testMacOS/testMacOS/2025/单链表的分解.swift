//
//  单链表的分解.swift
//  testMacOS
//
//  Created by 腾飞张 on 2025/2/6.
//

import Foundation
/**
 输入：head = [1,4,3,2,5,2], x = 3
 输出：[1,2,2,4,3,5]
 */

class ListDecomposition: NSObject {
//    func listDecompositionFunction(head: ListNode, value: Int) -> ListNode? {
//        var returnHead: ListNode? = head
//        
//        var preNode = head
//        var minNodeHead: ListNode? = ListNode(-1)
//        var maxNodeHead: ListNode? = ListNode(-1)
//        returnHead = minNodeHead
//        var curNode: ListNode? = head
//        while curNode != nil {
//            if curNode!.val < value {
//                minNodeHead?.next = curNode
//                minNodeHead = minNodeHead?.next
//            } else {
//                maxNodeHead?.next = curNode
//                maxNodeHead = maxNodeHead?.next
//            }
//            var tmpNode = curNode?.next
//            curNode?.next = nil
//            curNode = tmpNode
//        }
//            
//        return returnHead?.next
//    }
    
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        var returnHead: ListNode? = head
        
        var preNode = head
        var minNodeHead: ListNode? = ListNode(-1)
        var maxNodeHead: ListNode? = ListNode(-1)
        returnHead = minNodeHead
        var maxHead = maxNodeHead
        var curNode: ListNode? = head
        while curNode != nil {
            if curNode!.val < x {
                minNodeHead?.next = curNode
                minNodeHead = minNodeHead?.next
            } else {
                maxNodeHead?.next = curNode
                maxNodeHead = maxNodeHead?.next
            }
            var tmpNode = curNode?.next
            curNode?.next = nil
            curNode = tmpNode
        }
            
        minNodeHead?.next = maxHead?.next
        
        return returnHead?.next
    }
    
    func main() {
        let node1 = ListNode(1)
        let node2 = ListNode(2)
        let node3 = ListNode(4)
        let node4 = ListNode(3)
        let node5 = ListNode(2)
        let node6 = ListNode(6)
        node1.next = node2
        node2.next = node3
        node3.next = node4
        node4.next = node5
        node5.next = node6
//        let newHead = listDecompositionFunction(head: node1, value: 3)
        let newHead = partition(node1, 3)
        print(newHead)
    }
}
