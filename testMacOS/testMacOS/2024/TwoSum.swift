//
//  TwoSum.swift
//  testMacOS
//
//  Created by 腾飞张 on 2024/3/25.
//

import Cocoa
//[3,2,4]  [1,2]
class TwoSum: NSObject {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var result = [Int]()
        var map = [Int: Int]()
        
        for (idx,item) in nums.enumerated() {
            let value = target - item
            if let tmp = map[value] {
                return [idx, tmp]
            }
            map[item] = idx
        }
        return result
    }
}
