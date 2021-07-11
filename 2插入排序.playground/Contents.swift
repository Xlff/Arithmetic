import UIKit

///插入排序的核心思想是把一个待排序序列，分成 2 部分，前半部分为有序序列，后半部分为无序序列，遍历后半部分数据，插入到前半部分已经排序好的序列，最终得到一个有序序列

/// 优化， 以排序部分可通过二分查找找到合适的插入位置


func insertionSort(_ nums: inout [Int]) {
  
    for i in 1 ..< nums.count {
        var j = i
        while j > 0 && nums[j] < nums[j-1] {
            nums.swapAt(j-1 , j)
            j -= 1
        }
    }
}

var arr = [ 8, 1, 4, 6, 2, 13, 5, 7]
insertionSort(&arr)
print(arr)
