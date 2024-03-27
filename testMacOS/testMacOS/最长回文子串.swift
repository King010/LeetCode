//
//  最长回文子串.swift
//  testMacOS
//
//  Created by 腾飞张 on 2024/3/25.
//

import Cocoa
// abccba
// 1
// https://leetcode.cn/problems/longest-palindromic-substring/
//https://leetcode.cn/problems/longest-substring-without-repeating-characters/
class LongestPalindromeClass: NSObject {
    func longestPalindrome(_ s: String) -> String {
        var startIndex = 0
        var endIndex = 0
        let charArray = Array(s)
        var maxLength = 0
        for idx in 0 ..< charArray.count {
            let length1 = expandString(s, idx, idx)
            let length2 = expandString(s, idx, idx + 1)
            let tmpLength = max(length1, length2)
            if tmpLength > maxLength {
                maxLength = max(maxLength, tmpLength)
                // 如果不-1，偶数可能会下标越界  参考 abccba或 abcba
                startIndex = idx - (tmpLength - 1)/2
                endIndex = idx + tmpLength/2
            }
        }
        
        return String(charArray[startIndex ... endIndex])
    }
    
    func expandString(_ s: String, _ l: Int, _ r: Int) -> Int {
        var left = l
        var right = r
        var length = 0
        let charArray = Array(s)
        while left >= 0, right <= s.count - 1 {
            if charArray[left] == charArray[right] {
                length = max(length, right - left + 1)
            }
            left -= 1
            right += 1
        }
        return length
    }
    
    func main() {
        let string = "cbbd"
        let result = longestPalindrome(string)
        print(result)
    }
}
