//
//  AddStrings.swift
//  LeetCodePackage
//
//  Created by Janlor on 2025/12/25.
//

import Foundation

/// **LeetCode 415 — 字符串相加**
///
/// 给定两个字符串形式的非负整数 num1 和num2 ，计算它们的和并同样以字符串形式返回。
/// 你不能使用任何內建的用于处理大整数的库（比如 BigInteger）， 也不能直接将输入的字符串转换为整数形式。
///
/// ### 示例 1
///
/// ```
/// 输入：num1 = "11", num2 = "123"
/// 输出："134"
/// ```
///
///### 示例 2
///
/// ```
/// 输入：num1 = "456", num2 = "77"
/// 输出："533"
///
/// ### 示例 3
///
/// ```
/// 输入：num1 = "0", num2 = "0"
/// 输出："0"
///
/// ### 提示：
/// 1 <= num1.length, num2.length <= 104
/// num1 和num2 都只包含数字 0-9
/// num1 和num2 都不包含任何前导零

class AddStrings {
    /// 8ms 击败 5.56%
    func addStrings1(_ num1: String, _ num2: String) -> String {
        let a = Array(num1)
        let b = Array(num2)
        
        var i = a.count - 1
        var j = b.count - 1
        var carry = 0
        var result: [Character] = []
        
        while i >= 0 || j >= 0 || carry > 0 {
            let x = i >= 0 ? Int(a[i].asciiValue! - 48) : 0
            let y = j >= 0 ? Int(b[j].asciiValue! - 48) : 0
            
            let sum = x + y + carry
            carry = sum / 10
            result.append(Character(UnicodeScalar(sum % 10 + 48)!))
            
            i -= 1
            j -= 1
        }
        
        return String(result.reversed())
    }
    
    /// 7ms 击败 33.33%
    /// - 时间复杂度：`O(n)`
    /// - 空间复杂度：`O(n)`
    func addStrings(_ num1: String, _ num2: String) -> String {
        var shortNum: [Int]
        var longNum: [Int]
        if num1.count < num2.count {
            shortNum = num1.compactMap { Int("\($0)") }
            longNum = num2.compactMap { Int("\($0)") }
        } else {
            shortNum = num2.compactMap { Int("\($0)") }
            longNum = num1.compactMap { Int("\($0)") }
        }
        
        var indexShort = shortNum.count - 1
        var indexLong = longNum.count - 1
        var resultString: String = ""
        var tempNumber: Int = 0
        
        while indexLong >= 0 {
            let long = longNum[indexLong]
            var number = long
            if indexShort >= 0 {
                number += shortNum[indexShort]
            }
            
            if tempNumber > 0 {
                number += tempNumber
                tempNumber = 0
            }
            
            if number > 9 {
                let num = String(number).compactMap { Int("\($0)") }
                tempNumber = num[0]
                number = num[1]
            }
            resultString.insert(Character(String(number)), at: resultString.startIndex)
            
            indexShort -= 1
            indexLong -= 1
        }
        
        if tempNumber > 0 {
            resultString.insert(Character(String(tempNumber)), at: resultString.startIndex)
        }
        
        return resultString
    }
}
