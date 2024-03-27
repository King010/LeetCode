//
//  买卖股票的最佳时机.swift
//  testMacOS
//
//  Created by 腾飞张 on 2024/3/26.
//

import Cocoa

/**
 输入：[7,1,5,3,6,4]
 输出：5
 */

class MaxProfitClass: NSObject {
    func maxProfit(_ prices: [Int]) -> Int {
        var returnVal = 0
        var maxNumberIndex = -1
        var minNumber = Int.max
        for (i,item) in prices.enumerated() {
            if minNumber < item {
                continue
            }
            minNumber = item
            for j in i..<prices.count {
                let result = prices[j]-item
                if result > 0 {
                    returnVal = max(returnVal, result)
                }
            }
        }
        return returnVal
    }
}

