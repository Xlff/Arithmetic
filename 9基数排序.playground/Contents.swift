import UIKit

//基数排序是从待排序序列找出可以作为排序的「关键字」，按照「关键字」进行多次排序，最终得到有序序列。比如对 100 以内的序列 arr =  [ 3,  9,  489,  1,  5, 10, 2, 7, 6, 204 ]进行排序，排序关键字为「个位数」、「十位数」和「百位数」这 3 个关键字，分别对这 3 个关键字进行排序，最终得到一个有序序列。
//基数排序是一种排序算法，它将整数数组作为输入，并使用排序子程序（通常是另一种有效的排序算法）来按整数基数或者它们的数字对整数进行排序。 Counting Sort和Bucket Sort通常用作Radix Sort的子程序。

// 1. 此算法的第一步是定义数字，或者更确切地说是我们将用于排序的“base”或基数。
//对于这个例子，我们将radix = 10，因为我们在示例中使用的整数是基数10。

 // 2下一步是简单地迭代n次（其中n是输入数组中最大整数中的位数），并且在每次迭代时对当前数字执行排序子程序。

public func radixSort(_ array: inout [Int]) {
    let radix = 10
    var done = false
    var index: Int
    var digit = 1
    
    while !done {
        done = true
        
        var buckets: [[Int]] = []  // 我们的排序子程序是桶排序，所以让我们预定义我们的桶
        
        for _ in 1...radix {
            buckets.append([])
        }
        
        for number in array {
            index = number / digit
            buckets[index % radix].append(number)
            if done && index > 0 {
                done = false
            }
        }
        
        var i = 0
        
        for j in 0..<radix {
            let bucket = buckets[j]
            for number in bucket {
                array[i] = number
                i += 1
            }
        }
        
        digit *= radix
    }
}
//var a = [170, 45, 75, 90, 802, 24, 2, 66]
var a = [73, 22, 93, 43, 55, 14, 28, 65, 39, 81, 725]
radixSort(&a)
