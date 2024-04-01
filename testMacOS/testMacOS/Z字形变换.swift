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
        var result = ""
        var row = numRows
        var col = s.count
        var down = true
        var charArray = [[String]](repeating: [String](repeating: "", count: col), count: row)
        var sArray = Array(s)
        
        var rowIndex = 0
        var colIndex = 0
        var sIndex = 0
        while sIndex < sArray.count {
            charArray[rowIndex][colIndex] = String(sArray[sIndex])
            sIndex += 1
            if down {
                if rowIndex == row - 1{
                    down = false
                    col += 1
                } else {
                    rowIndex += 1
                }
            } else {
                if rowIndex == 0 {
                    down = true
                } else {
                    col += 1
                    rowIndex -= 1
                }
            }
        }
        
        for i in 0..<numRows {
            for j in 0..<s.count {
                result.append(charArray[i][j])
            }
        }
        return result
    }
    func main() {
        let result = convert("PAYPALISHIRING", 3)
        print(result)
    }
    
    
}
