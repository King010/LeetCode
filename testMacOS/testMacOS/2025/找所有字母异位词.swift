//
//  找所有字母异位词.swift
//  testMacOS
//
//  Created by 腾飞张 on 2025/2/17.
//

/**
 输入: s = "cbacebabacd", p = "abc"
 输出: [0,6]
 解释:
 起始索引等于 0 的子串是 "cba", 它是 "abc" 的异位词。
 起始索引等于 6 的子串是 "bac", 它是 "abc" 的异位词。
 
 https://leetcode.cn/problems/find-all-anagrams-in-a-string/description/
 */

import Cocoa

class FindAnagramsClass: NSObject {
    func findAnagrams(_ s: String, _ p: String) -> [Int] {
        var result = [Int]()
        var sArray = Array(s)
        var pArray = Array(p)
        var left = 0
        var right = 0
        var window = [Character: Int]()
        var need = [Character: Int]()
        var valid = 0
        for item in pArray {
            need[item] = 1 + (need[item] ?? 0)
        }
        
        while right < s.count {
            let currentRightChar = sArray[right]
            right += 1
            
            if ((need[currentRightChar] ?? 0) > 0) {
                window[currentRightChar] = (window[currentRightChar] ?? 0) + 1
                if (window[currentRightChar] == need[currentRightChar]) {
                    valid += 1
                }
            }
            
            while valid == need.count || window.count > need.count {
                if (right - left) == p.count {
                    result.append(left)
                }
                let currrentLeftChar = sArray[left]
                left += 1
                if ((need[currrentLeftChar] ?? 0) > 0) {
                    if (window[currrentLeftChar] == need[currrentLeftChar]) {
                        valid -= 1
                    }
                    window[currrentLeftChar] = (window[currrentLeftChar] ?? 0) - 1
                }
            }
        }
        return result
    }
    
    
    func main() {
        let s = "cbaebabacd"
        let p = "abc"
        let result = findAnagrams(s, p)
        print(result)
    }
    
}
