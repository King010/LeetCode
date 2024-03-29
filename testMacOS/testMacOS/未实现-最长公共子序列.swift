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
 */

class LongestCommonSubsequenceClass: NSObject {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        let longString = text1.count > text2.count ? text1 : text2
        let shortString = text1.count > text2.count ? text2 : text1
        let longStringArray = Array(longString)
        let shortStringArray = Array(shortString)
        var longStringIndex = 0
        var shortStringIndex = 0
        var maxLength = 0
        
        while shortStringIndex != shortString.count {
            var findTag = false
            for startIndex in longStringIndex..<longString.count {
                if shortStringArray[shortStringIndex] == longStringArray[startIndex] {
                    maxLength += 1
                    findTag = true
                    shortStringIndex += 1
                    longStringIndex = startIndex + 1
                    break
                }
            }

            if !findTag {
                shortStringIndex += 1
            }
        }
        return maxLength
    }

    /**

     shmtul qr ypy
     oxcp qr svwf
     */
    func main() {
        let result = longestCommonSubsequence("oxcpqrsvwf", "shmtulqrypy")
        print(result)
    }
}
