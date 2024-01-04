//
//  142.环形链表II.swift
//  LeetCode
//
//  Created by Janlor on 1/4/24.
//

import Foundation

/* 
 给定一个链表的头节点  head ，返回链表开始入环的第一个节点。 如果链表无环，则返回 null。
 
 如果链表中有某个节点，可以通过连续跟踪 next 指针再次到达，则链表中存在环。 为了表示给定链表中的环，评测系统内部使用整数 pos 来表示链表尾连接到链表中的位置（索引从 0 开始）。如果 pos 是 -1，则在该链表中没有环。注意：pos 不作为参数进行传递，仅仅是为了标识链表的实际情况。

 不允许修改 链表。

 示例 1：

 输入：head = [3,2,0,-4], pos = 1
 输出：返回索引为 1 的链表节点
 解释：链表中有一个环，其尾部连接到第二个节点。
 
 示例 2：

 输入：head = [1,2], pos = 0
 输出：返回索引为 0 的链表节点
 解释：链表中有一个环，其尾部连接到第一个节点。

 示例 3：

 输入：head = [1], pos = -1
 输出：返回 null
 解释：链表中没有环。
  
 提示：

 链表中节点的数目范围在范围 [0, 104] 内
 -105 <= Node.val <= 105
 pos 的值为 -1 或者链表中的一个有效索引

 进阶：你是否可以使用 O(1) 空间解决此题？
 */

class DetectCycle {
    /// 方法一：哈希表
    func detectCycle1(_ head: ListNode?) -> ListNode? {
        var cur: ListNode? = head
        var visited: Set<ListNode> = Set()
        while cur != nil {
            if visited.contains(cur!) {
                return cur
            } else {
                visited.insert(cur!)
            }
            cur = cur?.next
        }
        return nil
    }
    
    /// 方法二：快慢指针
    func detectCycle2(_ head: ListNode?) -> ListNode? {
        var fast: ListNode? = head
        var slow: ListNode? = head
        while true {
            if fast == nil || slow == nil {
                return nil
            }
            fast = fast?.next?.next
            slow = slow?.next
            if fast === slow {
                break
            }
        }
        fast = head
        while fast !== slow {
            fast = fast?.next
            slow = slow?.next
        }
        return fast
    }
    
    func test1() {
        let head = ListNode(5)
        let node1 = ListNode(3)
        let node2 = ListNode(2)
        let node3 = ListNode(7)
        let node4 = ListNode(1)
        let node5 = ListNode(6)
        let node6 = ListNode(8)
        let node7 = ListNode(9)
        let node8 = ListNode(4)
        
        head.next = node1
        node1.next = node2
        node2.next = node3
        node3.next = node4
        node4.next = node5
        node5.next = node6
        node6.next = node7
        node7.next = node8
        node8.next = node4
        
//        head.print()
        
        let cycle = detectCycle2(head)
        
        debugPrint(cycle)
//        let cycle = detectCycle1(head)
//        cycle?.print()
    }
}
