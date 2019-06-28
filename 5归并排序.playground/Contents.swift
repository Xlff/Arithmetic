import UIKit

// 采用分治思想， 先把待排序列拆分成一个个子序列，直到子序列只有一个元素，停止拆分，然后对每个子序列进行边排序边合并，


func mergeSort(_ a: [Int]) -> [Int] {
    guard a.count > 1 else { return a }
    let middleIndex = a.count / 2
    let leftArray = mergeSort(Array(a[0..<middleIndex]))
    let rightArray = mergeSort(Array(a[middleIndex..<a.count]))
    
    return merge(leftPile: leftArray, rightPile: rightArray)
}

func merge(leftPile: [Int], rightPile: [Int]) -> [Int] {
    var leftIndex = 0
    var rightIndex = 0
    
    var orderedPile = [Int]()
    orderedPile.reserveCapacity(leftPile.count + rightPile.count)
    
    while leftIndex < leftPile.count && rightIndex < rightPile.count {
        if leftPile[leftIndex] < rightPile[rightIndex] {
            orderedPile.append(leftPile[leftIndex])
            leftIndex += 1
        }
        else if leftPile[leftIndex] > rightPile[rightIndex] {
            orderedPile.append(rightPile[rightIndex])
            rightIndex += 1
        }
        else {
            orderedPile.append(leftPile[leftIndex])
            leftIndex += 1
            orderedPile.append(rightPile[rightIndex])
            rightIndex += 1
        }
    }
    
    while leftIndex < leftPile.count {
        orderedPile.append(leftPile[leftIndex])
        leftIndex += 1
    }
    
    while rightIndex < rightPile.count {
        orderedPile.append(rightPile[rightIndex])
        rightIndex += 1
    }
    return orderedPile
}

var arr = [ 8, 1, 4, 6, 2, 3, 5, 7 ]
mergeSort(arr)


// 版本2

func mergeSortBottomUp<T>(_ a: [T], _ isOrderBefore: (T, T) -> Bool) -> [T] {
    let n = a.count
    var z = [a, a]
    var d = 0
    
    var width = 1
    while width < n {
        var i = 0
        while i < n {
            var j = i
            var l = i
            var r = i + width
            
            let lmax = min(l+width, n)
            let rmax = min(r+width, n)
            
            while l < lmax && r < rmax {
                if isOrderBefore(z[d][l], z[d][r]) {
                    z[1-d][j] = z[d][l]
                    l += 1
                }
                else {
                    z[1-d][j] = z[d][r]
                    r += 1
                }
                j += 1
            }
            while l < lmax {
                z[1-d][j] = z[d][j]
                j += 1
                l += 1
            }
            while r < rmax {
                z[1-d][j] = z[d][r]
                j += 1
                r += 1
            }
             i += width * 2
        }
        width *= 2
        d = 1-d
    }
    return z[d]
}

let list = [2, 1, 5, 4, 9]
mergeSortBottomUp(list, <)
