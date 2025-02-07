//
//  电话号码的数字组合.swift
//  testMacOS
//
//  Created by 腾飞张 on 2024/4/2.
//

import Cocoa

/**
 输入：digits = "23"
 输出：["ad","ae","af","bd","be","bf","cd","ce","cf"]

 https://leetcode.cn/problems/letter-combinations-of-a-phone-number/description/
 */

class LetterCombinationsClass: NSObject {
    var map = ["2": "abc", "3": "def", "4": "ghi", "5": "jkl", "6": "mno", "7": "pqrs", "8": "tuv", "9": "wxyz"]

    var result = [String]()

    func letterCombinations(_ digits: String) -> [String] {
        if digits.isEmpty {
            return [String]()
        }
        var allString = ""
        search(&allString, digits, 0)
        return result
    }

    func search(_ string: inout String, _ digits: String, _ index: Int) {
        if index == digits.count {
            result.append(string)
            return
        }

        let currentDigit = Array(digits)[index]
        let digitString = map[String(currentDigit)]!

        for item in digitString {
            string.append(item)
            search(&string, digits, index + 1)
            string.removeLast()
        }
    }

    func main() {
        let result = letterCombinations("23")
        print(result)
    }
}
