//
//  相交链表.swift
//  testMacOS
//
//  Created by 腾飞张 on 2024/3/28.
//

import Cocoa

/**
 输入：intersectVal = 8, listA = [4,1,8,4,5], listB = [5,6,1,8,4,5], skipA = 2, skipB = 3
 输出：Intersected at '8'
 解释：相交节点的值为 8 （注意，如果两个链表相交则不能为 0）。
 从各自的表头开始算起，链表 A 为 [4,1,8,4,5]，链表 B 为 [5,6,1,8,4,5]。
 在 A 中，相交节点前有 2 个节点；在 B 中，相交节点前有 3 个节点。
 — 请注意相交节点的值不为 1，因为在链表 A 和链表 B 之中值为 1 的节点 (A 中第二个节点和 B 中第三个节点) 是不同的节点。换句话说，它们在内存中指向两个不同的位置，而链表 A 和链表 B 中值为 8 的节点 (A 中第三个节点，B 中第四个节点) 在内存中指向相同的位置。

 https://leetcode.cn/problems/intersection-of-two-linked-lists/description/
 
 [4,1,8,4,5],5    2
 4
 [5,6,12,3,   4,5,8,4,5]   9   6
 
 4 1 2 3
 5 6 1 2 3
 
 */
class GetIntersectionNodeClass: NSObject {
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        if headA == nil || headB == nil {
            return nil
        }
        var list1 = headA
        var list2 = headB
        var AloopCount = 0
        var BloopCount = 0
        while list1 !== list2 {
            list1 = list1 == nil ? headB : list1?.next
            list2 = list2 == nil ? headA : list2?.next
        }
        return list1
    }
    
    func main() {
        let node1 = ListNode(1)
        let node2 = ListNode(2)
        let node3 = ListNode(3)
        let node4 = ListNode(4)
        let node5 = ListNode(5)
        let node6 = ListNode(6)
        let node7 = ListNode(7)
        let node8 = ListNode(8)

        node1.next = node2//    1 2 3 4 5
        node2.next = node3//6 7 8 2 3 4 5
        node3.next = node4
        node4.next = node5
        
        node6.next = node7
        node7.next = node8
        node8.next = node2

        let result = getIntersectionNode(node1, node6)
        print(result)
    }
}
