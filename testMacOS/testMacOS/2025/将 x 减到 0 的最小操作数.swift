//
//  将 x 减到 0 的最小操作数.swift
//  testMacOS
//
//  Created by 腾飞张 on 2025/2/18.
//

/**
 输入：nums = [1,1,4,2,3], x = 5
        anim = 11
输出：2
 解释：最佳解决方案是移除后两个元素，将 x 减到 0 。
 
 思路，求最大子数组和为  数组和减去目标值，使用滑动窗口
 https://leetcode.cn/problems/minimum-operations-to-reduce-x-to-zero/description/
 */
import Cocoa

class MinOperationsClass: NSObject {
    func minOperations(_ nums: [Int], _ x: Int) -> Int {
        var left = 0
        var right = 0
        var sum = 0
        for item in nums {
            sum += item
        }
        let animValue = sum - x
        
        var tmpSum = 0
        var minOperation = Int.max
        var hasTag = false
        while right < nums.count {
            let currentRightNum = nums[right]
            right += 1
            tmpSum += currentRightNum
            while tmpSum > animValue && left < right {
                let currentLeftNum = nums[left]
                left += 1
                tmpSum -= currentLeftNum
            }
            if tmpSum == animValue {
                let result = nums.count - (right - left)
                minOperation = min(minOperation, result)
                hasTag = true
            }
        }
        return hasTag ? minOperation : -1
    }
    
    func main() {
        let nums = [5,2,3,1,1]
        let x = 5
        let result = minOperations(nums, x)
        print(result)
        
    }
}
