//
//  至少有 K 个重复字符的最长子串.swift
//  testMacOS
//
//  Created by 腾飞张 on 2025/2/26.
//

import Cocoa

/**
 给你一个字符串 s 和一个整数 k ，请你找出 s 中的最长子串， 要求该子串中的每一字符出现次数都不少于 k 。返回这一子串的长度。

 如果不存在这样的子字符串，则返回 0。

 示例 1：

 输入：s = "aaabb", k = 3
 输出：3
 解释：最长子串为 "aaa" ，其中 'a' 重复了 3 次。

 https://leetcode.cn/problems/longest-substring-with-at-least-k-repeating-characters/description/
 */

class LongestSubstringClass: NSObject {
    func longestSubstring(_ s: String, _ k: Int) -> Int {
        var left = 0, right = 0
        var sArray = Array(s)
        var maxLength = 0
        var windowCharDic = [Character: Int]()
        while right < s.count {
            let currentRightValue = sArray[right]
            windowCharDic[currentRightValue] = 1 + (windowCharDic[currentRightValue] ?? 0)
            right += 1
            
        }

        return maxLength
    }

    func main() {
        let s = "aaabb", k = 3
        let result = longestSubstring(s, k)
        print(result)
    }
}
