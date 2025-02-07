//
//  MergeList.swift
//  testMacOS
//
//  Created by 腾飞张 on 2024/3/25.
//

import Cocoa

class MergeTwoListsClass: NSObject {
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
}

