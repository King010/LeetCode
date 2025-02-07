//
//  下一个排列.swift
//  testMacOS
//
//  Created by 腾飞张 on 2024/3/30.
//

import Cocoa

/**
 示例 1：

 输入：nums = [1,2,3]
 输出：[1,3,2]
 示例 2：

 输入：nums = [3,2,1]
 输出：[1,2,3]

 https://leetcode.cn/problems/next-permutation/description/

 [4,5,2,6,3,1]

 4,5,3,1,2,6

 4,5,3,6,2,1

 */

class NextPermutationClass: NSObject {
    func nextPermutation(_ nums: inout [Int]) {
        // 3 2 1
        var firstIdx = nums.count - 2
        while firstIdx >= 0 {
            if nums[firstIdx] < nums[firstIdx + 1] {
                break
            }
            firstIdx -= 1
        }
        if firstIdx >= 0 {
            var tmp = nums.count - 1
            while tmp > firstIdx {
                if nums[tmp] > nums[firstIdx] {
                    break
                }
                tmp -= 1
            }
            (nums[firstIdx], nums[tmp]) = (nums[tmp], nums[firstIdx])
        }

        var left = firstIdx + 1
        var right = nums.count - 1
        while left < right {
            (nums[left], nums[right]) = (nums[right], nums[left])
            left += 1
            right -= 1
        }
    }

    func main() {
        var array = [3, 2, 1]
        nextPermutation(&array)
        print(array)
    }
}
