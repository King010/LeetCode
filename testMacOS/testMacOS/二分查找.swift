//
//  二分查找.swift
//  testMacOS
//
//  Created by 腾飞张 on 2024/3/29.
//

import Cocoa

/**         0 1 2  3  4  5
 输入: nums = [-1,0,3,5,9,12], target = 9
 输出: 4
 解释: 9 出现在 nums 中并且下标为 4
 https://leetcode.cn/problems/binary-search/
 */

class 二分查找Class: NSObject {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count - 1
        while left <= right {
            let middle = (right + left) / 2
            if nums[middle] == target {
                return middle
            }
            if nums[middle] <= target {
                left = middle + 1
            } else {
                right = middle - 1
            }
        }
        if nums[left] != target {
            return -1
        }
        return left
    }
    
    func main() {
        let result = search([-1,0,3,5,9,12], 2)
        print(result)
    }
}
