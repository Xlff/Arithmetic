import UIKit

/// 因为2个For循环  时间复杂度为O(n*n)
func bubbleSort(_ nums: inout [Int]) {
    let n = nums.count
    var swap = 0 // 标记循环里的最后一次交换的位置
    var k = n-1 // 内循环判断条件
    
    for i in 0..<n {
        var flag = true  //若数组已经是有序的 提前结束break
        print("i = \(i)")
        for j in 0 ..< k {
            print("j = \(j)")
            if nums[j] > nums[j+1] {
                nums.swapAt(j, j+1)
                flag = false
                swap = j
                print("第\(i)次 第\(j)轮 \(nums)")
            }
        }
        k = swap

        if flag {
            print("已排序")
            break
        }
    }
}

var array = [8, 11, 4, 6, 2, 3, 5, 7,13]


bubbleSort(&array)
print(array)
