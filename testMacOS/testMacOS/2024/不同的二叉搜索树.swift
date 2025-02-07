//
//  不同的二叉搜索树.swift
//  testMacOS
//
//  Created by 腾飞张 on 2024/4/2.
//

import Cocoa

/**
 输入：n = 3
 输出：5

 https://leetcode.cn/problems/unique-binary-search-trees/solutions/1514889/96-bu-tong-de-er-cha-sou-suo-shu-by-duan-88wb/

 */

class NumTreesClass: NSObject {
    var result = 0

    func numTrees(_ n: Int) -> Int {
        if n <= 1 {
            return 1
        }

        var dp = [Int](repeating: 0, count: n + 1)
        dp[0] = 1
        dp[1] = 1

        for i in 2...n {
            for j in 1...i {
                /**
                 对于一个有 i 个不同的数的序列，我们可以选择任意一个数作为根节点，然后将剩余的 i-1 个数分为左右两部分。左边的部分（小于根节点的值）可以构成一棵二叉搜索树，右边的部分（大于根节点的值）也可以构成一棵二叉搜索树。因此，以当前数为根节点的二叉搜索树的数量等于左右两部分能够构成的二叉搜索树数量的乘积
                 两种情况*三种情况为当前节点为根节点的情况值*
                 */
                dp[i] += dp[i-j] * dp[j-1]
            }
        }
        return dp[n]
    }
}
