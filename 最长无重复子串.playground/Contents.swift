import UIKit

// 1
func longestSubstringLength(_ s: String) -> Int {
    var maxLength = 0
    var chars = [Character]()
    for i in 0 ..< s.count {
        chars.removeAll()
        for j in i ..< s.count {
            if chars.contains(s.character(atIndex: j)) {
                print("break \(j)")
                break
            }
            else {
                chars.append(s.character(atIndex: j))
                maxLength = max(maxLength, chars.count)
            }
        }
        print("最外层\(i)")
    }
    return maxLength
}

// 2
func longestSubStringRange(_ s: String) -> Int {
    var temp: Substring = ""
    var i = 0, j = 0
    while j < s.count {
        if temp.contains(s.character(atIndex: j)) {
            i += 1
            
        }
        j += 1
        
        temp = s.prefix(j).suffix(i)
        print(temp)
    }
    return j - i
}



extension String {
    func character(atIndex index: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: index)]
    }
}


print(longestSubStringRange("aba"))
