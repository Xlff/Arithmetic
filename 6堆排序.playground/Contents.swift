import UIKit

// 二叉树 ： 每个节点最多只有两个与它相连的子节点
// 满二叉树 : 除最后一层外节点都有两个子节点
// 完全二叉树： 与满二叉树的节点下标一一对应（所有结点都连续集中在最左边）

// 堆 父节点大于等于子节点的完全二叉树

/**
 堆排序的思想就是堆的根肯定是最大的
 1.把最大的与最后一个元素交换
 2.除最后一个元素外,对根节点进行一次堆重组(heapify)
 3.重复1和2
 */

/* 数组与堆 Index   i 为数组元素的位置
 
    parent  = (i - 1) / 2
    left    = 2i + 1
    right   = 2i + 2
 */

/*
    堆的深度： h= floor(log2(n)), n为堆的结点数
 
    完整的堆： 每level的最多结点数 2^h
            除最后level其他level结点数和： 2^h - 1
            总的结点数 2^(h+1) - 1
 
 */



// 1 先把数组转成大根堆

struct Heap<T> {
    // 堆数组
    var nodes = [T]()
    
    // 比较2个结点。 用>表示大根堆， <表示小根堆，如果是自定义元素组成的（元组tuples）则提供一个比较的方法
    private var orderCriteria:(T, T) -> Bool
    
    // 创建一个空的堆
    public init(sort: @escaping (T, T) -> Bool) {
        self.orderCriteria = sort
    }
    
    // 从一个数组中创建一个堆
    public init(array: [T], sort: @escaping (T, T) -> Bool) {
        self.orderCriteria = sort
        configureHeap(from: array)
    }
    
    // 自下而上的创建堆
    private mutating func configureHeap(from array: [T]) {
        nodes = array
        for i in stride(from: nodes.count / 2 - 1, through: 0, by: -1) {
            shiftDown(i)
        }
    }
    
    public var isEmpty: Bool {
        return nodes.isEmpty
    }
    
    public var count: Int {
        return nodes.count
    }
    
    @inline(__always) internal func parentIndex(ofIndex i: Int) -> Int {
        return (i-1) / 2
    }
    
    @inline(__always) internal func leftChildIndex(ofIndex i: Int) -> Int {
        return 2*i + 1
    }
    
    @inline(__always) internal func rightChildIndex(ofIndex i: Int) -> Int {
        return 2 * i + 2
    }
    
    // 大根堆的最大值，  小根堆的最小值
    public func peek() -> T? {
        return nodes.first
    }
    
    // 添加一个结点
    public mutating func insert(_ value: T) {
        nodes.append(value)
        shiftUp(nodes.count - 1)
    }
    

    public mutating func insert<S: Sequence>(_ sequence: S) where S.Iterator.Element == T {
        for value in sequence {
            insert(value)
        }
    }
    
    // 替换某个结点，
    public mutating func replace(index i: Int, value: T) {
        guard i < nodes.count else {
            return
        }
        remove(at: i)
        insert(value)
    }
    
    @discardableResult public mutating func remove() -> T? {
        guard !nodes.isEmpty else { return nil }
        if nodes.count == 1 {
            return nodes.removeLast()
        }
        
        let value = nodes[0]
        nodes[0] = nodes.removeLast()
        shiftDown(0)
        return value
    }
    
    @discardableResult public mutating func remove(at index: Int) -> T? {
        guard index < nodes.count else { return nil }
        let size = nodes.count - 1
        if index != size {
            nodes.swapAt(index, size)
            shiftDown(from: index, until: size)
            shiftUp(index)
        }
        return nodes.removeLast()
    }
    
    // 比较节点与父结点的大小， 大根不大，小根不小，就交换值
    internal mutating func shiftUp(_ index: Int) {
        var childIndex = index
        let child = nodes[childIndex]
        var parentIndex = self.parentIndex(ofIndex: childIndex)
        
        while childIndex > 0 && orderCriteria(child, nodes[parentIndex]) {
            nodes[childIndex] = nodes[parentIndex]
            childIndex = parentIndex
            parentIndex = self.parentIndex(ofIndex: childIndex)
        }
        nodes[childIndex] = child
    }
    
    //父结点与左右结点比较，  确定大根大，小根小
    internal mutating func shiftDown(from index: Int, until endIndex: Int) {
        let leftChildIndex = self.leftChildIndex(ofIndex: index)
        let rightChildIndex = leftChildIndex + 1
        
        var first = index
        if leftChildIndex < endIndex && orderCriteria(nodes[leftChildIndex], nodes[first]) {
            first = leftChildIndex
        }
        
        if rightChildIndex < endIndex && orderCriteria(nodes[rightChildIndex], nodes[first]) {
            first = rightChildIndex
        }
        
        if first == index { return }
        
        nodes.swapAt(index, first)
        shiftDown(from: first, until: endIndex)
    }
    
    internal mutating func shiftDown(_ index: Int) {
        shiftDown(from: index, until: nodes.count)
    }
}

// 搜索
extension Heap where T: Equatable {
    internal func index(of node: T) -> Int? {
        return nodes.index(where: { $0 == node})
    }
    
    /** Removes the first occurrence of a node from the heap. Performance: O(n log n). */
    @discardableResult internal mutating func remove(node: T) -> T? {
        if let index = index(of: node) {
            return remove(at: index)
        }
        return nil
    }
}


extension Heap {
    public mutating func sort() -> [T] {
        for i in stride(from: nodes.count - 1, through: 1, by: -1) {
            nodes.swapAt(0, i)
            shiftDown(from: 0, until: i)
        }
        return nodes
    }
}

var h1 = Heap(array: [5, 13, 2, 25, 7, 17, 20, 8, 4], sort: >)
print(h1.nodes)
let a1 = h1.sort()
