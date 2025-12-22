//
//  232.用栈实现队列.swift
//  LeetCode
//
//  Created by Janlor on 2025/12/22.
//

import Foundation

/*
 请你仅使用两个栈实现先入先出队列。队列应当支持一般队列支持的所有操作（push、pop、peek、empty）：

 实现 MyQueue 类：

 void push(int x) 将元素 x 推到队列的末尾
 int pop() 从队列的开头移除并返回元素
 int peek() 返回队列开头的元素
 boolean empty() 如果队列为空，返回 true ；否则，返回 false
 说明：

 你 只能 使用标准的栈操作 —— 也就是只有 push to top, peek/pop from top, size, 和 is empty 操作是合法的。
 你所使用的语言也许不支持栈。你可以使用 list 或者 deque（双端队列）来模拟一个栈，只要是标准的栈操作即可。
  

 示例 1：

 输入：
 ["MyQueue", "push", "push", "peek", "pop", "empty"]
 [[], [1], [2], [], [], []]
 输出：
 [null, null, null, 1, 1, false]

 解释：
 MyQueue myQueue = new MyQueue();
 myQueue.push(1); // queue is: [1]
 myQueue.push(2); // queue is: [1, 2] (leftmost is front of the queue)
 myQueue.peek(); // return 1
 myQueue.pop(); // return 1, queue is [2]
 myQueue.empty(); // return false
  

 提示：

 1 <= x <= 9
 最多调用 100 次 push、pop、peek 和 empty
 假设所有操作都是有效的 （例如，一个空的队列不会调用 pop 或者 peek 操作）
 */

class StackQueue {
    
    var inStack: [Int]!
    var outStack: [Int]!

    init() {
        inStack = []
        outStack = []
    }
    
    func push(_ x: Int) {
        inStack.append(x)
    }
    
    func pop() -> Int {
        outStack = inStack.reversed()
        let result = outStack.removeLast()
        inStack = outStack.reversed()
        return result
    }
    
    func peek() -> Int {
        outStack = inStack.reversed()
        return outStack.last ?? -1
    }
    
    func empty() -> Bool {
        inStack.isEmpty
    }
    
    func description() -> String {
        inStack.description
    }
    
    func test() {
        let obj = StackQueue()
        obj.push(1)
        print("Queue is " + obj.description())
//        obj.push(2)
//        print("Queue is " + obj.description())
        let ret_2: Int = obj.pop()
        print(ret_2)
//        let ret_3: Int = obj.peek()
//        print(ret_3)
//        print("Queue is " + obj.description())
        let ret_4: Bool = obj.empty()
        print(ret_4)
        print("Queue is " + obj.description())
    }
}

class StackQueue1 {
    
    private var inStack: [Int] = []
    private var outStack: [Int] = []

    init() {
        
    }
    
    func push(_ x: Int) {
        inStack.append(x)
    }
    
    func pop() -> Int {
        moveIfNeed()
        return outStack.removeLast()
    }
    
    func peek() -> Int {
        moveIfNeed()
        return outStack.last!
    }
    
    func empty() -> Bool {
        inStack.isEmpty && outStack.isEmpty
    }
    
    private func moveIfNeed() {
        guard outStack.isEmpty else {
            return
        }
        while let last = inStack.popLast() {
            outStack.append(last)
        }
    }
    
    func description() -> String {
        (outStack.reversed() + inStack).description
    }
    
    func test() {
        let obj = StackQueue1()
        obj.push(1)
        print("Queue is " + obj.description())
//        obj.push(2)
//        print("Queue is " + obj.description())
        let ret_2: Int = obj.pop()
        print(ret_2)
//        let ret_3: Int = obj.peek()
//        print(ret_3)
//        print("Queue is " + obj.description())
        let ret_4: Bool = obj.empty()
        print(ret_4)
        print("Queue is " + obj.description())
    }
}
