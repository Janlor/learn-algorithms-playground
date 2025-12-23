//
//  Isomorphic.swift
//  LeetCodePackage
//
//  Created by Janlor on 2025/12/23.
//

import Foundation

/// **LeetCode 205 — 同构字符串**
///
/// 给定两个字符串 `s` 和 `t`，判断它们是否是同构的。
///
/// 如果 `s` 中的字符可以按某种映射关系替换得到 `t`，
/// 那么这两个字符串是同构的。
///
/// ### 示例
///
/// ```
/// 输入: s = "egg", t = "add"
/// 输出: true
///
/// 输入: s = "foo", t = "bar"
/// 输出: false
///
/// 输入: s = "paper", t = "title"
/// 输出: true
/// ```
///
/// ### 提示
/// - `1 <= s.length <= 5 * 10^4`
/// - `t.length == s.length`
/// - 字符串仅包含 ASCII 字符
class Isomorphic {
    /// ✅ 双字典解法
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
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
    
    /// ❌ 单字典无法做到同构
    func isIsomorphic2(_ s: String, _ t: String) -> Bool {
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
}
