//
//  最长不重复子串.swift
//  testMacOS
//
//  Created by 腾飞张 on 2024/3/26.
//

import Cocoa

/**
 输入: s = "abcabcbb"
 输出: 3
 https://leetcode.cn/problems/longest-substring-without-repeating-characters/description/
 */

class LengthOfLongestSubstringClass: NSObject {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var maxLen = 0
        var start = 0
        // key值为字符，value值为字符位置+1
        var map = [Character: Int]()
        for (end, c) in s.enumerated() {
            /*
             希望 start 移动到重复字符的下一个位置，而不是重复字符的位置。
             具体来说，当我们遇到一个重复字符时，我们会将 start 更新为当前重复字符的下一个位置，以确保在计算当前子串长度时，不包含重复字符
             **/
            //必须要max(start, pos+1)，不然可能找到重复字符中靠前的字符
            if let pos = map[c] {
                start = max(start, pos+1)
            }

            map[c] = end
            maxLen = max(maxLen, end - start + 1)
        }
        return maxLen
    }


    func main() {
        let result = lengthOfLongestSubstring("abba")
        print(result)
    }
}
