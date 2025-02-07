//
//  Z字形变换.swift
//  testMacOS
//
//  Created by 腾飞张 on 2024/4/1.
//

import Cocoa
/**
 输入：s = "PAYPALISHIRING", numRows = 4
 输出："PINALSIGYAHRPI"
 解释：
 P       I    N
 A   L S  I G
 Y A   H R
 P       I
 https://leetcode.cn/problems/zigzag-conversion/
 */

class ZConvert: NSObject {
    func convert(_ s: String, _ numRows: Int) -> String {
            if numRows < 1 {
                return ""
            }
            
            if numRows < 2 {
                return s
            }
            var exchage_stringArray: [String] = []
            
            for _ in 0..<numRows {
                exchage_stringArray.append("")
            }
            
            // 方向
            var y_direction = true
            var y_index = 0
        //PAYPALISHIRING
            for char in s {
                print(y_index)
                exchage_stringArray[y_index] += String(char)
                
                y_index += (y_direction ? 1 : -1) * 1
                
                if y_index == 0 {
                    y_direction = true
                } else if y_index == (numRows - 1) {
                    y_direction = false
                }
            }
            
            var exchange_string = ""
            for subString in exchage_stringArray {
                exchange_string += subString
            }
            
            return exchange_string
        }

//    func convert(_ s: String, _ numRows: Int) -> String {
//        if numRows < 1 {
//            return ""
//        }
//        if numRows < 2 {
//            return s
//        }
//        var result = ""
//        var row = numRows
//        var col = s.count
//        var down = true
//        var charArray = [[String]](repeating: [String](repeating: "", count: col), count: row)
//        var sArray = Array(s)
//
//        var rowIndex = 0
//        var colIndex = 0
//        var sIndex = 0
//        while sIndex < sArray.count {
//            charArray[rowIndex][colIndex] = String(sArray[sIndex])
//            sIndex += 1
//            if down {
//                if rowIndex == row - 1{
//                    rowIndex -= 1
//                    down = false
//                    colIndex += 1
//                } else {
//                    rowIndex += 1
//                }
//            } else {
//                if rowIndex == 0 {
//                    rowIndex += 1
//                    down = true
//                } else {
//                    colIndex += 1
//                    rowIndex -= 1
//                }
//            }
//        }
//
//        for i in 0..<numRows {
//            for j in 0..<s.count {
//                result.append(charArray[i][j])
//            }
//        }
//        return result
//    }
    func main() {
        let result = convert("PAYPALISHIRING", 3)
        print(result)
    }
    
    
}
