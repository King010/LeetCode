//
//  最长不重复子串第二版.swift
//  testMacOS
//
//  Created by 腾飞张 on 2025/2/17.
//

import Cocoa

/**
 输入: s = "abcabcbb"
 输出: 3
 解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。
 */

class LengthOfLongestSubstring2: NSObject {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var sArray = Array(s)
        var left = 0
        var right = 0
        var window = [Character: Int]()
        var length = 0
        var maxLength = 0
        while right < s.count {
            let currentRightChar = sArray[right]
            window[currentRightChar] = (window[currentRightChar] ?? 0) + 1
            right += 1
            while (window[currentRightChar] ?? 0) > 1 && left < right{
                let currentLeftChar = sArray[left]
                left += 1
//                if (currentLeftChar == currentRightChar) {
//                    window[currentRightChar] = (window[currentRightChar] ?? 0) - 1
//                }
                window[currentLeftChar] = (window[currentLeftChar] ?? 0) - 1
            }
            maxLength = max(maxLength, right - left)
        }
        return maxLength
    }
    
    func main() {
        let s = "pwwkew"
        let result = lengthOfLongestSubstring(s)
        print(result)
    }
}
