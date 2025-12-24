//
//  MiddleNode.swift
//  LeetCodePackage
//
//  Created by Janlor on 2025/12/24.
//

import Foundation


/// **LeetCode 876 — 链表的中间节点**
///
/// 给你单链表的头结点 `head` ，请你找出并返回链表的中间结点。
/// 如果有两个中间结点，则返回第二个中间结点。
///
/// ### 示例 1
///
/// ```
/// 输入：head = [1,2,3,4,5]
/// 输出：[3,4,5]
/// 解释：链表只有一个中间结点，值为 3 。
/// ```
///
/// ### 示例 2
///
/// ```
/// 输入：head = [1,2,3,4,5,6]
/// 输出：[4,5,6]
/// 解释：该链表有两个中间结点，值分别为 3 和 4 ，返回第二个结点。
/// ```
/// ### 提示：
///
/// - 链表的结点数范围是 [1, 100]
/// - 1 <= Node.val <= 100
///
class MiddleNode {
    
    /// 标准解法：快慢指针法
    /// - 时间复杂度：`O(n)`
    /// - 空间复杂度：`O(1)`
    func middleNode2(_ head: ListNode?) -> ListNode? {
        var slow = head
        var fast = head
        while fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        return slow
    }
    
    /// 两遍扫描法
    /// - 时间复杂度：`O(n)`
    /// - 空间复杂度：`O(1)`
    func middleNode(_ head: ListNode?) -> ListNode? {
        func nodeCount(_ head: ListNode?) -> Int {
            var count = 0
            var node = head
            while node != nil {
                count += 1
                node = node?.next
            }
            return count
        }
        
        // 先算出总共有几个节点
        let count = nodeCount(head)
        
        // 再算出中间节点
        let middle = count / 2 + 1
        
        // 取出中间节点
        var node = head
        for _ in 1..<middle {
            node = node?.next
        }
        
        // 返回
        return node
    }
}
