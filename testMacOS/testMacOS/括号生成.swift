//
//  括号生成.swift
//  testMacOS
//
//  Created by 腾飞张 on 2024/3/31.
//

import Cocoa

class GenerateParenthesisClass: NSObject {
    var result = [String]()
    var path = ""
    func generateParenthesis(_ n: Int) -> [String] {
        digui(n, 0, 0)
        return result
    }
    
    func digui(_ n: Int, _ left: Int,_ right: Int) {
        if path.count == n*2 {
            result.append(path)
            return
        }
        if left < n {
            path.append("(")
            digui(n, left+1, right)
            path.removeLast()
        }
        if left > right {
            path.append(")")
            digui(n, left, right+1)
            path.removeLast()
        }
    }
    
    func main() {
        let result = generateParenthesis(3)
        print(result)
    }
}
