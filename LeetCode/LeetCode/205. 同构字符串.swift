//
//  205. 同构字符串.swift
//  LeetCode
//
//  Created by Janlor on 2025/12/23.
//

import Foundation

/*
 给定两个字符串 s 和 t ，判断它们是否是同构的。

 如果 s 中的字符可以按某种映射关系替换得到 t ，那么这两个字符串是同构的。

 每个出现的字符都应当映射到另一个字符，同时不改变字符的顺序。不同字符不能映射到同一个字符上，相同字符只能映射到同一个字符上，字符可以映射到自己本身。

  

 示例 1:

 输入：s = "egg", t = "add"
 输出：true
 示例 2：

 输入：s = "foo", t = "bar"
 输出：false
 示例 3：

 输入：s = "paper", t = "title"
 输出：true
  

 提示：

 1 <= s.length <= 5 * 104
 t.length == s.length
 s 和 t 由任意有效的 ASCII 字符组成
 */

class WordisIsomorphic {
    
    // ❌ 单字典无法做到同构
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else {
            return false
        }
        
        var dict: [Character: Character] = [:]
        
        for i in s.indices {
            let sch = s[i]
            let tch = t[i]
            if let val = dict[sch] {
                if tch == val {
                    continue
                } else {
                    return false
                }
            } else {
                dict[sch] = tch
            }
        }
        return true
    }
    
    // ✅ 双字典解法
    func isIsomorphic2(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else {
            return false
        }
        
        var sToT: [Character: Character] = [:]
        var tToS: [Character: Character] = [:]
        
        for (sch, tch) in zip(s, t) {
            if let mapped = sToT[sch] {
                if mapped != tch { return false }
            } else {
                sToT[sch] = tch
            }
            
            if let mapped = tToS[tch] {
                if mapped != sch { return false }
            } else {
                tToS[tch] = sch
            }
        }
        
        return true
    }
    
    func test() {
        let datas = [
            ("badc", "baba"), // false
            ("egg", "add"), // true
            ("foo", "bar"), // false
            ("paper", "title"), // true
        ]
        
        for data in datas {
            let r = isIsomorphic2(data.0, data.1)
            print("isIsomorphic \n 输入：" + data.0 + "-" + data.1 + "\n 输出：" + r.description)
        }
    }
}
