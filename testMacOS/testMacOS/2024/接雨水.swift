//
//  接雨水.swift
//  testMacOS
//
//  Created by 腾飞张 on 2024/3/28.
//

import Cocoa

/**
 输入：height = [0,1,0,2,1,0,1,3,2,1,2,1]
 输出：6
 解释：上面是由数组 [0,1,0,2,1,0,1,3,2,1,2,1] 表示的高度图，在这种情况下，可以接 6 个单位的雨水（蓝色部分表示雨水）
        1
            
              1   1
            1 11 1111111
 https://leetcode.cn/problems/trapping-rain-water/description/
 */

class TrapClass: NSObject {
    func trap(_ height: [Int]) -> Int {
        if height.count <= 2 {
            return 0
        }
        let size = height.count
        var ans = 0
        for i in 1 ..< size - 1 {
            var max_left = 0
            var max_right = 0
    
            var leftIndex = i
            // 需要先计算当前值，因为当前的值可能最高
            while leftIndex >= 0 {
                max_left = max(max_left, height[leftIndex])
                leftIndex -= 1
            }
    
            var rightIndex = i
            while rightIndex < size {
                max_right = max(max_right, height[rightIndex])
                rightIndex += 1
            }
            let value = min(max_left, max_right) - height[i]
            ans += value > 0 ? value : 0
        }
    
        return ans
    }

//    func trap(_ height: [Int]) -> Int {
//        if height.count <= 2 {
//            return 0
//        }
//        let size = height.count
//        var ans = 0
//        for i in 1 ..< size - 1 {
//            var max_left = 0
//            var max_right = 0
//
//            var leftIndex = i
//            //需要先计算当前值，因为当前的值可能最高
//            while leftIndex >= 0 {
//                max_left = max(max_left, height[leftIndex])
//                leftIndex -= 1
//            }
//
//            var rightIndex = i
//            while rightIndex < size {
//                max_right = max(max_right, height[rightIndex])
//                rightIndex += 1
//            }
//            ans += min(max_left, max_right) - height[i]
//        }
//
//        return ans
//    }
    
    func main() {
        let result = trap([1,2,3])
        print(result)
    }
}
