//
//  螺旋矩阵2.swift
//  testMacOS
//
//  Created by 腾飞张 on 2025/2/11.
//

/**
 输入：n = 3
 输出：    [[1,2,3],
        [8,9,4],
        [7,6,5]]
 */

import Foundation

class LuoXuanJuzhen2: NSObject {
    func generateMatrix(_ n: Int) -> [[Int]] {
        var result = [[Int]]()
        var upBound = 0
        var downBound = n - 1
        var leftBound = 0
        var rightBound = n - 1

        var num = 1
        while num <= n * n {
            if upBound <= downBound {
                for leftIndex in leftBound..<rightBound {
                    result[upBound][leftIndex] = num
                    num += 1
                }
                upBound += 1
            }
            if leftBound <= rightBound {
                for upIndex in upBound..<downBound {
                    result[rightBound][upIndex] = num
                    num += 1
                }
                rightBound -= 1
            }
            if downBound >= upBound {
                for rightIndex in (leftBound..<rightBound).reversed() {
                    result[downBound][rightIndex] = num
                    num += 1
                }
                downBound -= 1
            }
            if rightBound < leftBound {
                for downIndex in (upBound..<downBound).reversed() {
                    result[downIndex][leftBound] = num
                    num += 1
                }
                rightBound -= 1
            }
        }
        return result
    }

    func main() {
        let result = generateMatrix(3)
        print(result)
    }
}
