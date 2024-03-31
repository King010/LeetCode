//
//  用栈实现队列.swift
//  testMacOS
//
//  Created by 腾飞张 on 2024/3/29.
//

import Cocoa
//  5

// 4 3 2
class MyQueue {
    
    var stack1 = [Int]()
    var stack2 = [Int]()

    init() {}

    func push(_ x: Int) {
        stack1.append(x)
    }

    func pop() -> Int {
        if stack2.count == 0 {
            while stack1.count > 0 {
                let value = stack1.popLast()
                stack2.append(value!)
            }
        }
        
        return stack2.popLast()!
    }

    //返回开头元素
    func peek() -> Int {
        let peekValue = pop()
        stack2.append(peekValue)
        return peekValue
    }

    func empty() -> Bool {
        return ((stack1.count + stack2.count) == 0)
    }
    
    func main() {
        let queue = MyQueue()
        queue.push(1)
        queue.push(2)
        queue.push(3)
        queue.push(4)
        queue.pop()
        queue.push(5)
        queue.pop()
        queue.pop()

    }
}
