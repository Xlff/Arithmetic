//: Playground - noun: a place where people can play

import UIKit

/// 栈 - 后进先出
protocol Stack {
    /// 持有元素类型
    associatedtype Element
    /// 是否为空
    var isEmpty: Bool { get }
    /// 栈的大小
    var size: Int { get }
    /// 栈顶元素
    var peek: Element? { get }
    
    /// 进栈
    mutating func push(_ newElement: Element)
    /// 出栈
    mutating func pop() -> Element?
}

struct IntegerStack: Stack {
    typealias Element = Int
    var isEmpty: Bool {
        return stack.isEmpty
    }
    var size: Int { return stack.count }
    var peek: Int? { return stack.last }
    
    private var stack = [Element]()
    
    mutating func push(_ newElement: Int) {
        stack.append(newElement)
    }
    
    mutating func pop() -> Int? {
        return stack.popLast()
    }
}


/// 队列  - 先进先出
protocol Queue {
    /// 持有元素类型
    associatedtype Element
    
    /// 是否为空
    var isEmpty: Bool { get }
    /// 大小
    var size: Int { get }
    /// 队首元素
    var peek: Element? { get }
    
    /// 入队
    mutating func enqueue(_ newElement: Element)
    /// 出队
    mutating func dequeue() -> Element?
}

struct IntegerQueue: Queue {
    typealias Element = Int
    
    var isEmpty: Bool { return left.isEmpty && right.isEmpty }
    var size: Int { return left.count + right.count }
    var peek: Int? { return left.isEmpty ? right.first : left.first }
    
    private var left = [Element]()
    private var right = [Element]()
    
    mutating func enqueue(_ newElement: Int) {
        right.append(newElement)
    }
    mutating func dequeue() -> Int? {
        if left.isEmpty {
            left = right.reversed()
            right.removeAll()
        }
        return left.popLast()
    }
}


///////////////////////////////////////////////

///用栈实现队列
struct MyQueue: Stack {
    typealias Element = Int
    var stackA: Stack
    var stackB: Stack
    
    var isEmpty: Bool { return stackA.isEmpty && stackB.isEmpty }
    var peek: Any? {
        get {
            shift()
            return stackB.peek
        }
    }
    
    var size: Int {
        get {
            return stackA.size + stackB.size
        }
    }
    
    init() {
        stackA = Stack()
        stackB = Stack()
    }
    
    func enqueue(object: Any) {
        stackA.push(object)
    }
    
    func dequeue() -> Any? {
        shift()
        return stackB.pop()
    }
    
    private func shift() {
        if stackB.isEmpty {
            while !stackA.isEmpty {
                stackB.push(stackA.pop()!)
            }
        }
    }
}

// 用队列实现栈
struct MyStack {
    var queueA: intege
    var queueB: Queue
    
    init() {
        queueA = Queue()
        queueB = Queue()
    }
    
    var isEmpty: Bool {
        return queueA.isEmpty && queueB.isEmpty
    }
    
    var peek: Any? {
        get {
            shift()
            let peekObj = queueA.peek
            queueB.enqueue(queueA.dequeue()!)
            swap()
            return peekObj
        }
    }
    
    var size: Int {
        return queueA.size
    }
    
    func push(object: Any) {
        queueA.enqueue(object)
    }
    
    func pop() -> Any? {
        shift()
        let popObject = queueA.dequeue()
        swap()
        return popObject
    }
    
    private func shift() {
        while queueA.size != 1 {
            queueB.enqueue(queueA.dequeue()!)
        }
    }
    
    private func swap() {
        (queueA, queueB) = (queueB, queueA)
    }
}
