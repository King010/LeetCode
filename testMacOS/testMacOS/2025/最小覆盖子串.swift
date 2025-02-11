//
//  最小覆盖子串.swift
//  testMacOS
//
//  Created by 腾飞张 on 2025/2/10.
//

import Cocoa

class MinWindowClass: NSObject {
    /**
     输入：s = "ADOBECODEBANC", t = "ABC"
     输出："BANC"
     */
    func minWindow(_ s: String, _ t: String) -> String {
        let sArray = Array(s)
        let tArray = Array(t)
        var minLengtString = ""
        for (idx, _) in sArray.enumerated() {
            if (idx == 9) {
                print(idx)
            }
            for jdx in idx ... sArray.count {
                let startIndex = s.index(s.startIndex, offsetBy: idx) // 位置
                let endIndex = s.index(s.startIndex, offsetBy: jdx)   // 位置 5
                // 获取子串
                let substring = s[startIndex..<endIndex]
                let length = jdx - idx
                if hasContain(s: String(substring), t: t) && length < minLengtString.count || (minLengtString == "" && hasContain(s: String(substring), t: t)) {
                    minLengtString = String(substring)
                }
            }
        }
        return minLengtString
    }
    
    func hasContain(s: String, t: String) -> Bool{
        let tArray = Array(t)
        for item in tArray {
            if !s.contains(item) {
                return false
            }
        }
        if s.count < t.count {
            return false
        }
        return true
    }
    
    
    func main() {
        let s = "bbaa"
        let t = "aba"
        let result = minWindow(s, t)
        print(result)
    }
}
