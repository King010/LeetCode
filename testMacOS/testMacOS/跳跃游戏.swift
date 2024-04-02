//
//  跳跃游戏.swift
//  testMacOS
//
//  Created by 腾飞张 on 2024/4/2.
//

import Cocoa

/**
 输入：nums = [2,3,1,1,4]
 输出：true
 解释：可以先跳 1 步，从下标 0 到达下标 1, 然后再从下标 1 跳 3 步到达最后一个下标。
 
 https://leetcode.cn/problems/jump-game/description/
 */

class CanJumpClass: NSObject {
    var maxValue = 0
    
    
    func canJump(_ nums: [Int]) -> Bool {
        dfs(nums, 0, 0)
        return maxValue >= nums.count
    }
    
    func dfs(_ nums: [Int], _ index: Int, _ ans: Int) {
        if index >= nums.count || nums[index] == 0 {
            maxValue = max(maxValue, ans)
            return
        }
        for idx in 1...nums[index] {
            dfs(nums, index+idx, ans+nums[index] )
        }
    }
    
    
}
