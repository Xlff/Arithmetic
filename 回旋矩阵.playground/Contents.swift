import UIKit

func matrix(_ n : Int) -> [[Int]] {
    guard n > 1 else {
        return [[1]]
    }
    let numbers = repeatElement(0, count: n).shuffled()
    var result = repeatElement(numbers, count: n).shuffled()
    var count = 1
    var direction = 1 // 方向 , 右 下 左 上
    var left = 0 // 矩阵左边界
    var right = n - 1
    var top = 0
    var bottom = n - 1
    
    while (left <= right && top<=bottom) {
        if direction == 1 {
            for i in left...right {
                result[top][i] = count;
                count += 1
            }
            top += 1
            direction = 2
        }
        else if direction == 2 {
            for i in top...bottom {
                result[i][right] = count
                count += 1
            }
            right -= 1
            direction = 3
        }
        else if direction == 3 {
            for i in (left...right).reversed() {
                result[bottom][i] = count
                count += 1
            }
            bottom -= 1
            direction = 4
        }
        else {
            for i in (top...bottom).reversed() {
                result[i][left] = count
                count += 1
            }
            left += 1
            direction = 1
        }
    }
    return result
}


print(matrix(2))
