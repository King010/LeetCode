//
//  最长连续递增序列.swift
//  testMacOS
//
//  Created by 腾飞张 on 2025/3/19.
//

/**
 https://leetcode.cn/problems/longest-continuous-increasing-subsequence/

 输入：nums = [1,3,5,4,7]
 输出：3
 解释：最长连续递增序列是 [1,3,5], 长度为3。
 尽管 [1,3,5,7] 也是升序的子序列, 但它不是连续的，因为 5 和 7 在原数组里被 4 隔开。
 */

import Cocoa

class FindLengthOfLCISClass: NSObject {
    func findLengthOfLCIS(_ nums: [Int]) -> Int {
        var maxLength = 1
        for left in 0 ..< nums.count {
            for right in (left + 1) ..< nums.count {
                if nums[right] > nums[right - 1] {
                    maxLength = max(right - left + 1, maxLength)
                } else {
                    break
                }
            }
        }
        return maxLength
    }

    func main() {
        let nums = [1, 3, 5, 4, 7]
        let result = findLengthOfLCIS(nums)
        print(result)
    }
}
