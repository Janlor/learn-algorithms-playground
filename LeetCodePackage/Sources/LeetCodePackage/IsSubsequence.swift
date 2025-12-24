//
//  IsSubsequence.swift
//  LeetCodePackage
//
//  Created by Janlor on 2025/12/24.
//

import Foundation

/// **LeetCode 392 — 判断子序列**
///
/// 给定字符串 s 和 t ，判断 s 是否为 t 的子序列。
/// 字符串的一个子序列是原始字符串删除一些（也可以不删除）字符而不改变剩余字符相对位置形成的新字符串。（例如，`"ace"`是`"abcde"`的一个子序列，而`"aec"`不是）。
///
/// ### 进阶：
/// 如果有大量输入的 S，称作 S1, S2, ... , Sk 其中 k >= 10亿，你需要依次检查它们是否为 T 的子序列。在这种情况下，你会怎样改变代码？
///
/// ### 示例1:
///
/// ```
/// 输入：s = "abc", t = "ahbgdc"
/// 输出：true
/// ```
///
/// ### 示例2:
///
/// ```
/// 输入：s = "axc", t = "ahbgdc"
/// 输出：false
/// ```
///
/// ### 提示
/// * 0 <= s.length <= 100
/// * 0 <= t.length <= 10^4
/// * 两个字符串都只由小写字符组成。
class IsSubsequence {
    /// 【推荐】操作数组 0ms
    /// - 时间复杂度：`O(n)`
    /// - 空间复杂度：`O(n)`
    func isSubsequence2(_ s: String, _ t: String) -> Bool {
        guard s.count <= t.count else {
            return false
        }
        
        let sArray = Array(s)
        let tArray = Array(t)
        
        var si = 0
        var ti = 0
        
        while si < sArray.count {
            if ti == tArray.count {
                return false
            }
            
            if sArray[si] == tArray[ti] {
                si += 1
            }
            ti += 1
        }
        
        return true
    }
    
    /// 正确操作字符串的写法 1ms
    /// - 时间复杂度：`O(n)`
    /// - 空间复杂度：`O(1)`
    func isSubsequenceOptimized(_ s: String, _ t: String) -> Bool {
        guard s.count <= t.count else {
            return false
        }
        
        var si = s.startIndex
        var ti = t.startIndex
        
        while si < s.endIndex {
            if ti == t.endIndex {
                return false
            }
            if s[si] == t[ti] {
                si = s.index(after: si)
            }
            ti = t.index(after: ti)
        }
        
        return true
    }
    
    /// 错误操作字符串的写法 565ms
    /// - 时间复杂度：`O(n²)`
    /// - 空间复杂度：`O(1)`
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        guard s.count <= t.count else {
            return false
        }
        
        var si = 0
        var ti = 0
        
        while si < s.count {
            if ti >= t.count {
                return false
            }
            
            let sc = s[si]
            let tc = t[ti]
            if sc == tc {
                si += 1
            }
            ti += 1
        }
        
        return true
    }
}

// Source - https://stackoverflow.com/a/78533125
// Posted by Aswin Gopinathan
// Retrieved 2025-12-24, License - CC BY-SA 4.0

extension String {
    subscript(index: Int) -> Character {
        // O(k)
        let requiredIndex = self.index(startIndex, offsetBy: index)
        return self[requiredIndex]
    }
}

