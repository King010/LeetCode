//
//  Sort.swift
//  testMacOS
//
//  Created by 腾飞张 on 2024/3/21.
//

import Cocoa

class Sort: NSObject {
    func sortArray(_ nums: [Int]) -> [Int] {
        var new = nums
        sortMain(0, nums.count-1, nums: &new)
        return new
    }
    
    func sortMain(_ l: Int,_ r: Int, nums: inout [Int]) {
        if l >= r {
            return
        }
        let index = sortFunction(0, nums.count-1, nums: &nums)
        sortFunction(l, index-1, nums: &nums)
        sortFunction(index+1, r, nums: &nums)
    }
    
    func sortFunction(_ l: Int,_ r: Int, nums: inout [Int]) -> Int {
        let key = nums[l]
        let keyIndex = l
        var left = l + 1
        var right = r
        while left < right {
            if nums[right] > key {
                right -= 1
            }
            if nums[left] < key {
                left += 1
            }
            nums.swapAt(left, right)
        }
        nums.swapAt(keyIndex, left)
        return left
    }
    
    func main() {
        let newArray = sortArray([4,2,6,3,1])//4 2 1 3 6
        print(newArray)
    }
}
