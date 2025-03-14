//
//  排序联系.swift
//  testMacOS
//
//  Created by 腾飞张 on 2025/3/7.
//

import Cocoa

class CommonSortTest1Class: NSObject {
    func quickSort(nums: inout [Int], leftIndex: Int, rightIndex: Int) {
        if leftIndex >= rightIndex {
            return
        }
        
        let p = partition(nums: &nums, leftIndex: leftIndex, rightIndex: rightIndex)
        quickSort(nums: &nums, leftIndex: leftIndex, rightIndex: p - 1)
        quickSort(nums: &nums, leftIndex: p + 1, rightIndex: rightIndex)
    }

    func partition(nums: inout [Int], leftIndex: Int, rightIndex: Int) -> Int {
        var tmpRightIndex = rightIndex
        var tmpLeftIndex = leftIndex + 1
        let key = nums[leftIndex]
        while tmpLeftIndex <= tmpRightIndex {
            while tmpLeftIndex <= tmpRightIndex, nums[tmpLeftIndex] <= key {
                tmpLeftIndex += 1
            }
            while tmpLeftIndex <= tmpRightIndex, nums[tmpRightIndex] > key {
                tmpRightIndex -= 1
            }
            if tmpLeftIndex < tmpRightIndex {
                nums.swapAt(tmpRightIndex, tmpLeftIndex)
            }
        }
        nums.swapAt(leftIndex, tmpRightIndex)
        return tmpRightIndex
    }
    
    func mergeSort(nums: inout [Int], leftIndex: Int, rightIndex: Int) {
        if leftIndex >= rightIndex {
            return
        }
        
        let mid = (leftIndex + rightIndex) / 2
        
        mergeSort(nums: &nums, leftIndex: leftIndex, rightIndex: mid)
        mergeSort(nums: &nums, leftIndex: mid + 1, rightIndex: rightIndex)
        merge(&nums, leftIndex, mid, rightIndex)
    }
    
//    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
//
//
//    }
    
    func merge(_ nums: inout [Int], _ left: Int, _ mid: Int, _ right: Int) {
        var i = left
        var j = mid + 1
        var tmpArray = [Int]()
        while i <= mid, j <= right {
            if nums[i] <= nums[j] {
                tmpArray.append(nums[i])
                i += 1
            }
            else {
                tmpArray.append(nums[j])
                j += 1
            }
        }
        
        while i <= mid {
            tmpArray.append(nums[i])
            i += 1
        }
        while j <= right {
            tmpArray.append(nums[j])
            j += 1
        }
//        if i <= mid {
//            tmpArray += nums[i..<mid]
//        }
//        if j <= right {
//            tmpArray += nums[j...]
//        }
        for i in 0 ..< tmpArray.count {
            nums[left + i] = tmpArray[i]
        }
    }
    
    func main() {
        var nums = [3, 5, 2, 1, 6, 9, 8, 7, 4]
//        merge(&nums, 0, nums.count / 2, nums.count - 1)
        mergeSort(nums: &nums, leftIndex: 0, rightIndex: nums.count - 1)
//        quickSort(nums: &nums, leftIndex: 0, rightIndex: nums.count - 1)
        print(nums)
    }
}
