//
//  合并两个有序数组.swift
//  testMacOS
//
//  Created by 腾飞张 on 2024/3/27.
//

import Cocoa

/**
 https://leetcode.cn/problems/merge-sorted-array/description/
 输入：nums1 = [1,2,6,0,0,0], m = 3, nums2 = [2,4,5], n = 3
 输出：[1,2,2,3,5,6]
 解释：需要合并 [1,2,3] 和 [2,5,6] 。
 合并结果是 [1,2,2,3,5,6] ，其中斜体加粗标注的为 nums1 中的元素。
 */

class MergeTwoArrayClass: NSObject {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var mIndex = m - 1
        var nIndex = n - 1
        var mLastIndex = nums1.count - 1

        while nIndex >= 0 {
            if mIndex < 0 || nums1[mIndex] < nums2[nIndex] {
                nums1[mLastIndex] = nums2[nIndex]
                nIndex -= 1
            } else {
                nums1[mLastIndex] = nums1[mIndex]
                mIndex -= 1
            }
            mLastIndex -= 1
        }
    }

    func main() {
        var printArray = [0,0,0,0,0]
        merge(&printArray, 0, [1,2,3,4,5], 5)
        print(printArray)
    }
}
