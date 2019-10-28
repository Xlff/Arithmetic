import UIKit

/*
 对待排序序列通过一个「支点」（支点就是序列中的一个元素，别把它想的太高大上）进行拆分，使得左边的数据小于支点，右边的数据大于支点。然后把左边和右边再做一次递归，直到递归结束。支点的选择也是一门大学问，我们以 （左边index + 右边index）/ 2 来选择支点
 */


func quickSort<T: Comparable>(_ a: [T]) -> [T] {
    guard a.count > 1 else {
        return a
    }
    
    let pivot = a[a.count / 2]
    let less = a.filter { $0 < pivot }  // 取出小于基准点的值
    let equal = a.filter { $0 == pivot}
    let greater = a.filter { $0 > pivot }
    
    return quickSort(less) + equal + quickSort(greater)
}

var arr = [ 8, 1, 4, 6, 2, 3, 5, 7 ]
quickSort(arr)



//版本2
func partitionLomuto<T: Comparable>(_ a: inout [T], low: Int, high: Int) -> Int {
    let pivot = a[high]
    var i = low
    for j in low..<high {
        if a[j] <= pivot {
            a.swapAt(i, j)
            i += 1
        }
    }
    a.swapAt(i, high)
    return i
}

func quickSortLomuto<T: Comparable>(_ a: inout [T], low: Int, high: Int) {
    if low < high {
        let p = partitionLomuto(&a, low: low, high: high)
        quickSortLomuto(&a, low: low, high: p-1)
        quickSortLomuto(&a, low: p+1, high: high)
    }
}

var list = [ 10, 0, 3, 9, 2, 14, 26, 27, 1, 5, 8, -1, 8 ]
//let p = partitionLomuto(&list, low: 0, high: list.count - 1)
quickSortLomuto(&list, low: 0, high: list.count - 1)



//版本3

func partitionHoare<T: Comparable>(_ a: inout [T], low: Int, high: Int) -> Int {
    let pivot = a[low]
    var i = low - 1
    var j = high + 1
    
    while true {
        repeat { j -= 1 } while a[j] > pivot
        repeat { i += 1 } while a[i] < pivot
        print("--\(i)--\(j)")
        if i < j {
            a.swapAt(i, j)
        } else {
//            a.swapAt(<#T##i: Int##Int#>, <#T##j: Int##Int#>)
            return j
        }
    }
}
list = [ 8, 0, 3, 9, 2, 14, 10, 27, 1, 5, 8, -1, 26 ]
let p = partitionHoare(&list, low: 0, high: list.count - 1)
list  // show the results
