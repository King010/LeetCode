//
//  螺旋矩阵.swift
//  testMacOS
//
//  Created by 腾飞张 on 2024/3/27.
//

import Cocoa

/**
 输入：matrix = [[1,2,3],[4,5,6],[7,8,9]]
 输出：[1,2,3,6,9,8,7,4,5]

 [1,2,3],
 [4,5,6],
 [7,8,9]
 https://leetcode.cn/problems/spiral-matrix/description/
 3
 2
 */

class SpiralOrderClass: NSObject {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        var arrow = "right"
        var result = [Int]()
        var row = 0
        var col = 0
        var leftMin = 0
        var rightMax = (matrix.first?.count ?? 0) - 1
        var upMin = 0
        var upMax = matrix.count - 1
        let rowLength = matrix.first?.count ?? 1
        let colLength = matrix.count
        result.append(matrix[0][0])
        if rightMax == 0 {
            arrow = "down"
        }
        while result.count < rowLength * colLength {
            if arrow == "right" {
                col += 1
                if col == rightMax {
                    upMin += 1
                    arrow = "down"
                }
            } else if arrow == "down" {
                row += 1
                if row == upMax {
                    rightMax -= 1
                    arrow = "left"
                }
            } else if arrow == "left" {
                col -= 1
                if col == leftMin {
                    upMax -= 1
                    arrow = "up"
                }
            } else if arrow == "up" {
                row -= 1
                if row == upMin {
                    upMin += 1
                    arrow = "right"
                }
            }
            result.append(matrix[row][col])
        }
        return result
    }

    func main() {
        let result = spiralOrder([[3], [2]])
        print(result)
    }
}
