//: Playground - noun: a place where people can play

import UIKit

/// 归并排序
func mergeSort(_ array: [Int]) ->[Int] {
    var helper = Array(repeating: 0, count: array.count), array = array
    mergeSort(&array, &helper, 0, array.count - 1)
    return array
}

func mergeSort(_ array: inout [Int], _ helper: inout [Int], _ low: Int, _ high: Int) {
    guard low < high else {
        return
    }
    
    let middle = (high - low) / 2 + low
    mergeSort(&array, &helper, low, middle)
    mergeSort(&array, &helper, middle + 1, high)
    merge(&array, &helper, low, middle, high)
}

func merge(_ array: inout [Int], _ helper:inout [Int], _ low: Int, _ middle: Int, _ high: Int) {
    for i in low ... high {
        helper[i] = array[i]
    }
    var helperLeft = low, helperRight = middle + 1, current = low
    while helperLeft <= middle && helperRight <= high {
        if helper[helperLeft] <= helper[helperRight] {
            array[current] = helper[helperLeft]
            helperLeft += 1
        }
        else {
            array[current] = helper[helperRight]
            helperRight += 1
        }
        current += 1
    }
    
    guard middle - helperLeft >= 0 else {
        return;
    }
    for i in 0 ... middle - helperLeft {
        array[current + i] = helper[helperLeft + i]
    }
}

print(mergeSort([1,3,23,46,12,25,73,11,24,100,1230,52352,2343]))
