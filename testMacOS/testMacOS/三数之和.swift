//
//  3.swift
//  TestRxswift
//
//  Created by 腾飞张 on 2024/3/20.
//  Copyright © 2024 腾飞张. All rights reserved.
//

import UIKit

//[-1,0,1,2,-1,-4]
//-4 -1 -1 0 1 2

class ThreeSumClass: NSObject {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var returnVal = [[Int]]()
        if nums.count <= 2 {
            return returnVal
        }
        var sortNums = nums
        sortNums = sortNums.sorted(by: { a, b in
            a<b
        })
        
        var i = 0
        while i<sortNums.count - 2 {
            //过滤相同数据
            if i > 0 && sortNums[i] == sortNums[i-1] {
                i += 1
                continue
            }
            
            var left = i+1
            var right = sortNums.count - 1
            
            while left < right {
                let target = sortNums[i] + sortNums[left] + sortNums[right]
                if target == 0 {
                    //不可以删除，可能存在[0,0,0,0]的数据
                    if left - 1 > i && sortNums[left] == sortNums[left-1] {
                        left += 1
                        continue
                    }
                    returnVal.append([sortNums[i], sortNums[left], sortNums[right]])
                    left += 1
                } else if target < 0 {
                    left += 1
                } else if target > 0 {
                    right -= 1
                }
            }
            i += 1
        }
        return returnVal
    }
    
    func main() {
        let value = threeSum([-1,0,1,2,-1,-4])
        print(value)
    }
    
}
