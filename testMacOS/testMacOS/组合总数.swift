//
//  组合总数.swift
//  testMacOS
//
//  Created by 腾飞张 on 2024/4/2.
//

import Cocoa

class CombinationSumClass: NSObject {
    var result = [[Int]]()
    var path = [Int]()
    
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var candidates = candidates.sorted()
        
        dfs(candidates, target, 0, 0)
        return result
    }
    
    func dfs(_ candidates: [Int], _ target: Int, _ ans: Int, _ index: Int) {
        if index == candidates.count {
            return
        }
        if ans == target {
            result.append(path)
            return
        }
        
        if (ans + candidates[index]) > target {
            return
        }
        
        path.append(candidates[index])
        dfs(candidates, target, ans + candidates[index], index)
        path.removeLast()
        dfs(candidates, target, ans, index+1)
    }
    
    func currentPathSum(_ path: [Int]) -> Int {
        var result = 0
        for item in path {
            result += item
        }
        return result
    }
}
