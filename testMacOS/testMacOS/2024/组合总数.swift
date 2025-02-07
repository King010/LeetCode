//
//  组合总数.swift
//  testMacOS
//
//  Created by 腾飞张 on 2024/4/2.
//

/**
 https://leetcode.cn/problems/Ygoe9J/description/
 给定一个无重复元素的正整数数组 candidates 和一个正整数 target ，找出 candidates 中所有可以使数字和为目标数 target 的唯一组合。

 candidates 中的数字可以无限制重复被选取。如果至少一个所选数字数量不同，则两种组合是不同的。

 对于给定的输入，保证和为 target 的唯一组合数少于 150 个。
 
 示例 1：

 输入: candidates = [2,3,6,7], target = 7
 输出: [[7],[2,2,3]]
 示例 2：

 输入: candidates = [2,3,5], target = 8
 输出: [[2,2,2,2],[2,3,3],[3,5]]
 */

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
