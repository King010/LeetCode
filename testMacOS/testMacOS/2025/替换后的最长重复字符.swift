//
//  替换后的最长重复字符.swift
//  testMacOS
//
//  Created by 腾飞张 on 2025/2/24.
//

import Cocoa

/**
 给你一个字符串 s 和一个整数 k 。你可以选择字符串中的任一字符，并将其更改为任何其他大写英文字符。该操作最多可执行 k 次。
 
 在执行上述操作后，返回 包含相同字母的最长子字符串的长度。
 
 
 
 示例 1：
 
 输入：s = "ABAB", k = 2
 输出：4
 解释：用两个'A'替换为两个'B',反之亦然。
 https://leetcode.cn/problems/longest-repeating-character-replacement/description/
 */

class CharacterReplacementClass: NSObject {
    func characterReplacement(_ s: String, _ k: Int) -> Int {
        var left = 0
        var right = 0
        var sArray = Array(s)
        //        var windowSameCount = 0
        var windowSame = [Character: Int]()
        var windowMaxCount = 0
        var res = 0
        while right < s.count {
            let currentRightChar = sArray[right]
            windowSame[currentRightChar] = 1 + (windowSame[currentRightChar] ?? 0)
            windowMaxCount = max(windowMaxCount, windowSame[currentRightChar] ?? 0)
            right += 1
            if right - left - windowMaxCount > k &&  left < right {
                let currentLeftChar = sArray[left]
                windowSame[currentLeftChar] = (windowSame[currentLeftChar] ?? 0) - 1
                left += 1
                windowMaxCount = max(windowMaxCount, windowSame[currentLeftChar] ?? 0)
            }
            res = max(res, right - left)
        }
        return res
    }
    
    //比上面快，上面可能超时
    func characterReplacement1(_ s: String, _ k: Int) -> Int {
        var s = Array(s), map = [Int](repeating: 0, count: 26), i = 0, j = 0, ma = 0
        while j < s.count {
            // 每次向右添加一个新的字母
            let J = Int(s[j].asciiValue!) - 65
            map[J] += 1
            ma = max(ma, map[J])
            j += 1
            // 如果替换超过k个，减少一个最左边，此时无论是否超过k个，宽度仍然在历史最长上
            // 如果后续还有更长的，则ma会倾向于更大，判定会倾向于跳过，所以长度会变长
            // 否则直接返回历史最长
            if j - i - ma > k {
                let I = Int(s[i].asciiValue!) - 65
                map[I] -= 1
                i += 1
            }
        }
        return j - i
    }
    
    func main() {
        let s = "ABAB", k = 2
        /**
         s = "ABAB", k = 2
         输入：s = "AABABBA", k = 1
         输出：4
         */
        let result = characterReplacement1(s, k)
        print(result)
    }
}
