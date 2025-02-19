//
//  字符串的排列.swift
//  testMacOS
//
//  Created by 腾飞张 on 2025/2/14.
//

import Foundation
/**
 https://leetcode.cn/problems/permutation-in-string/description/

 输入：s1 = "ab" s2 = "eidbaooo"
 输出：true
 解释：s2 包含 s1 的排列之一 ("ba").
 */

class StringCheckInclusion: NSObject {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        let s1Array = Array(s1)
        let s2Array = Array(s2)
        var window = [Character: Int]()
        var need = [Character: Int]()
        for item in s1Array {
            need[item] = (need[item] ?? 0) + 1
        }
        var left = 0
        var right = 0
        var valid = 0
        while right < s2Array.count {
            let currentChar = s2Array[right]
            right += 1
            if (need[currentChar] ?? 0) > 0 {
                window[currentChar] = (window[currentChar] ?? 0) + 1
                if window[currentChar] == need[currentChar] {
                    valid += 1
                }
            }
            // eidboaoo   ab
            while valid == need.count, left < right {
                let currentChar = s2Array[left]
                if right - left == s1.count {
                    return true
                }
                left += 1
                if (need[currentChar] ?? 0) > 0 {
                    if window[currentChar] == need[currentChar] {
                        valid -= 1
                    }
                    window[currentChar] = (window[currentChar] ?? 0) - 1
                }
            }
        }
        return false
    }

    func main() {
        let s2 = "eidbaooo"
        // eidbaooo
        let s1 = "ab"
        let result = checkInclusion(s1, s2)
        print(result)
    }
}
