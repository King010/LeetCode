//
//  正则表达式匹配.swift
//  testMacOS
//
//  Created by 腾飞张 on 2024/4/2.
//

import Cocoa

/**
 示例 1：

 输入：s = "aa", p = "a"
 输出：false
 解释："a" 无法匹配 "aa" 整个字符串。
 示例 2:

 输入：s = "aa", p = "a*"
 输出：true
 解释：因为 '*' 代表可以匹配零个或多个前面的那一个元素, 在这里前面的元素就是 'a'。因此，字符串 "aa" 可被视为 'a' 重复了一次。
 https://leetcode.cn/problems/regular-expression-matching/description/
 */

class IsMatchClass: NSObject {
    func isMatch(_ s: String, _ p: String) -> Bool {
        let sArray = Array(s)
        let pArray = Array(p)
        var dp = [[Bool]](repeating: [Bool](repeating: false, count: pArray.count+1), count: sArray.count+1)
        dp[0][0] = true
        var i = 0
        while i <= sArray.count {
            var j = 1
            while j <= pArray.count {
                if pArray[j-1] == "*" {
                    dp[i][j] = dp[i][j-2]
                    if matches(sArray, pArray, i, j-1) {
                        dp[i][j] = dp[i][j] || dp[i-1][j]
                    }
                } else {
                    if matches(sArray, pArray, i, j) {
                        dp[i][j] = dp[i-1][j-1]
                    }
                }
                j += 1
            }
            i += 1
        }
        return dp[sArray.count][pArray.count]
    }

    func matches(_ s: [Character], _ p: [Character], _ i: Int, _ j: Int) -> Bool {
        if i == 0 {
            return false
        }
        if p[j-1] == "." {
            return true
        }
        return s[i-1] == p[j-1]
    }
}
