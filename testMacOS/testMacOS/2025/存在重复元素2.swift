//
//  存在重复元素2.swift
//  testMacOS
//
//  Created by 腾飞张 on 2025/2/24.
//

import Cocoa

/**
 给你一个整数数组 nums 和一个整数 k ，判断数组中是否存在两个 不同的索引 i 和 j ，满足 nums[i] == nums[j] 且 abs(i - j) <= k 。如果存在，返回 true ；否则，返回 false 。

 示例 1：

 输入：nums = [1,2,3,1], k = 3
 输出：true
 示例 2：

 输入：nums = [1,0,1,1], k = 1
 输出：true
 示例 3：

 输入：nums = [1,2,3,1,2,3], k = 2
 输出：false
 */

class ContainsNearbyDuplicate: NSObject {
    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        var left = 0, right = 0
        var windowDic = [Int: Int]()
        while right < nums.count {
            let currentValue = nums[right]
            if (windowDic[currentValue] ?? 0) > 0 {
                return true
            }
            windowDic[currentValue] = 1 + (windowDic[currentValue] ?? 0)
            right += 1
            if right - left > k {
                if windowDic.keys.contains(nums[left]) {
//                    windowDic[nums[left]] = (windowDic[nums[left]] ?? 0) - 1
                    windowDic.removeValue(forKey: nums[left])
                }
                left += 1
            }
        }
        return false
    }
    
    func containsNearbyDuplicate1(_ nums: [Int], _ k: Int) -> Bool {
        var left = 0, right = 0
        var result = false
        
        for (idx, value) in nums.enumerated() {
            for item in 1..<k+1 {
                if idx+item < nums.count && nums[idx+item] == value {
                    return true
                }
            }
        }
        return result
    }
    
    func main() {
        let nums = [1,2,3,1,2,3], k = 2
        let result = containsNearbyDuplicate(nums, k)
        print(result)
    }
}
