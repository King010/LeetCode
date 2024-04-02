//
//  旋转图像.swift
//  testMacOS
//
//  Created by 腾飞张 on 2024/4/2.
//

import Cocoa


/**
 
 输入：matrix =
 [[1,2,3],
 [4,5,6],
 [7,8,9]]
 输出：[
 [7,4,1],
 [8,5,2],
 [9,6,3]]
 https://leetcode.cn/problems/rotate-image/description/
 
 
 1 4 7
 2 5 8
 3 6 9
 对角线镜像，左右镜像
 
 */



class RotateArrayClass: NSObject {
    //找规律
//    func rotate(_ matrix: inout [[Int]]) {
//            let n = matrix.count
//            if n <= 1 {
//                return
//            }
//            let mat = matrix
//            for i in 0..<n {
//                for j in 0..<n {
//                    matrix[i][j] = mat[n-j-1][i]
//                }
//            }
//        }

    func rotate(_ matrix: inout [[Int]]) {
        let n = matrix.count

        for i in 0..<n {
            for j in i..<n {
                let temp = matrix[i][j]
                matrix[i][j] = matrix[j][i]
                matrix[j][i] = temp
            }
        }

        for i in 0..<n {
            for j in 0..<n / 2 {
                let temp = matrix[i][j]
                matrix[i][j] = matrix[i][n-j-1]
                matrix[i][n-j-1] = temp
            }
        }
    }
    
    func main() {
        var array = [[1,2,3],
                     [4,5,6],
                     [7,8,9]]
        let result = rotate(&array)
        print(result)
    }
    
}
