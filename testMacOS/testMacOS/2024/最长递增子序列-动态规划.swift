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

 https://leetcode.cn/problems/longest-increasing-subsequence/
 */

class LengthOfLISClass: NSObject {
//    func lengthOfLIS(_ nums: [Int]) -> Int {
//        var dp = [Int](repeating: 1, count: nums.count)
//        var maxValue = 0
//        for i in 1..<nums.count {
//            for j in 0..<i {
//                // 寻找 nums[0..j-1] 中比 nums[i] 小的元素
//                if nums[i] > nums[j] {
//                    // 把 nums[i] 接在后面，即可形成长度为 dp[j] + 1，
//                    // 且以 nums[i] 为结尾的递增子序列
//                    dp[i] = max(dp[i], dp[j] + 1)
//                }
//            }
//            maxValue = max(maxValue, dp[i])
//        }
//        return maxValue
//    }
    func lengthOfLIS(_ nums: [Int]) -> Int {
        var dp = [Int](repeating: 1, count: nums.count)
        var maxValue = 0

        for i in 0 ..< nums.count { // 以i结尾的最长子序列
            for j in 0 ..< i {
                if nums[i] > nums[j] {
                    dp[i] = max(dp[i], dp[j] + 1)
                }
            }
        }
        maxValue = dp.max() ?? 1
        return maxValue
    }

    func main() {
        let result = lengthOfLIS([0, 1, 0, 3, 2, 3])
        print(result)
    }

//    func lengthOfLIS(_ nums: [Int]) -> Int {
//        var dp = [Int](repeating: 1, count: nums.count)
//        var maxValue = dp[0]
//
//        for i in 1..<nums.count {
//            for j in 0..<i {
//                if nums[i] > nums[j] {
//                    dp[i] = max(dp[i], dp[j] + 1)
//                }
//            }
//            maxValue = max(maxValue, dp[i])
//        }
//        return maxValue
//    }
}
