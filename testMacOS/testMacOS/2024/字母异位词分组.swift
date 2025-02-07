//
//  字母异位词分组.swift
//  testMacOS
//
//  Created by 腾飞张 on 2024/4/2.
//

import Cocoa

/**
 示例 1:

 输入: strs = ["eat", "tea", "tan", "ate", "nat", "bat"]
 输出: [["bat"],["nat","tan"],["ate","eat","tea"]]
 示例 2:

 输入: strs = [""]
 输出: [[""]]
 https://leetcode.cn/problems/group-anagrams/
 */

class GroupAnagramsClass: NSObject {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var map = [String: [String]]()

        for str in strs {
            let newStr = String(str.sorted())
            if var strArray = map[newStr] {
                strArray.append(str)
                map[newStr] = strArray
            } else {
                map[newStr] = [str]
            }
        }

        var ans = [[String]]()
        for item in map.values {
            ans.append(item)
        }
        return ans
    }
}
