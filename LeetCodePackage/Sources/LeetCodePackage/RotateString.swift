//
//  RotateString.swift
//  LeetCodePackage
//
//  Created by Janlor on 2025/12/25.
//

import Foundation

/// **LeetCode 796 — 旋转字符串**
///
/// 给定两个字符串, s 和 goal。如果在若干次旋转操作之后，s 能变成 goal ，那么返回 true 。
/// s 的 旋转操作 就是将 s 最左边的字符移动到最右边。
/// 例如, 若 s = 'abcde'，在旋转一次之后结果就是'bcdea' 。
///
/// ### 示例 1
///
/// ```
/// 输入: s = "abcde", goal = "cdeab"
/// 输出: true
/// ```
///
/// ```
///
/// ### 示例 2
///
/// ```
/// 输入: s = "abcde", goal = "abced"
/// 输出: false
/// ```
///
/// ### 提示：
/// - 1 <= s.length, goal.length <= 100
/// - s 和 goal 由小写英文字母组成
class RotateString {
    /// 标准解法
    /// - 时间复杂度：`O(n)`
    /// - 空间复杂度：`O(n)`
    func rotateString2(_ s: String, _ goal: String) -> Bool {
        guard s.count == goal.count else {
            return false
        }
        return (s + s).contains(goal)
    }
    
    /// 初次解法
    /// - 时间复杂度：`O(n²)`
    /// - 空间复杂度：`O(n)`
    func rotateString(_ s: String, _ goal: String) -> Bool {
        var ss = s
        var idx = 0
        
        while idx < s.count {
            ss.append(ss.removeFirst())
            if ss == goal {
                return true
            }
            idx += 1
        }
        
        return false
    }
}
