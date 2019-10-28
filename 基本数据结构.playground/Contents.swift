//: Playground - noun: a place where people can play

import UIKit

let nums = [Int](repeating: 1, count: 10)

////////////////////////////////////

///数组实现栈
class Stack<T> {
    private var stack: [T]
    var isEmpty: Bool { return stack.isEmpty }
    var peek : T? { return stack.last }
    init() {
        stack = [T]()
    }
    func push(object: T) {
        stack.append(object)
    }
    
    func pop() -> T? {
        return isEmpty ? nil : stack.removeLast()
    }
}

/// reserveCapacity() 为数组预留空间，防止数组在增加或删除元素时反复申请内存空间或者创建新数组，特别适用于创建和removeAll()时候进行调用。

////////////////////////////////////


let r = Dictionary("helloH".map { ($0, 1)}, uniquingKeysWith: +)
print(r)

////////////////////////////////////
//给一个整型数组和一个目标值，判断数组中是否有两个数字之和等于目标值

func twoSum(nums: [Int], _ target: Int) -> Bool {
    var set = Set<Int>()
    for num in nums {
        if set.contains(target - num) {
            return true
        }
        set.insert(num)
    }
    return false
}
print(twoSum(nums: [1,2,3,4,5], 5))

////////////////////////////////////
////给定一个整型数组中有且仅有两个数字之和等于目标值，求两个数字在数组中的序号
func twoSum2(nums: [Int], _ target : Int) ->[Int] {
    var dict = [Int: Int]()
    for (i , num) in nums.enumerated() {
        if let lastIndex = dict[target - num] {
            return [lastIndex, i]
        }
        else {
            dict[num] = i
        }
    }
    fatalError("No valid output")
}

print(twoSum2(nums: [1,2,3,4,5], 3))


////////////////////////////////////
// 给一个字符串，将其按照单词顺序进行反转。比如说 s 是 "the sky is blue",那么反转就是 "blue is sky the"。
func reverse<T>(_ chars: inout [T], _ start: Int, _ end : Int) {
    var start = start, end = end
    while start < end {
        swap(&chars, start, end)
        start += 1
        end -= 1
    }
}

func swap<T>(_ chars: inout [T], _ p: Int, _ q: Int) {
    (chars[p], chars[q]) = (chars[q], chars[p])
}

func reverseWords(_ s: String?) -> String? {
    guard let s = s else {
        return nil
    }
    
    var chars = Array(s), start = 0
    reverse(&chars, 0, chars.count - 1)
    for i in 0..<chars.count {
        if i == chars.count - 1 || chars[i + 1] == " " {
            reverse(&chars, start, i)
            start = i + 2
        }
    }
    return String(chars)
}

var s = "the sky is blue"
//reverseWords(s)

var sArray = s.components(separatedBy: " ")
sArray.reverse()
s = sArray.joined(separator: " ")

////////////////////////////////////////
let number : UInt8 = 24
print(Int(number % 10))
