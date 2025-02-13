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
    
    //可用但会超时
    func minWindow(_ s: String, _ t: String) -> String {
        var need = [Character: Int]()
        var window = [Character: Int]()
        var valid = 0
        
        var sArray = Array(s)
        var tArray = Array(t)
        var left = 0
        var right = 0
        for item in tArray {
            need[item] = 1 + (need[item] ?? 0)
        }
        
        var minString = s+t
        var length = Int.max
        var start = 0
        while right < sArray.count {
            
            let currentRightChar = sArray[right]
            right += 1
            if ((need[currentRightChar] ?? 0) > 0) {
                window[currentRightChar] = (window[currentRightChar] ?? 0) + 1
                if window[currentRightChar] == need[currentRightChar] {//当某个字符个数满足时才有效
                    valid += 1
                }
            }
            // s: abaaaaa  t aab
            while valid == need.count && left < right{//根据有效值判断是否已经满足
                let currentLeftChar = sArray[left]
                
                let validString = String(sArray[left..<right]) //每次取字符串会超时
                if validString.count < minString.count {
                    minString = validString
                }
                left += 1
                if (need[currentLeftChar] ?? 0 > 0) {
                    if (window[currentLeftChar] == need[currentLeftChar]) {
                        valid -= 1
                    }
                    window[currentLeftChar] = (window[currentLeftChar] ?? 0) - 1
                }
            }
        }
        
        if minString == s+t {
            return ""
        }
        return minString
    }
    
//    func minWindow(_ s: String, _ t: String) -> String {
//        var need = [Character: Int]()
//        var window = [Character: Int]()
//        var valid = 0
//
//        var sArray = Array(s)
//        var tArray = Array(t)
//        var left = 0
//        var right = 0
//        for item in tArray {
//            need[item] = 1 + (need[item] ?? 0)
//        }
//
////        var minString = s
//        var length = Int.max
//        var start = 0
//        while right < sArray.count {
//
//            let currentRightChar = sArray[right]
//            right += 1
//            if ((need[currentRightChar] ?? 0) > 0) {
//                window[currentRightChar] = (window[currentRightChar] ?? 0) + 1
//                if window[currentRightChar] == need[currentRightChar] {//当某个字符个数满足时才有效
//                    valid += 1
//                }
//            }
//            // s: abaaaaa  t aab
//            while valid == need.count && left < right{//根据有效值判断是否已经满足
//                let currentLeftChar = sArray[left]
////                if need[currentLeftChar] == 0 {
////                    left += 1
////                } else {
////                    let validString = String(sArray[left..<right])
////                    if validString.count < minString.count {
////                        minString = validString
////                    }
//                    if (right - left) < length {
//                        start = left
//                        length = right - left
//                    }
//
//                    left += 1
//                    if ((need[currentLeftChar] ?? 0) > 0) {
//                        if window[currentLeftChar] == need[currentLeftChar] {//当某个字符个数满足时才有效
//                            valid -= 1
//                        }
//                        window[currentLeftChar] = (window[currentLeftChar] ?? 1) - 1
//                    }
////                }
//            }
//        }
//        if length == Int.max {
//            return ""
//        }
//        return String(sArray[start..<start+length])
////        return minString
//    }
    
    
    //即使改好可估计也超时
//    func minWindow(_ s: String, _ t: String) -> String {
//        let sArray = Array(s)
//        let tArray = Array(t)
//        var minLengtString = ""
//        for (idx, _) in sArray.enumerated() {
//            if (idx == 9) {
//                print(idx)
//            }
//            for jdx in idx ... sArray.count {
//                let startIndex = s.index(s.startIndex, offsetBy: idx) // 位置
//                let endIndex = s.index(s.startIndex, offsetBy: jdx)   // 位置 5
//                // 获取子串
//                let substring = s[startIndex..<endIndex]
//                let length = jdx - idx
//                if hasContain(s: String(substring), t: t) && length < minLengtString.count || (minLengtString == "" && hasContain(s: String(substring), t: t)) {
//                    minLengtString = String(substring)
//                }
//            }
//        }
//        return minLengtString
//    }
//
//    func hasContain(s: String, t: String) -> Bool{
//        let tArray = Array(t)
//        for item in tArray {
//            if !s.contains(item) {
//                return false
//            }
//        }
//        if s.count < t.count {
//            return false
//        }
//        return true
//    }
    
    
    func main() {
        let s = "ADOBECODEBANC"
        let t = "ABC"
        let result = minWindow(s, t)
        print(result)
    }
}
