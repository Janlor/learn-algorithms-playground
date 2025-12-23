//
//  242. 有效的字母异位词.swift
//  LeetCode
//
//  Created by Janlor on 2025/12/23.
//

import Foundation

/*
 给定两个字符串 s 和 t ，编写一个函数来判断 t 是否是 s 的 字母异位词。

  

 示例 1:

 输入: s = "anagram", t = "nagaram"
 输出: true
 示例 2:

 输入: s = "rat", t = "car"
 输出: false
  

 提示:

 1 <= s.length, t.length <= 5 * 104
 s 和 t 仅包含小写字母
  

 进阶: 如果输入字符串包含 unicode 字符怎么办？你能否调整你的解法来应对这种情况？
 */

class WordisAnagram {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else {
            return false
        }
        
        var sCount: [Character: Int] = [:]
        for ch in s {
            sCount[ch, default: 0] += 1
        }
        
        for ch in t {
            if var value = sCount[ch] {
                value -= 1
                sCount[ch] = value > 0 ? value : nil
            } else {
                return false
            }
        }
        
        return sCount.isEmpty
    }
    
    func isAnagram2(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else {
            return false
        }
        
        var count = Array(repeating: 0, count: 26)
        for ch in s {
            count[Int(ch.asciiValue!) - 97] += 1
        }
        
        for ch in t {
            let idx = Int(ch.asciiValue!) - 97
            count[idx] -= 1
            if count[idx] < 0 {
                return false
            }
        }
        
        return true
    }
    
    func test() {
        let datas = [
            ("anagram", "nagaram"),
            ("rat", "car"),
        ]
        
        for data in datas {
            let r = isAnagram(data.0, data.1)
            print("isAnagram \n输入：" + data.0 + "-" + data.1 + "\n 输出：" + r.description)
            
            let r2 = isAnagram2(data.0, data.1)
            print("isAnagram2 \n输入：" + data.0 + "-" + data.1 + "\n 输出：" + r2.description)
        }
    }
}
