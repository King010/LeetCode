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

public class Node {
    public var val: Int
    public var left: Node?
    public var right: Node?
    public var next: Node?
    public init() { self.val = 0; self.left = nil; self.right = nil; self.next = nil;}
    public init(_ val: Int) { self.val = 0; self.left = nil; self.right = nil; self.next = nil;}
    public init(_ val: Int, _ left: Node?, _ right: Node?, _ next: Node?) {
        self.val = val
        self.left = left
        self.right = right
        self.next = next
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
//ReorderListClass().main()
//MergeSectionArrayClass().main()
//TreeMaxPathSumClass().main()
//RemoveNthFromEndClass().main()
//RestoreIpAddressesClass().main()
//InorderTraversal().main()
//LongestCommonSubsequenceClass().main()
//DeleteDuplicatesClass().main()
//二分查找Class().main()
//FindMedianSortedArraysClass().main()
//ClimbStairsClass().main()
//AddTwoNumbersClass().main()
//MyAtoiClass().main()
//GenerateParenthesisClass().main()
//MaxSlidingWindowClass().main()
//NextPermutationClass().main()
//LengthOfLISClass().main()
//ZConvert().main()
//MaxAreaClass().main()
//LetterCombinationsClass().main()
//RotateArrayClass().main()
//SortFunction().main()
//ArrayAddAndDelete().main()
//ListDecomposition().main()
//RemoveArrayDuplicates().main()
//MinWindowClass().main()
//LuoXuanJuzhen2().main()
//StringCheckInclusion().main()
//FindAnagramsClass().main()
//LengthOfLongestSubstring2().main()
//MinOperationsClass().main()
//CharacterReplacementClass().main()
//ConstructMaximumBinaryTreeClass().main()
//PIreorderBuildTreeClass().main()
//IPorderBuildTreeClass().main()
//ConstructFromPrePostClass().main()
//TreeSerializeDeserializeClass().main()
//LongestOnesClass().main()
//CharacterReplacementClass().main()
//ContainsNearbyDuplicate().main()
//PreOrderTreeNodeClass().main()
//CommonSortTest1Class().main()
//NumSquaresClass().main()
//FindLengthOfLCISClass().main()
//TempFunctionClass().main()
//OddEvenListClass().main()


DispatchQueue.global().sync {
    print("1")
    DispatchQueue.global().sync {
        print("2")
    }
    print("3")
}
print("4")
