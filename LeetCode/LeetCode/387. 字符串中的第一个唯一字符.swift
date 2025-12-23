//
//  387. 字符串中的第一个唯一字符.swift
//  LeetCode
//
//  Created by Janlor on 2025/12/23.
//

import Foundation

/*
 给定一个字符串 s ，找到 它的第一个不重复的字符，并返回它的索引 。如果不存在，则返回 -1 。

  

 示例 1：

 输入: s = "leetcode"
 输出: 0
 示例 2:

 输入: s = "loveleetcode"
 输出: 2
 示例 3:

 输入: s = "aabb"
 输出: -1
  

 提示:

 1 <= s.length <= 105
 s 只包含小写字母
 */

class FirstUniqChar {
    func firstUniqChar(_ s: String) -> Int {
        var dict: [Character: Int] = [:]
        for ch in s {
            if var value = dict[ch] {
                value += 1
                dict[ch] = value
            } else {
                dict[ch] = 1
            }
        }
        
        for (i, ch) in s.enumerated() {
            if let v = dict[ch], v == 1 {
                return i
            }
        }
        
        return -1
    }
    
    
    /// 利用题目条件：只有 26 个小写字母
    /// 用数组代替字典 更快、更省内存
    func firstUniqChar2(_ s: String) -> Int {
        var count = Array(repeating: 0, count: 26)
        let chars = Array(s)
        
        for ch in chars {
            count[Int(ch.asciiValue!) - 97] += 1
        }
        
        for i in chars.indices {
            if count[Int(chars[i].asciiValue! - 97)] == 1 {
                return i
            }
        }
        
        return -1
    }
    
    func test() {
        let inputs = [
            "leetcode",
            "loveleetcode",
            "aabb"
        ]
        for input in inputs {
            let s1 = firstUniqChar(input)
            print("firstUniqChar 输入：" + input + "\n 输出：\(s1)")
            
            let s2 = firstUniqChar2(input)
            print("firstUniqChar2 输入：" + input + "\n 输出：\(s2)")
        }
    }
}
