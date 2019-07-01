import UIKit

//计数排序的核心思想是把一个无序序列 A 转换成另一个有序序列 B，从 B 中逐个“取出”所有元素，取出的元素即为有序
// 1计算每个元素出现在序列中的次数

var array = [ 10, 9, 8, 7, 1, 2, 7, 3 ]
let maxValue = array.max() ?? 0
var countArray = [Int](repeating: 0, count: Int(maxValue + 1))
for item in array {
    countArray[item] += 1
}
//[0, 1, 1, 1, 0, 0, 0, 2, 1, 1, 1]

// 2 保存当前index与前一位的和
for index in 1..<countArray.count {
    let sum = countArray[index] + countArray[index - 1]
    countArray[index] = sum
}
//[0, 1, 2, 3, 3, 3, 3, 5, 6, 7, 8]
print(countArray)

var sortArray = [Int](repeating: 0, count: array.count)


for item in array {
    print(countArray[item])
    countArray[item] -= 1
    print("\(countArray) --- \(countArray[item])")
    sortArray[countArray[item]] = item
}
print(sortArray)

