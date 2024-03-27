//
//  搜索旋转排序数组.swift
//  testMacOS
//
//  Created by 腾飞张 on 2024/3/26.
//

import Cocoa

/**
 https://leetcode.cn/problems/search-in-rotated-sorted-array/solutions/220083/sou-suo-xuan-zhuan-pai-xu-shu-zu-by-leetcode-solut/
 输入：nums = [4,5,6,7,0,1,2], target = 0
 输出：4
 */

class SearchSortArrayClass: NSObject {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count
        while left < right {
            let middle = (right + left) / 2
            if nums[middle] == target {
                return middle
            }
            //判断left -- middle是否是有序的，先在有序的区间内寻找，
            if nums[left] < nums[middle] {
                if nums[left] <= target && target <= nums[middle] {
                    right = middle
                } else {
                    left = middle + 1
                }
            } else {
                if nums[right-1] >= target && nums[middle] <= target {
                    left = middle + 1
                } else {
                    right = middle
                }
            }
        }
        return -1
    }
    

    
}
