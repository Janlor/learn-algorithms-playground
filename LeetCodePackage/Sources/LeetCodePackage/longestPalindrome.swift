//
//  longestPalindrome.swift
//  LeetCodePackage
//
//  Created by Janlor on 2025/12/23.
//

import Foundation

/// **LeetCode 409 — 最长回文串**
///
/// 给定一个包含大写字母和小写字母的字符串`s` ，返回 通过这些字母构造成的 最长的 回文串 的长度。
/// 在构造过程中，请注意 区分大小写 。比如 `"Aa"` 不能当做一个回文字符串。
///
/// ### 示例1
/// ```
/// 输入:s = "abccccdd"
/// 输出:7
/// 解释:
/// 我们可以构造的最长的回文串是"dccaccd", 它的长度是 7。
///
/// ### 示例2
/// ```
/// 输入:s = "a"
/// 输出:1
/// 解释：可以构造的最长回文串是"a"，它的长度是 1。
/// ```
/// ### 提示:
/// - `1 <= s.length <= 2000`
/// - `s` 只由小写 **和/或** 大写英文字母组成
///
/// ### 复杂度
/// - 时间复杂度：`O(n)`
/// - 空间复杂度：`O(1)`
class LongestPalindrome {
    
    /// ✅ 修改版
    func longestPalindrome(_ s: String) -> Int {
        var sDict: [Character: Int] = [:]
        
        for ch in s {
            sDict[ch, default: 0] += 1
        }
        
        var count = 0
        var hasOdd = false
        for value in sDict.values {
            if value % 2 == 0 {
                count += value
            } else {
                count += value - 1
                hasOdd = true
            }
        }
        
        if hasOdd {
            count += 1
        }
        
        return count
    }
    
    /// ✅✅✅天花板写法
    func longestPalindrome5(_ s: String) -> Int {
        var counts = Array(repeating: 0, count: 128)
        for c in s.utf8 {
            counts[Int(c)] += 1
        }

        var res = 0
        for v in counts {
            res += v / 2 * 2
        }

        return res < s.count ? res + 1 : res
    }

    
    /// ✅✅✅Swift风格最优
    func longestPalindrome4(_ s: String) -> Int {
        let freq = Dictionary(s.map { ($0, 1) }, uniquingKeysWith: +)
        
        let base = freq.values.reduce(0) { $0 + ($1 / 2) * 2 }
        return base < s.count ? base + 1 : base
    }
    
    /// ✅竞赛级最短逻辑
    func longestPalindrome3(_ s: String) -> Int {
        var freq = [Character: Int]()
        for c in s { freq[c, default: 0] += 1 }

        var res = 0
        for v in freq.values {
            res += v & 1 == 0 ? v : v - 1
        }

        return res < s.count ? res + 1 : res
    }

    
    /// ✅面试 / 教科书级最优
    func longestPalindrome2(_ s: String) -> Int {
        var freq = [Character: Int]()
        
        for ch in s {
            freq[ch, default: 0] += 1
        }
        
        var length = 0
        var hasOdd = false
        
        for v in freq.values {
            length += v / 2 * 2
            if v % 2 == 1 {
                hasOdd = true
            }
        }
        
        return hasOdd ? length + 1 : length
    }
    
    
    /// ❌ 初版 ccc 未通过
    func longestPalindrome1(_ s: String) -> Int {
        var sDict: [Character: Int] = [:]
        
        for ch in s {
            sDict[ch, default: 0] += 1
        }
        
        var count = 0
        var addedSingle = false
        for value in sDict.values {
            if value == 1, !addedSingle {
                count += 1
                addedSingle = true
            }
            if value % 2 == 0 {
                count += value
            }
        }
        
        return count
    }
}
