//
//  爬楼梯.swift
//  testMacOS
//
//  Created by 腾飞张 on 2024/3/30.
//

import Cocoa

class ClimbStairsClass: NSObject {
    
    func climbStairs(_ n: Int) -> Int {
        if n == 1 {
            return 1
        }
        if n == 2 {
            return 2
        }
        var n = n
        var a = 1
        var b = 2
        var sum = 0
//        while n >= 3 {
//            sum = a + b
//            a = b
//            b = a + b
//        }
        
        while (n - 2) > 0 {
            sum = a + b
            a = b
            b = sum
            n -= 1
        }
        
        //        return climbStairs(n-1) + climbStairs(n-2)
        return sum
    }
    //1 ,2, 3, 5, 8
//    func climbStairs(_ n: Int) -> Int {
//        if n == 1 {
//            return 1
//        }
//        if n == 2 {
//            return 2
//        }
//        return climbStairs(n-1) + climbStairs(n-2)
//    }
    
    func main() {
        let result = climbStairs(3)
        print(result)
    }
}
