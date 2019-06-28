import UIKit

/*
 它的核心思想是把一个序列分组，对分组后的内容进行插入排序，这里的分组只是逻辑上的分组，不会重新开辟存储空间。它其实是插入排序的优化版，插入排序对基本有序的序列性能好，希尔排序利用这一特性把原序列分组，对每个分组进行排序，逐步完成排序。
 */


public func insertSort(_ list: inout[Int], start: Int, gap: Int) {
    for i in stride(from: (start + gap), to: list.count, by: gap) {
        let currentValue = list[i]
        var pos = i
        while pos >= gap && list[pos - gap] > currentValue {
            list[pos] = list[pos - gap]
            pos -= gap
        }
        list[pos] = currentValue
    }
}

func shellSort(_ nums: inout [Int]) {
    
    var gap = nums.count / 2
    // gap 4-2-1
    while gap > 0 {
        // i 4 5 6 7 8
        for i in 0..<gap {
            insertSort(&nums, start: i, gap: gap)
        }
        gap = gap / 2
    }
    
}

var array = [ 8, 1, 4, 6, 2, 13, 5, 17 ,9,12]
shellSort(&array)
