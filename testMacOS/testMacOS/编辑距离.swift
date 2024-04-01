//
//  编辑距离.swift
//  testMacOS
//
//  Created by 腾飞张 on 2024/3/29.
//

import Cocoa

/**
 输入：word1 = "horse", word2 = "ros"
 输出：3
 解释：
 horse -> rorse (将 'h' 替换为 'r')
 rorse -> rose (删除 'r')
 rose -> ros (删除 'e')

 https://leetcode.cn/problems/edit-distance/solutions/487106/72-bian-ji-ju-chi-by-cobbly/
 */

class MinDistanceClass: NSObject {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        if word1.count == 0 || word2.count == 0 {
            return word1.count + word2.count
        }
        let arrayWord1 = Array(word1)
        let arrayWord2 = Array(word2)
        let row = arrayWord1.count + 1
        let col = arrayWord2.count + 1
        var dp = [[Int]](repeating: [Int](repeating: 0, count: col), count: row)

        dp[0][0] = 0

        for i in 1..<row {
            dp[i][0] = i
        }
        for i in 1..<col {
            dp[0][i] = i
        }

        for i in 1..<row {
            for j in 1..<col {
                let left = dp[i-1][j] + 1
                let top = dp[i][j-1] + 1
                var leftTop = dp[i-1][j-1]
                if arrayWord1[i-1] != arrayWord2[j-1] {
                    leftTop += 1
                }
                dp[i][j] = min(left, top, leftTop)
            }
        }

        return dp[row-1][col-1]
    }
}
