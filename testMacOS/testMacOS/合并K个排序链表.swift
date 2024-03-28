//
//  合并K个升序链表.swift
//  testMacOS
//
//  Created by 腾飞张 on 2024/3/27.
//

import Cocoa

//1,2,3,4,5

/**
 [1,4,5],
 [1,3,4],
 [2,6]]
 */

class MergeKListsClass: NSObject {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        var resultNode: ListNode?
        guard lists.count > 0 else { return nil }
        resultNode = divMiddle(left: 0, right: lists.count-1, list: lists)
        return resultNode
    }

    func divMiddle(left: Int, right: Int, list:[ListNode?]) -> ListNode? {
        if left == right {
            return list[left]
        }
        let middle = (right + left - 1) / 2
        let leftList = divMiddle(left: left, right: middle, list: list)
        let rightList = divMiddle(left: middle+1, right: right, list: list)
        return mergeTwoLists(leftList, rightList)
    }
    
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        var newHead: ListNode? = ListNode(0)
        var returnHead = newHead
        var newList1 = list1
        var newList2 = list2
        while newList1 != nil, newList2 != nil {
            if let list1Value = newList1?.val, let list2Value = newList2?.val {
                if list1Value < list2Value {
                    newHead?.next = newList1
                    newList1 = newList1?.next
                } else {
                    newHead?.next = newList2
                    newList2 = newList2?.next
                }
                newHead = newHead?.next
            }
        }
        if let newList1 = newList1 {
            newHead?.next = newList1
        }
        if let newList2 = newList2 {
            newHead?.next = newList2
        }
        return returnHead?.next
    }
    
    func main() {
        let result =  mergeKLists([createList1(),createList2(),createList3()])
        print(result)
        
    }
    
    func createList1()->ListNode {
        let node1 = ListNode(1)
        let node2 = ListNode(2)
        let node3 = ListNode(3)
        let node4 = ListNode(4)
        let node5 = ListNode(5)
        let node6 = ListNode(6)
        let node7 = ListNode(7)
        let node8 = ListNode(8)
        let node9 = ListNode(9)
        node1.next = node4
        node4.next = node5
        return node1
    }
    
    func createList2()->ListNode {
        let node1 = ListNode(1)
        let node2 = ListNode(2)
        let node3 = ListNode(3)
        let node4 = ListNode(4)
        let node5 = ListNode(5)
        let node6 = ListNode(6)
        let node7 = ListNode(7)
        let node8 = ListNode(8)
        let node9 = ListNode(9)
        node1.next = node3
        node3.next = node4
        return node1
    }
    
    func createList3()->ListNode {
        let node1 = ListNode(1)
        let node2 = ListNode(2)
        let node3 = ListNode(3)
        let node4 = ListNode(4)
        let node5 = ListNode(5)
        let node6 = ListNode(6)
        let node7 = ListNode(7)
        let node8 = ListNode(8)
        let node9 = ListNode(9)
        node2.next = node6
        return node2
    }
    
}
