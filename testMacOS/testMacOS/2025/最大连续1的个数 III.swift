//
//  最大连续1的个数 III.swift
//  testMacOS
//
//  Created by 腾飞张 on 2025/2/19.
//

import Cocoa

/**
 给定一个二进制数组 nums 和一个整数 k，如果可以翻转最多 k 个 0 ，则返回 数组中连续 1 的最大个数 。

 输入：nums = [1,1,1,0,0,0,1,1,1,1,0], K = 2
 输出：6
 解释：[1,1,1,0,0,1,1,1,1,1,1]
 粗体数字从 0 翻转到 1，最长的子数组长度为 6。

 */

class LongestOnesClass: NSObject {
    func longestOnes(_ nums: [Int], _ k: Int) -> Int {
        var left = 0
        var right = 0
        var maxLength = -1
        var reverseIndexArray = [Int]()
        while right < nums.count {
            let currentRightValue = nums[right]
            if currentRightValue == 0 {
                reverseIndexArray.append(right)
            }
            right += 1
            if reverseIndexArray.count == k+1, left < right {
                left = 1 + (reverseIndexArray.first ?? 0)
                right = left
                reverseIndexArray.removeAll()
            }
            maxLength = max(maxLength, right - left)
        }
        return maxLength
    }

    func main() {
        let nums = [1,1,1,0,0,0,1,1,1,1,0]
        let k = 2
        let result = longestOnes(nums, k)
        print(result)
    }
}
