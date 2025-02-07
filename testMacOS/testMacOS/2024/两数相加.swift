//
//  两数相加.swift
//  testMacOS
//
//  Created by 腾飞张 on 2024/3/31.
//

import Cocoa

/**
 输入：l1 = [2,4,3], l2 = [5,6,4]
 输出：[7,0,8]
 解释：342 + 465 = 807.
 
 https://leetcode.cn/problems/add-two-numbers/description/
 */

class AddTwoNumbersClass: NSObject {
    /**
     [9,9,9,9,9,9,9]
     [9,9,9,9]
     
     [8,9,9,9,0,0,0]
     预期结果
     [8,9,9,9,0,0,0,1]
     */
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var head1 = l1
        var head2 = l2
        var carry = 0
        var newHead = ListNode(-1)
        var tmpHead: ListNode? = newHead
        while head1 != nil || head2 != nil || carry != 0 {
            var head1Value = 0
            var head2Value = 0
            if let tmp1 = head1?.val {
                head1Value = tmp1
            }
            if let tmp2 = head2?.val {
                head2Value = tmp2
            }
            let result = head1Value + head2Value + carry
            carry = result / 10
            var currentNode = ListNode(result  % 10)
            tmpHead?.next = currentNode
            tmpHead = tmpHead?.next
            head1 = head1?.next
            head2 = head2?.next
        }
        
        return newHead.next
    }
    
    func main() {
//        let result = addTwoNumbers([9,9,9,9,9,9,9], [9,9,9,9])
//        print(result)
    }
}
