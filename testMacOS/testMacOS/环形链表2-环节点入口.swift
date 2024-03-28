//
//  环形链表2-环节点入口.swift
//  testMacOS
//
//  Created by 腾飞张 on 2024/3/28.
//

import Cocoa

/**
 head = [3,2,0,-4], pos = 1
 输出：返回索引为 1 的链表节点
 解释：链表中有一个环，其尾部连接到第二个节点。
 
 https://leetcode.cn/problems/linked-list-cycle-ii/description/
 */

class DetectCycleClass: NSObject {
    func detectCycle(_ head: ListNode?) -> ListNode? {
        var slow = head
        var fast = head
        var flag = false
        
        while fast?.next != nil, fast?.next?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
            if fast === slow {
                flag = true
                break
            }
        }
             
        if flag == false {
            return nil
        }
        
        slow = head
        
        /**
         假设链表总长为L，头节点到入口点的距离为a,入口点到快慢指针交点距离为x,环的长度为r，现在假设慢指针走了S步与快指针相遇，
         s = a + x;
         那么快指针走了2S步，
             2s = a + nr + x;
             就可以得到：a + x = nr;
             a = nr - x;
         可以看出来，头节点到入口点的距离等于，交点到入口点的距离，那我们让两个指针，一个从交点走，一个从头节点走，最后一定在入口点相遇。
         */
        //fast 此时在交点处
        while slow !== fast {
            slow = slow?.next
            fast = fast?.next
        }
        return slow
    }
}
