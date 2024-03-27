//
//  排序.swift
//  算法
//
//  Created by 腾飞张 on 2024/3/21.
//

import Cocoa

class SortFunction {
    func sortArray(_ nums: [Int]) -> [Int] {
        var sortNums = nums
        sort(0, nums.count-1, &sortNums)
        return sortNums
    }
    
    func sort(_ l: Int, _ r: Int, _ nums: inout [Int]) {
        if l >= r {
            return
        }
        let key = parti(l, r, &nums)
        sort(l, key-1, &nums)
        sort(key+1, r, &nums)
    }
    //5 2 3 1 6
    func parti(_ l: Int, _ r: Int, _ nums: inout [Int]) -> Int {
        let key = nums[l]
        var left = l
        var right = r
        while left < right {
            while nums[right] >= key && left < right {
                right -= 1
            }
            if left < right {
                nums[left] = nums[right]
                left += 1
            }
            while nums[left] <= key && left < right {
                left += 1
            }
            if left < right {
                nums[right] = nums[left]
                right -= 1
            }
        }
        nums[left] = key
        return left
        
    }
    
//    func parti(_ l: Int, _ r: Int, _ nums: inout [Int]) -> Int {
//
//        var i = l
//
//        for j in l ..< r {
//            if nums[j] < nums[r] {
//                if i != j {
//                    nums.swapAt(i, j)
//                }
//                i += 1
//            }
//        }
//        nums.swapAt(i, r)
//        return i
//    }
    
//    func parti(_ l: Int, _ r: Int, _ nums: inout [Int]) -> Int {
//
//        var left = l+1
//        var right = r
//        let key = nums[l]
//        while left < right {
//            if nums[right] > key, left < right {
//                right -= 1
//            }
//            if nums[left] < key, left < right {
//                left += 1
//            }
//            if (left < right) {
//                nums.swapAt(left, right)
//            }
//        }
//        if left != right && nums[left] < nums[right] {
//            return left
//        } else {
//            return right
//        }
////        if left == l {
////            nums.swapAt(l, left)
////
////        }
////        return left
//    }
    
    func main() {
        let result = sortArray([5,2,3,1,6])
        print(result)
    }

}
