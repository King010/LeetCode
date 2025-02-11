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
        var result = Array(repeating: Array(repeating: 0, count: n), count: n)
        var upBound = 0
        var downBound = n - 1
        var leftBound = 0
        var rightBound = n - 1

        var num = 1
        while num <= n * n {
            //保证顶部边间是合理的，才开始填充顶部，从左到右一次填充
            if upBound <= downBound && leftBound <= rightBound {
                for leftIndex in leftBound...rightBound {
                    result[upBound][leftIndex] = num
                    num += 1
                }
                upBound += 1
            }
            if leftBound <= rightBound && upBound <= downBound {
                for upIndex in upBound...downBound {
                    result[upIndex][rightBound] = num
                    num += 1
                }
                rightBound -= 1
            }
            if downBound >= upBound && leftBound <= rightBound {
                for rightIndex in (leftBound...rightBound).reversed() {
                    result[downBound][rightIndex] = num
                    num += 1
                }
                downBound -= 1
            }
            if rightBound >= leftBound && upBound <= downBound {
                for downIndex in (upBound...downBound).reversed() {
                    result[downIndex][leftBound] = num
                    num += 1
                }
                leftBound += 1
            }
        }
        return result
    }
    
    func generateMatrix1(_ n: Int) -> [[Int]] {
        var result = Array(repeating: Array(repeating: 0, count: n), count: n)
        var upBound = 0
        var downBound = n - 1
        var leftBound = 0
        var rightBound = n - 1

        var num = 1
        while num <= n * n {
            
            if upBound <= downBound {
                for leftIndex in leftBound...rightBound {
                    result[upBound][leftIndex] = num
                    num += 1
                }
                upBound += 1
            }
            if leftBound <= rightBound{
                for upIndex in upBound...downBound {
                    result[upIndex][rightBound] = num
                    num += 1
                }
                rightBound -= 1
            }
            if downBound >= upBound  {
                for rightIndex in (leftBound...rightBound).reversed() {
                    result[downBound][rightIndex] = num
                    num += 1
                }
                downBound -= 1
            }
            if rightBound >= leftBound {
                for downIndex in (upBound...downBound).reversed() {
                    result[downIndex][leftBound] = num
                    num += 1
                }
                leftBound += 1
            }
        }
        return result
    }
    
//    func generateMatrix(_ n: Int) -> [[Int]] {
//        // 处理边界条件
//        if n <= 0 {
//            return []
//        }
//
//        // 初始化结果矩阵
//        var result = Array(repeating: Array(repeating: 0, count: n), count: n)
//
//        // 定义边界
//        var top = 0
//        var bottom = n - 1
//        var left = 0
//        var right = n - 1
//
//        var num = 1
//
//        while num <= n * n {
//            // 从左到右填充上边界
//            for i in left...right {
//                result[top][i] = num
//                num += 1
//            }
//            top += 1
//
//            // 从上到下填充右边界
//            for i in top...bottom {
//                result[i][right] = num
//                num += 1
//            }
//            right -= 1
//
//            // 从右到左填充下边界
//            if top <= bottom {
//                for i in (left...right).reversed() {
//                    result[bottom][i] = num
//                    num += 1
//                }
//                bottom -= 1
//            }
//
//            // 从下到上填充左边界
//            if left <= right {
//                for i in (top...bottom).reversed() {
//                    result[i][left] = num
//                    num += 1
//                }
//                left += 1
//            }
//        }
//
//        return result
//    }
    
    func main() {
      
        
        let result = generateMatrix(3)
        print(result)
    }
}
