import UIKit

//MARK: 暴力破解
func isPalindromic(_ s: String) -> Bool {
    let len = s.count
    for i in 0 ..< (len / 2) {
        if s[s.index(s.startIndex, offsetBy: i)] != s[s.index(s.startIndex, offsetBy: len - i - 1)] {
            return false
        }
    }
    return true
}



func longestPalindrome(_ s: String) -> String {
    var ans = "" , maxLength = 0
    let len = s.count
    for i in 0 ..< len {
        for j in i+1 ... len {
            let longString = s.prefix(j)
            let test = String(longString.suffix(j - i))
            if isPalindromic(test) && test.count > maxLength {
                ans = test
                maxLength = max(maxLength, ans.count)
            }
        }
    }
    return ans
}

//print(longestPalindrome("abba1abba11"))

//MARK: 扩展中心
func expandAroundCenter(_ s: String, _ left: Int, _ right: Int) -> Int {
    var l = left, r = right
    while l >= 0 && r < s.count && s.characterAtIndex(l) == s.characterAtIndex(r) {
        l -= 1
        r += 1
    }
    return r - l - 1
}

func longestPalindromeWithCenter(_ s: String) -> String {
    guard s.count < 2 else { return s }
    var start = 0, end = 0
    for i in 0 ..< s.count {
        let len1 = expandAroundCenter(s, i, i)
        let len2 = expandAroundCenter(s, i, i+1)
        let len = max(len1, len2)
        if len > end - start {
            start = i - (len - 1) / 2
            end = i + len / 2
            
        }
    }
    let longString = s.prefix(end)
    let test = String(longString.suffix(start - end - 1))
    return test
}

print(longestPalindromeWithCenter("abbbb"))


extension String {
    func characterAtIndex(_ index: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: index)]
    }
}




