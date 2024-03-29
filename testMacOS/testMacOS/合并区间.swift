//
//  合并区间.swift
//  testMacOS
//
//  Created by 腾飞张 on 2024/3/28.
//

import Cocoa

/**
 输入：intervals = [[1,3],[2,6],[8,10],[15,18]]
 输出：[[1,6],[8,10],[15,18]]
 解释：区间 [1,3] 和 [2,6] 重叠, 将它们合并为 [1,6].
 */
class MergeSectionArrayClass: NSObject {
    var resultArray = [[Int]]()
    func merge(_ intervals: [[Int]]) -> [[Int]] {
    
        var last = [Int]()
        var result = [[Int]]()
        
        let sortArray = intervals.sorted { first, second in
            first[0] < second[0]
        }
        
        for (_,item) in sortArray.enumerated() {
            if last.count > 0 && last[1] >= item[0] {
                let minLeft = min(last[0],item[0])
                let maxRight = max(last[1],item[1])
                let newArray = [minLeft,maxRight]
                last = newArray
                result.removeLast()
                result.append(newArray)
            } else {
                last = item
                result.append(item)
            }
        }
        return result
    }
    
    func main() {
        let result = merge([[0,2],[1,4],[3,5]])
        print(result)
    }
    
}

//class MergeSectionArrayClass: NSObject {
//    var resultArray = [[Int]]()
//    func merge(_ intervals: [[Int]]) -> [[Int]] {
//        digui(intervals, 0, intervals.count - 1)
//        return resultArray
//    }
//
//    func digui(_ intervals: [[Int]], _ l: Int, _ r: Int) {
//        if l == r {
//            return
//        }
//        let middle = r + l - 1
//        let leftResult = mergeTwoArray(intervals[l], intervals[middle])
//        let rightResult = mergeTwoArray(intervals[middle+1], intervals[r])
//
//    }
//
//    func mergeTwoArray(_ l: [Int], _ r: [Int]) -> [[Int]] {
//        var left = l
//        var right = r
//        if left.last! < r.first! {
//            return [[left.first!, r.last!]]
//        }
//        return [l, r]
//    }
//}
