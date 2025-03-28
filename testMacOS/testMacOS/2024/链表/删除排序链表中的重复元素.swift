//
//  删除排序链表中的重复元素.swift
//  testMacOS
//
//  Created by 腾飞张 on 2024/3/29.
//

import Cocoa

/**
 输入：head = [1,2,3,3,4,4,5]
 输出：[1,2,5]

 输入：head = [1,1,1,3,4,5]
 输出：[3,4,5]
 
 -1,0,0,0,3,3
1,2,2
 https://leetcode.cn/problems/remove-duplicates-from-sorted-list-ii/description/
 */

class DeleteDuplicatesClass: NSObject {
    
    func deleteDuplicates2(_ head: ListNode?) -> ListNode? {
        if head == nil {
            return nil
        }
        var countMap = [Int: Int]()
        
        let p1Head: ListNode? = ListNode(-101)
        var curNode = head
        var uniList = p1Head
        
        while curNode != nil {
            let key = curNode!.val
            countMap[key] = (countMap[key] ?? 0) + 1
            curNode = curNode?.next
        }
        curNode = head
        while curNode != nil {
            if (countMap[curNode!.val] ?? 0) > 1 {
                curNode = curNode?.next
                uniList?.next = nil
                continue
            }
            uniList?.next = curNode
            curNode = curNode?.next
            uniList = uniList?.next
        }
        return p1Head?.next
    }
    
    
    func deleteDuplicates1(_ head: ListNode?) -> ListNode? {
        if head == nil {
            return nil
        }
        var p1Head: ListNode? = ListNode(-101)
        var p2Head: ListNode? = ListNode(-101)
        
        var curNode = head
        var uniList = p1Head
        var dupList = p2Head
        //[1,2,3,3,4,4,5]
        while curNode != nil {
            
            if curNode != nil && ( curNode!.val == curNode!.next?.val || curNode!.val == dupList?.val) {
                dupList?.next = curNode
                dupList = dupList?.next
            } else {
                uniList?.next = curNode
                uniList = uniList?.next
            }
            curNode = curNode?.next
            dupList?.next = nil
            uniList?.next = nil
        }
        return p1Head?.next
    }
    
    
//    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
//        if head == nil {
//            return nil
//        }
//        var head = head
//        var currentNode = head
//        var preNode: ListNode?
//        var returnNode: ListNode?
//
//        while currentNode != nil {
//            var nextNode = currentNode?.next
//            var exist = false
//            while nextNode != nil, nextNode!.val == currentNode!.val {
//                nextNode = nextNode?.next
//                exist = true
//            }
//            if !exist {
//                preNode = currentNode
//                currentNode = currentNode?.next
//                preNode?.next = currentNode
//            } else {
//                if preNode == nil {
//                    currentNode = nextNode
//                    head = currentNode
//                } else {
//                    currentNode = nextNode
//                    preNode?.next = currentNode
//                }
//            }
//        }
//        return head
//    }

    func main() {
        let node1 = ListNode(1)
        let node2 = ListNode(1)
        let node3 = ListNode(3)
        let node4 = ListNode(4)
        let node5 = ListNode(5)

        let node31 = ListNode(3)
        let node41 = ListNode(4)
        let node42 = ListNode(4)

        node1.next = node2
        node2.next = node3
        node3.next = node31
        node31.next = node4
        node4.next = node5
        
//        let node1 = ListNode(1)
//        let node2 = ListNode(1)
//        let node3 = ListNode(3)
//        let node4 = ListNode(4)
//        let node5 = ListNode(5)
      //
      //        let node31 = ListNode(3)
      //        let node41 = ListNode(4)
      //        let node42 = ListNode(4)

        let result = deleteDuplicates1(node1)
        print(result)
    }
}
