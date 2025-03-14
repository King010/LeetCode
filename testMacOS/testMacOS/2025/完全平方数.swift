//
//  完全平方数.swift
//  testMacOS
//
//  Created by 腾飞张 on 2025/3/14.
//

/**
 给你一个整数 n ，返回 和为 n 的完全平方数的最少数量 。

 完全平方数 是一个整数，其值等于另一个整数的平方；换句话说，其值等于一个整数自乘的积。例如，1、4、9 和 16 都是完全平方数，而 3 和 11 不是。

 示例 1：

 输入：n = 12
 输出：3
 解释：12 = 4 + 4 + 4     12 = 9 + 1 + 1 + 1

 示例 2：
 输入：n = 13
 输出：2
 解释：13 = 4 + 9
 */

import Cocoa

class NumSquaresClass: NSObject {
    var dp = [Int]()

    func numSquares(_ n: Int) -> Int {
        var squaresArray = [Int]()
        var result = 0
        for idx in 1 ... n+1 {
            squaresArray.append(idx * idx)
        }
        dp = Array(repeating: -2, count: n+1)
        result = dps(squaresArray, n)
        return result
    }

    func dps(_ array: [Int], _ n: Int) -> Int {
        if n == 0 {
            return 0
        }
        if n < 0 {
            return -1
        }
        if dp[n] != -2 {
            return dp[n]
        }
        var result = Int.max
        for item in array {
            var subProblem = dps(array, n - item)
            if subProblem < 0 {
                continue
            }
            result = min(result, subProblem + 1)
            dp[n] = result
        }
        return result
    }

    func main() {
        let result = numSquares(12)
        print(result)
    }
}
