//
//  20.有效的括号.swift
//  LeetCode
//
//  Created by Janlor on 2025/12/22.
//

import Foundation

/* 给定一个只包括 '('，')'，'{'，'}'，'['，']' 的字符串 s ，判断字符串是否有效。
 
 有效字符串需满足：
 
 左括号必须用相同类型的右括号闭合。
 左括号必须以正确的顺序闭合。
 每个右括号都有一个对应的相同类型的左括号。
 
 
 示例 1：
 
 输入：s = "()"
 
 输出：true
 
 示例 2：
 
 输入：s = "()[]{}"
 
 输出：true
 
 示例 3：
 
 输入：s = "(]"
 
 输出：false
 
 示例 4：
 
 输入：s = "([])"
 
 输出：true
 
 示例 5：
 
 输入：s = "([)]"
 
 输出：false
 
 
 
 提示：
 
 1 <= s.length <= 104
 s 仅由括号 '()[]{}' 组成
 
 */

class ValidParentheses {
    
    // if 直观版
    func isValid(_ s: String) -> Bool {
        var chars = [Character]()
        
        for i in s {
            if i == "(" || i == "[" || i == "{" {
                chars.append(i)
                continue
            }
            if i == ")" {
                if chars.last == "(" {
                    chars.removeLast()
                    continue
                } else {
                    return false
                }
            }
            if i == "]" {
                if chars.last == "[" {
                    chars.removeLast()
                    continue
                } else {
                    return false
                }
            }
            if i == "}" {
                if chars.last == "{" {
                    chars.removeLast()
                    continue
                } else {
                    return false
                }
            }
        }
        
        return chars.isEmpty
    }
    
    // switch 优化版
    func isValid2(_ s: String) -> Bool {
        var stack = [Character]()
        
        for ch in s {
            switch ch {
            case "(", "[", "{":
                stack.append(ch)
            case ")":
                if stack.popLast() != "(" { return false }
            case "]":
                if stack.popLast() != "[" { return false }
            case "}":
                if stack.popLast() != "{" { return false }
            default:
                break
            }
        }
        
        return stack.isEmpty
    }
    
    // 易拓展版
    func isValid3(_ s: String) -> Bool {
        let pairs: [Character: Character] = [
            ")": "(",
            "]": "[",
            "}": "{",
        ]
        
        var stack = [Character]()
        
        for ch in s {
            if let left = pairs[ch] {
                if stack.popLast() != left {
                    return false
                }
            } else {
                stack.append(ch)
            }
        }
        
        return stack.isEmpty
    }
    
    func test() {
        let parentheses: [String] = [
            "()",
            "()[]{}",
            "(]",
            "([])",
            "([)]",
            "]",
            "(])"
        ]
        
        for p in parentheses {
            print(p + " - isValid = " + (isValid(p) ? "true" : "false"))
            print(p + " - isValid2 = " + (isValid2(p) ? "true" : "false"))
            print(p + " - isValid3 = " + (isValid3(p) ? "true" : "false"))
        }
    }
}
