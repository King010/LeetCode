//
//  main.swift
//  testMacOS
//
//  Created by 腾飞张 on 2024/3/21.
//

import Foundation


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

//[-2, 1, -3, 4, -1, 2, 1, -5, 4]   6

/**
 最大子序和， 其实要求的是n = count的连续最大子序和， 用 f(i)表示，第i个数结尾的最大子序和，那么其实就是找所有f(i)中最大的一位
 用pre来存储 当前f(i)相对的f(i-1)是多少
 用rst存储最大的pre，每次更新最大值

 作者：荒野
 链接：https://leetcode.cn/problems/maximum-subarray/solutions/1004113/zui-da-zi-xu-he-dong-tai-gui-hua-jie-fa-z12yu/
 来源：力扣（LeetCode）
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 */

//func maxSubArray(_ nums: [Int]) -> Int {
//    var maxValue = nums[0]
//    var pre = 0
//    for num in nums {
//        pre = max(pre+num, num)
//        maxValue = max(maxValue, pre)
//    }
//    return maxValue
//}
//
//func main() {
//    let result = maxSubArray([-2, 1, -3, 4, -1, 2, 1, -5, 4])
//    print(result)
//}

//Sort().main()
//LongestPalindromeClass().main()
//LengthOfLongestSubstringClass().main()

//LowestCommonAncestorClass().main()
//MergeTwoArrayClass().main()
ArrayPermuteClass().main()
