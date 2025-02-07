//
//  盛最多水的容器.swift
//  testMacOS
//
//  Created by 腾飞张 on 2024/4/2.
//

import Cocoa

class MaxAreaClass: NSObject {
    func maxArea(_ height: [Int]) -> Int {
        var maxValue = 0
        if height.count == 2 {
            return min(height[0],height[1])
        }
        var left = 0
        var right = height.count - 1
        var area = 0
        while left < right {
            area = (right - left) * min(height[right],height[left])
            maxValue = max(area, maxValue)
            if height[right] < height[left] {
                right -= 1
            } else {
                left += 1
            }
        }

        return maxValue
    }
    
//    func maxArea(_ height: [Int]) -> Int {
//            var maxValue = 0
//    //        var left = 0
//    //        var right = height.count
//
//            if height.count == 2 {
//                return min(height[0],height[1])
//            }
//
//            for left in 0 ..< height.count {
//    //            var tmp = left + 1
//                for right in left + 1 ..< height.count {
//                    let tmpHeight = min(height[right],height[left])
//                    let tmpMaxArea = (right - left) * tmpHeight
//                    maxValue = max(maxValue, tmpMaxArea)
//                }
//            }
//
//            return maxValue
//        }
    
    func main() {
        let result = maxArea([1,8,6,2,5,4,8,3,7])
        print(result)
    }
}
