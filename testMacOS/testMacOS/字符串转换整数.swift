//
//  字符串转换整数.swift
//  testMacOS
//
//  Created by 腾飞张 on 2024/3/31.
//

import Cocoa

class MyAtoiClass: NSObject {
    func myAtoi(_ s: String) -> Int {
        var res = 0
        var sign = 1
        var signFound = false
        var digitFound = false
        for char in s {
            if char == " " {
                if digitFound || signFound {
                    break
                }
                continue
            }
            if char == "-" || char == "+" {
                if signFound || digitFound {
                    break
                }
                sign = char == "-" ? -1 : 1
                signFound = true
                continue
            }
            guard let digit = char.wholeNumberValue else {
                break
            }
            digitFound = true
            if res * 10 + digit > Int(Int32.max) {
                res = Int(Int32.max)
                res += (sign < 0 ? 1 : 0)   //Int32.min 个位是8 whereas Int32.max个位是7
                break
            }
            res = res * 10 + digit
        }
        return res * sign
    }

    func main() {
        print(myAtoi("20000000000000000000"))
    }
}
