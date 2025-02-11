//
//  删除有序数组中的重复项.swift
//  testMacOS
//
//  Created by 腾飞张 on 2025/2/10.
//

/**
 https://leetcode.cn/problems/remove-duplicates-from-sorted-array/
 
 输入：nums = [1,1,2]
 输出：2, nums = [1,2,_]
 解释：函数应该返回新的长度 2 ，并且原数组 nums 的前两个元素被修改为 1, 2 。不需要考虑数组中超出新长度后面的元素。
 示例 2：

 输入：nums = [0,   1,   2,   3,    1,    2,    2,    3,    3,    4]
                    left                             right
                        
 输出：5, nums = [0,1,2,3,4]
 解释：函数应该返回新的长度 5 ， 并且原数组 nums 的前五个元素被修改为 0, 1, 2, 3, 4 。不需要考虑数组中超出新长度后面的元素。
 
 */

import Cocoa

class RemoveArrayDuplicates: NSObject {
    
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var left = 0
        var right = 0
        while right != nums.count {
            if nums[left] == nums[right] {
                right += 1
            } else {
                left += 1
                nums[left] = nums[right]
                right += 1
            }
        }
        return left + 1
    }
    
    /**
     nums = [0,1,2,2,3,0,4,2], val = 2
     输出：5, nums = [0,1,4,0,3,_,_,_]
     */
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var left = 0
        var right = 0
        while right != nums.count {
            if nums[right] == val {
                right += 1
            } else {
                nums[left] = nums[right]
                right += 1
                left += 1
            }
        }
        return left + 1
    }
    
    
    func main() {
        var num = [0,   1,   1,   1,    1,    2,    2,    3,    3,    4]
        let result = removeDuplicates(&num)
        print(result)
    }
    
}
