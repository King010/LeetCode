//
//  岛屿数量.swift
//  算法
//
//  Created by 腾飞张 on 2024/3/26.
//

import Cocoa

/**
 输入：grid = [
   ["1","1","1","1","0"],
   ["1","1","0","1","0"],
   ["1","1","0","0","0"],
   ["0","0","0","0","0"]
 ]
 输出：1
 https://leetcode.cn/problems/number-of-islands/description/
 */

class NumIslandsClass: NSObject {
    func numIslands(_ grid: [[String]]) -> Int {
        var count = 0
        var length = grid.count
        var newGrid = grid
        var height = grid.first?.count ?? 0
        for i in 0..<length {
            for j in 0..<height {
                if newGrid[i][j] == "1" {
                    count += 1
                    dps(&newGrid, i, col: j)
                }
            }
        }
        
        return count
    }
    
    func dps(_ grid: inout [[String]], _ row: Int, col: Int) {
        let originRow = grid.count
        let originCol = grid.first?.count ?? 0
        if row >= originRow || col >= originCol || row < 0 || col < 0 || grid[row][col] == "0" {
            return
        }
        grid[row][col] = "0"
        dps(&grid, row-1, col: col)
        dps(&grid, row+1, col: col)
        dps(&grid, row, col: col+1)
        dps(&grid, row, col: col-1)
    }
    
    func main() {
        let array = [["1","1","1","1","0"],
                     ["1","1","0","1","0"],
                     ["1","1","0","0","0"],
                     ["0","0","0","0","0"]]
        let count = numIslands(array)
        print(count)
    }
    
}
