//
//  最大子数组合.swift
//  testMacOS
//
//  Created by 腾飞张 on 2024/3/28.
//

import Cocoa

/**
 输入：nums = [-2,1,-3,4,-1,2,1,-5,4]
 输出：6
 解释：连续子数组 [4,-1,2,1] 的和最大，为 6
 https://leetcode.cn/problems/maximum-subarray/description/
 */

class MaxSubArrayClass: NSObject {
    func maxSubArray(_ nums: [Int]) -> Int {
        var maxValue = nums[0]
        var pre = 0
        for num in nums {
            pre = max(pre + num, num)
            maxValue = max(maxValue, pre)
        }
        return maxValue
    }
}
