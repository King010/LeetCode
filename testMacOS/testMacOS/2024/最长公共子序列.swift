//
//  最长公共子序列.swift
//  testMacOS
//
//  Created by 腾飞张 on 2024/3/29.
//

import Cocoa

/**
 输入：text1 = "aacde", text2 = "ace"
 输出：3
 解释：最长公共子序列是 "ace" ，它的长度为 3 。

 https://leetcode.cn/problems/longest-common-subsequence/description/
 
 参考了编辑距离的实现方式
 */

class LongestCommonSubsequenceClass: NSObject {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        
        let text1Array = Array(text1)
        let text2Array = Array(text2)

        var dp = [[Int]](repeating: [Int](repeating: 0, count: text2Array.count+1), count: text1.count+1)
        
        for i in 1..<text1Array.count+1 {
            for j in 1..<text2Array.count+1 {
                let top = dp[i-1][j]
                let left = dp[i][j-1]
                var topLeft = dp[i-1][j-1]
                if text1Array[i-1] == text2Array[j-1] {
                    topLeft += 1
                }
                dp[i][j] = max(top, left,topLeft)
            }
        }
        return dp[text1Array.count][text2Array.count]
    }

    /**

     shmtul qr ypy
     oxcp qr svwf
     */
    func main() {
        let result = longestCommonSubsequence("abcde", "ace")
        print(result)
    }
}
