//
//  寻找两个正序数组的中位数.swift
//  testMacOS
//
//  Created by 腾飞张 on 2024/3/30.
//

import Cocoa

/**
 [1,2,4,5]
 [3,6,7,8,9]

 1 2 3 4 5 6 7 8 9

 5
 */

class FindMedianSortedArraysClass: NSObject {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        var left = 0
        var right = 0
        var currentNumber = 0
        var preCurrentNumber = 0

        while (left + right) <= (nums1.count + nums2.count) / 2 {
            preCurrentNumber = currentNumber
            if (right >= nums2.count) || (left < nums1.count && nums1[left] <= nums2[right]) {
                currentNumber = nums1[left]
                left += 1
            } else {
                currentNumber = nums2[right]
                right += 1
            }
        }
        if (nums2.count + nums1.count) % 2 == 0 {
            return Double(preCurrentNumber + currentNumber) / 2.0
        } else {
            return Double(currentNumber)
        }
    }

    func main() {
        let result = findMedianSortedArrays([2], [])
        print(result)
    }
}

// class FindMedianSortedArraysClass: NSObject {
//    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
//        var result = 0
//        var left = 0
//        var right = 0
//        var currentNumber = 0
//        var preCurrentNumber = 0
//
////        while left+right <= (nums1.count + nums2.count)/2 {
////            //！ 保留前一个元素
////            preCurrentNumber = currentNumber
////
////            if (right >= nums2.count) || (left < nums1.count && nums1[left] <= nums2[right])  {
////                currentNumber = nums1[left]
////                left+=1
////            } else  {
////                currentNumber = nums2[right]
////                right+=1
////            }
////        }
//
//
//        while (left + right) <= (nums1.count + nums2.count) / 2 {
//            preCurrentNumber = currentNumber
//            if (right >= nums2.count) || (left < nums1.count && nums1[left] <= nums2[right]) {
//                currentNumber = nums1[left]
////                if left == nums1.count - 1 {
////                    right += 1
////                } else {
//                    left += 1
////                }
//            } else {
//                currentNumber = nums2[right]
////                if right == nums2.count - 1{
////                    left += 1
////                } else {
//                    right += 1
////                }
//            }
//        }
//        if (nums2.count + nums1.count) % 2 == 0 {
//            return Double(preCurrentNumber + currentNumber) / 2.0
//        } else {
//            return Double(currentNumber)
//        }
//    }
//
//    func main() {
//        let result = findMedianSortedArrays([2], [])
//        print(result)
//    }
//
// }
