//
//  复原IP地址.swift
//  testMacOS
//
//  Created by 腾飞张 on 2024/3/29.
//

import Cocoa

/**
 示例 1：

 输入：s = "255 255 11 135"
 输出：["255.255.11.135","255.255.111.35"]
 示例 2：

 输入：s = "0000"
 输出：["0.0.0.0"]
 https://leetcode.cn/problems/restore-ip-addresses/description/
 */

class RestoreIpAddressesClass: NSObject {
    var path = [String]()
    var res = [String]()

    func restoreIpAddresses(_ s: String) -> [String] {
        var charArray = Array(s)
        backTrack(charArray, start: 0)
        return res
    }

    func backTrack(_ s: [Character], start: Int) {
        if path.count == 4, start == s.count {
            res.append(path.joined(separator: "."))
            return
        }
        if path.count > 4 {
            return
        }

        let length = 3

        for idx in 1 ... length {
            // 注意区间边间计算
            if (start + idx) > s.count || (idx != 1 && s[start] == "0") {
                return
            }
            // 255 255 111 35
            let currentString = String(s[start ..< start + idx])
            // 大于255的前提是长度为3，直接判断会  "3">"255"
            if currentString > "255", idx == 3 {
                return
            }
            path.append(currentString)
            backTrack(s, start: start + idx)
            path.removeLast()
        }
    }

    func main() {
        let result = restoreIpAddresses("25525511135")
        print(result)
    }
}
