//
//  在排序数组中找元素的第一个位置和最后一个位置.swift
//  testMacOS
//
//  Created by 腾飞张 on 2024/4/2.
//

import Cocoa

/**
          2  3
 [5,7,7,8,8,10]
 输入：nums = [5,7,7,8,8,10], target = 8
 输出：[3,4]
 */

class SearchRangeClass: NSObject {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        var left = 0
        var right = nums.count - 1

        while left <= right {
            let middle = (right + left) / 2
            if nums[middle] == target {
                left = middle
                right = middle
                while left-1 > 0 && nums[left-1] == target {
                        left -= 1
                }
                while right+1 < nums.count && nums[right+1] == target {
                        right += 1
                }
                return [left,right]
            }
            if nums[middle] < target {
                left = middle + 1
            } else {
                right = middle - 1
            }
        }
        return [-1,-1]
    }
}
