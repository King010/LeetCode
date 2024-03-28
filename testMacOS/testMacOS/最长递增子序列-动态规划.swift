//
//  最长递增子序列.swift
//  testMacOS
//
//  Created by 腾飞张 on 2024/3/28.
//

import Cocoa

/**
 输入：nums = [10,9,2,5,3,7,101,18]
 输出：4
 解释：最长递增子序列是 [2,3,7,101]，因此长度为 4 。
 */

class LengthOfLISClass: NSObject {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        var dp = [Int](repeating: 1, count: nums.count)
        var maxValue = dp[0]

        for i in 1..<nums.count {
            for j in 0..<i {
                if nums[i] > nums[j] {
                    dp[i] = max(dp[i], dp[j] + 1)
                }
            }
            maxValue = max(maxValue, dp[i])
        }
        return maxValue
    }
}
