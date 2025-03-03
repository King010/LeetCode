//
//  长度最小的子数组.swift
//  testMacOS
//
//  Created by 腾飞张 on 2025/2/26.
//

import Cocoa

/**
 给定一个含有 n 个正整数的数组和一个正整数 target 。

 找出该数组中满足其总和大于等于 target 的长度最小的 子数组 [numsl, numsl+1, ..., numsr-1, numsr] ，并返回其长度。如果不存在符合条件的子数组，返回 0 。

 示例 1：

 输入：target = 7, nums = [2,3,1,2,4,3]
 输出：2
 解释：子数组 [4,3] 是该条件下的长度最小的子数组。

 https://leetcode.cn/problems/minimum-size-subarray-sum/description/
 */

class MinSubArrayLenClass: NSObject {
    func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
        var left = 0, right = 0
        var windowSum = 0
        var minLength = Int.max
        var hasTag = false
        while right < nums.count {
            let currentRightValue = nums[right]
            windowSum += currentRightValue
            right += 1
            while windowSum > target, left < right {
                hasTag = true
                minLength = min(minLength, right - left)
                let currentLeftValue = nums[left]
                windowSum -= currentLeftValue
                left += 1
            }
            if windowSum == target {
                hasTag = true
                minLength = min(minLength, right - left)
            }
        }
        return hasTag ? minLength : 0
    }

//    func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
//        var sum = 0
//        var count = Int.max
//        var left = 0
//
//        for i in 0 ..< nums.count {
//            sum += nums[i]
//            if sum >= target {
//                //! 开始减少元素。缩小窗口
//                while left <= i, sum - nums[left] >= target {
//                    sum -= nums[left]
//                    left += 1
//                }
//                count = min(count, i - left + 1)
//            }
//        }
//
//        if count == Int.max {
//            return 0
//        } else {
//            return count
//        }
//    }

    func main() {
        let target = 11, nums = [1, 2, 3, 4, 5]
        let result = minSubArrayLen(target, nums)
        print(result)
    }
}
