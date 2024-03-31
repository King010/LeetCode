//
//  滑动窗口的最大值.swift
//  testMacOS
//
//  Created by 腾飞张 on 2024/3/31.
//

import Cocoa

/**
 输入：nums = [1,3,-1,-3,5,3,6,7], k = 3
 输出：[3,3,5,5,6,7]
 解释：
 滑动窗口的位置                最大值
 ---------------               -----
 [1  3  -1] -3  5  3  6  7       3
  1 [3  -1  -3] 5  3  6  7       3
  1  3 [-1  -3  5] 3  6  7       5
  1  3  -1 [-3  5  3] 6  7       5
  1  3  -1  -3 [5  3  6] 7       6
  1  3  -1  -3  5 [3  6  7]      7
 */

class MaxSlidingWindowClass: NSObject {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        var result = [Int]()
        var list = [Int]()
        var right = 0, left = 0
        for right in 0..<nums.count {
            let len = right - left + 1
            while !list.isEmpty && list.last! < nums[right] {
                list.removeLast()
            }
            list.append(nums[right])
            
            if len < k {
                continue
            }
            result.append(list.first!)
            
            if nums[left] == list.first {
                list.removeFirst()
            }
            left += 1
        }
        
        return result
    }
//    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
//        if nums.count == 0 {
//            return [Int]()
//        }
//        var result = [Int]()
//
//        var currentLoopMax = windowMax(nums, k)
//        result.append(currentLoopMax)
//        for idx in 1..<(nums.count - k + 1) {
//            currentLoopMax = max(nums[idx+k-1], currentLoopMax)
//            result.append(currentLoopMax)
//        }
//        return result
//    }
//
//    func windowMax(_ nums: [Int], _ k: Int) -> Int {
//        var currentLoopMax = Int.min
//        for idx in 0..<k {
//            if idx == nums.count {
//                break
//            }
//            let item = nums[idx]
//            currentLoopMax = max(item, currentLoopMax)
//        }
//        return currentLoopMax
//    }
    
    func main() {
        let result = maxSlidingWindow([1,3,-1,-3,5,3,6,7], 3)
        print(result)
    }
    
}
