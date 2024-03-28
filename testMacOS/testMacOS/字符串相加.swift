//
//  字符串相加.swift
//  testMacOS
//
//  Created by 腾飞张 on 2024/3/28.
//

import Cocoa

/**
 示例 1：

 输入：num1 = "11", num2 = "123"
 输出："134"

  11
 123
 https://leetcode.cn/problems/add-strings/description/
 */

class AddStringsClass: NSObject {
//    func addStrings1(_ num1: String, _ num2: String) -> String {
//        var num1 = [Character](num1)
//        var num2 = [Character](num2)
//        if num1.count < num2.count {
//            num1 = Array(repeating: "0", count: num2.count - num1.count) + num1
//        }
//        if num2.count < num1.count {
//            num2 = Array(repeating: "0", count: num1.count - num2.count) + num2
//        }
//        var res = ""
//        var carry = 0
//        for i in (0...num1.count - 1).reversed() {
//            let tmp = Int(String(num1[i]))! + Int(String(num2[i]))! + carry
//            carry = tmp / 10
//            res += String(tmp % 10)
//        }
//        if carry > 0 {
//            res += String(carry)
//        }
//        return String(res.reversed())
//    }
    func addStrings(_ num1: String, _ num2: String) -> String {
        let count = max(num1.count, num2.count)
        var stringArr1: [Character] = Array(num1)
        var stringArr2: [Character] = Array(num2)
        if stringArr1.count > stringArr2.count {
            stringArr2 = Array(repeating: "0", count: stringArr1.count-stringArr2.count) + stringArr2
        } else {
            stringArr1 = Array(repeating: "0", count: stringArr2.count-stringArr1.count) + stringArr1
        }
        var result = ""
        var carry = 0
        for idx in (0 ..< count).reversed() {
            let tmp = Int(String(stringArr1[idx]))! + Int(String(stringArr2[idx]))! + carry
            result += String(tmp % 10)
            carry = tmp / 10
        }
        if carry != 0 {
            result += "\(carry)"
        }
        return String(result.reversed())
    }

    func main() {
        let result = addStrings("1", "9")
        print(result)
    }
}
