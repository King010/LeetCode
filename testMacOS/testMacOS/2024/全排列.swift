//
//  全排列.swift
//  testMacOS
//
//  Created by 腾飞张 on 2024/3/27.
//

import Cocoa

/**
 示例 1：

 输入：nums = [1,2,3]
 输出：[[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
 示例 2：

 输入：nums = [0,1]
 输出：[[0,1],[1,0]]
 https://leetcode.cn/problems/permutations/description/
 */

class ArrayPermuteClass: NSObject {
    var result = [[Int]]()

    func permute(_ nums: [Int]) -> [[Int]] {
        var visit = Array(repeating: false, count: nums.count)
        dfs(&visit, nums, [])
        return result
    }

    func dfs(_ visit: inout [Bool], _ nums: [Int], _ path: [Int]) {
        if path.count == nums.count {
            result.append(path)
        }
        for idx in 0 ..< nums.count {
            if visit[idx] == true {
                continue
            }
            visit[idx] = true
            let newpath = [nums[idx]] + path
            dfs(&visit, nums, newpath)
            visit[idx] = false
        }
    }

//    func permute1(_ nums: [Int]) -> [[Int]] {
//        var result = [[Int]()]
//        // 初始化为一个空值
//        var prev: [[Int]]
//        // 当前Int数组
//        var cur: [Int]
//        // 遍历nums中的每一个元素
//        for num in nums {
//            // 每轮循环前，用prev装旧值，result清空
//            prev = result
//            result = [[Int]]()
//            // 遍历旧值
//            for i in 0 ..< prev.count {
//                // 尝试插入到 previ 中的每一项中去
//                for j in 0 ... prev[i].count {
//                    cur = prev[i]
//                    if j < cur.count {
//                        cur.insert(num, at: j)
//                    } else {
//                        cur.append(num)
//                    }
//                    result.append(cur)
//                    // print("cur === \(cur),num = \(num), i = \(i), j = \(j)")
//                }
//                // print("result === \(result)")
//            }
//        }
//        return result
//    }

    func main() {
        let result = permute([1, 2, 3])
        print(result)
    }
}

/**

 class Solution {
     var res = [[Int]]()
     func permute(_ nums: [Int]) -> [[Int]] {
         //设置一个保存是否使用过的数组 [false, false ,false]
         var visitedStausList = Array(repeating: false, count: nums.count)
         dfs(nums, [], &visitedStausList)
         return res
     }

     func dfs(_ nums: [Int], _ path: [Int], _ visitedStausList: inout [Bool]) {
         if path.count == nums.count {
             res.append(path)
             return
         }

         for index in 0..<nums.count {
             // 已经使用过，continue
             if visitedStausList[index] == true {
                 continue
             }

             //第i个使用过
             visitedStausList[index] = true
             //组合
             let newList = [nums[index]] + path
             dfs(nums, newList, &visitedStausList)
             //重置
             visitedStausList[index] = false
         }
     }
 }

 */
