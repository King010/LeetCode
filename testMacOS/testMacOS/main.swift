//
//  main.swift
//  testMacOS
//
//  Created by 腾飞张 on 2024/3/21.
//

import Foundation


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}


//Sort().main()
//LongestPalindromeClass().main()
//LengthOfLongestSubstringClass().main()

//LowestCommonAncestorClass().main()
//MergeTwoArrayClass().main()
//ArrayPermuteClass().main()
//ZigzagLevelOrderClass().main()
//ListReverseBetween().main()
//SpiralOrderClass().main()
//MergeKListsClass().main()
//GetIntersectionNodeClass().main()
//AddStringsClass().main()
//TrapClass().main()
ReorderListClass().main()
