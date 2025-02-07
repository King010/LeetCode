//
//  有效的括号.swift
//  testMacOS
//
//  Created by 腾飞张 on 2024/3/27.
//

import Cocoa

class KuoHaoIsValid: NSObject {
    func isValid(_ s: String) -> Bool {
        if s.count % 2 == 1 {
            return false
        }

        let map: [Character: Character] = ["{": "}", "[": "]", "(": ")"]
        var stack = [Character]()
        let array = Array(s)
        for (idx, item) in array.enumerated() {
            if map.keys.contains(item) {
                stack.append(item)
            } else {
                if let pre = stack.last {
                    if map[pre] == item {
                        stack.removeLast()
                    } else {
                        return false
                    }
                } else {//不能删除，避免只输入右括号
                    stack.append(item)
                }
            }
        }
        return stack.count == 0
    }

    func main() {
//        ([}}])
        let result = isValid("))")
        print(result)
    }
}
