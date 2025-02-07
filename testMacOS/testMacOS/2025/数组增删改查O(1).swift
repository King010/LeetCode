//
//  数组增删改查O(1).swift
//  testMacOS
//
//  Created by 腾飞张 on 2025/1/22.
//

import Cocoa

/**
 
  -1, -1, -1, -1,
 
 */

class ArrayAddAndDelete: NSObject {
    var array = [Int]()
    var count = 0
    var size = 5
    var start = 0
    var end = 0
    
    func addFirstData(val: Int) {
        if count == size {
            // 扩容方法
            expandArray()
        }
        start = (start - 1 + size) % size
        array[start] = val
        count += 1
    }
    
    func addLastData(val: Int) {
        if count == size {
            // 扩容方法
            expandArray()
        }
        array[end] = val
        end = (end + 1) % size
        count += 1
    }
    
    func removeFirst() {
        array[start] = -1
        start = (start + 1) % size
        count -= 1
    }
    
    func removeLast() {
        end = (end - 1 + size) % size
        array[end] = -1
        count -= 1
    }
    
    func getFirstData() -> Int {
        array[start]
    }

    func getLastData() -> Int {
        return array[(end - 1 + size) % size]
    }
    
    func getIndexVal(index: Int) -> Int {
        let realIndex = (index + start) % size
        return array[realIndex]
    }
    
    func expandArray() {
        var newArray = Array(repeating: -1, count: size * 2)
        for i in 0 ..< count {
            newArray[i] = array[(start + i) % size]
        }
        array = newArray
        start = 0
        end = count
        size = size * 2
    }
    
    func main() {
        array = Array(repeating: -1, count: size)
        addFirstData(val: 1)
        addFirstData(val: 2)

        addLastData(val: 3)

//        array = [1,2,-1,-1,-1]
//        count = 2
        removeFirst()
        addFirstData(val: 4)
    }
}
