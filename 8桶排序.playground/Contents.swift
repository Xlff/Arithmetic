import UIKit

/*
 如果我们有N个整数，范围从1到M(或从0到M-1)，我们可以利用这个信息得到一种快速的排序，叫做桶式排序(bucket sort)。我们留置一个数组，称之为Count，大小为M，并初始化为零。于是，Count有M个单元(或桶)，开始时他们都是空的。当数组元素A[i]被读入时Count[A[i]]增1。在所有的输入被读进以后，扫描数组Count，打印输出排好序的表。该算法花费O(M+N)。
 ——摘自《数据结构与算法分析-C语言描述》 p40
 
 桶排序是稳定的
 桶排序是常见排序里最快的一种,比快排还要快…大多数情况下
 桶排序非常快,但是同时也非常耗空间,基本上是最耗空间的一种排序算法
 
 */

func bucketSort(_ a: [Int], _ gap: Int) -> [Int] {
    
    let max = a.max()!
    let min = a.min()!
    
    // 初始化桶数量
    let bucketCount = (max - min)/gap + 1
    var buckets = [[Int]](repeating: [Int](), count: bucketCount)

    // 遍历未排序数组，将每个元素放入桶里
    for i in 0..<a.count {
        let index = (a[i] - min) / gap
        buckets[index].append(a[i])
    }
    
    var result = [Int]()
    // 对桶里元素排序
    for i in 0..<bucketCount {
//        if buckets[i].count > 0 {
            //排序
            shellSort(&buckets[i])
            result += buckets[i]
//        }
    }
    return result
}

func shellSort(_ a: inout [Int]) {
    var number = a.count/2
    var j = 0
    var temp = 0
    while number > 0 {
        for i in number..<a.count {
            temp = a[i]
            j = i-number
            while j >= 0 && a[j] > temp {
                a[j+number] = a[j]
                j = j-number
            }
            a[j+number] = temp
        }
        number = number / 2
    }
}

var a =  [ 8, 1, 4, 6, 2, 3, 5, 7 ]
print(bucketSort(a, 3))


