import Algorithms

struct Day01: AdventDay {
    // Save your data in a corresponding text file in the `Data` directory.
    var data: String
    
    func part1() -> Any {
        var tempLine = ""
        var result = 0
        
        for char in data {
            if char == "\n" {
                result += getDigitsOfLine(tempLine)
                tempLine = ""
            } else {
                tempLine.append(String(char))
            }
        }
        
        return result
    }
    
    func part2() -> Any {
        var tempLine = ""
        var result = 0
        
        for char in data {
            if char == "\n" {
                let line = replaceString(String(tempLine))
                result += getDigitsOfLine(line)
                tempLine = ""
            } else {
                tempLine.append(String(char))
            }
        }
        
        return result
    }
    
    func getDigitsOfLine(_ line: String) -> Int {
        let nums = line.compactMap { $0.isNumber ? String($0) : nil }
        let num = nums[0].appending(nums[nums.count - 1])
        
        return Int(num) ?? 0
    }
    
    func replaceString(_ str: String) -> String {
        var newString = str
        
        if str.contains("one") {
            newString = newString.replacingOccurrences(of: "one", with: "o1e")
        }
        if str.contains("two") {
            newString = newString.replacingOccurrences(of: "two", with: "t2o")
        }
        if str.contains("three") {
            newString = newString.replacingOccurrences(of: "three", with: "t3e")
        }
        if str.contains("four") {
            newString = newString.replacingOccurrences(of: "four", with: "f4")
        }
        if str.contains("five") {
            newString = newString.replacingOccurrences(of: "five", with: "f5e")
        }
        if str.contains("six") {
            newString = newString.replacingOccurrences(of: "six", with: "s6")
        }
        if str.contains("seven") {
            newString = newString.replacingOccurrences(of: "seven", with: "s7n")
        }
        if str.contains("eight") {
            newString = newString.replacingOccurrences(of: "eight", with: "e8t")
        }
        if str.contains("nine") {
            newString = newString.replacingOccurrences(of: "nine", with: "n9e")
        }
        
        return newString
    }
}
