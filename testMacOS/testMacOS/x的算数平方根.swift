//
//  x的算数平方根.swift
//  testMacOS
//
//  Created by 腾飞张 on 2024/3/30.
//

import Cocoa

/**
 https://leetcode.cn/problems/sqrtx/solutions/406439/69-x-de-ping-fang-gen-by-cobbly/
 
 输入：x = 4
 输出：2
 */

class MySqrtClass: NSObject {
    func mySqrt(_ x: Int) -> Int {
        if x == 1 {
            return 0
        }
        
        var resultVal = 0
        var preResult = 0
        for item in 0..<x {
            resultVal = item * item
            if resultVal == x {
                return item
            }
            if resultVal > x {
                return preResult
            }
            preResult = item
        }
        return resultVal
    }
    
    
    func main() {
        let result = mySqrt(8)
        print(result)
    }
}
