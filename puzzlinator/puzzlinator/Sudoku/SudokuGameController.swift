//
//  SudokuGameController.swift
//  puzzlinator
//
//  Created by Jacob Kessler on 4/23/18.
//  Copyright © 2018 EECS 392. All rights reserved.
//

import Foundation

class SudokuGame
{
    var numbers : [Int] = []
    let seedSolved = ["935816274416927583287534916169378452378245691524691837791482365852163749643759128","123678945584239761967145328372461589691583274458792613836924157219857436745316892","152489376739256841468371295387124659591763428246895713914637582625948137873512964"]
    let seedUnsolved = ["900006200400000500080500010100008050070205090020600007090002060002000009003700008","020608000580009700000040000370000500600000004008000013000020000009800036000306090","100489006730000040000001295007120600500703008006095700914600000020000037800512004"]

    func randomPuzzle() -> [String]
    {
        let seedNumber = Int(arc4random_uniform(UInt32(seedSolved.count)))
        var randomSolved = seedSolved[seedNumber]
        var randomUnsolved = seedUnsolved[seedNumber]
        
        //convert from 1-9 to a-i mapped directly (1:a, 2:b, ...)
        randomSolved = randomSolved.replacingOccurrences(of: "1", with: "a")
        randomSolved = randomSolved.replacingOccurrences(of: "2", with: "b")
        randomSolved = randomSolved.replacingOccurrences(of: "3", with: "c")
        randomSolved = randomSolved.replacingOccurrences(of: "4", with: "d")
        randomSolved = randomSolved.replacingOccurrences(of: "5", with: "e")
        randomSolved = randomSolved.replacingOccurrences(of: "6", with: "f")
        randomSolved = randomSolved.replacingOccurrences(of: "7", with: "g")
        randomSolved = randomSolved.replacingOccurrences(of: "8", with: "h")
        randomSolved = randomSolved.replacingOccurrences(of: "9", with: "i")

        randomUnsolved = randomUnsolved.replacingOccurrences(of: "1", with: "a")
        randomUnsolved = randomUnsolved.replacingOccurrences(of: "2", with: "b")
        randomUnsolved = randomUnsolved.replacingOccurrences(of: "3", with: "c")
        randomUnsolved = randomUnsolved.replacingOccurrences(of: "4", with: "d")
        randomUnsolved = randomUnsolved.replacingOccurrences(of: "5", with: "e")
        randomUnsolved = randomUnsolved.replacingOccurrences(of: "6", with: "f")
        randomUnsolved = randomUnsolved.replacingOccurrences(of: "7", with: "g")
        randomUnsolved = randomUnsolved.replacingOccurrences(of: "8", with: "h")
        randomUnsolved = randomUnsolved.replacingOccurrences(of: "9", with: "i")
        
        //convert from a-i to 1-9 mapped randomly
        var newPairs : [String : String] = [:]
        let letters : [String] = ["a", "b", "c", "d", "e", "f", "g", "h", "i"]
        var numbers : [String] = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

        var index = arc4random_uniform(UInt32(numbers.count))
        newPairs[letters[0]] = numbers[Int(index)]
        numbers.remove(at: Int(index))
        
        index = arc4random_uniform(UInt32(numbers.count))
        newPairs[letters[1]] = numbers[Int(index)]
        numbers.remove(at: Int(index))
        
        index = arc4random_uniform(UInt32(numbers.count))
        newPairs[letters[2]] = numbers[Int(index)]
        numbers.remove(at: Int(index))

        index = arc4random_uniform(UInt32(numbers.count))
        newPairs[letters[3]] = numbers[Int(index)]
        numbers.remove(at: Int(index))

        index = arc4random_uniform(UInt32(numbers.count))
        newPairs[letters[4]] = numbers[Int(index)]
        numbers.remove(at: Int(index))

        index = arc4random_uniform(UInt32(numbers.count))
        newPairs[letters[5]] = numbers[Int(index)]
        numbers.remove(at: Int(index))
        
        index = arc4random_uniform(UInt32(numbers.count))
        newPairs[letters[6]] = numbers[Int(index)]
        numbers.remove(at: Int(index))
        
        index = arc4random_uniform(UInt32(numbers.count))
        newPairs[letters[7]] = numbers[Int(index)]
        numbers.remove(at: Int(index))

        index = arc4random_uniform(UInt32(numbers.count))
        newPairs[letters[8]] = numbers[Int(index)]
        numbers.remove(at: Int(index))
        
        randomSolved = randomSolved.replacingOccurrences(of: "a", with: newPairs["a"]!)
        randomSolved = randomSolved.replacingOccurrences(of: "b", with: newPairs["b"]!)
        randomSolved = randomSolved.replacingOccurrences(of: "c", with: newPairs["c"]!)
        randomSolved = randomSolved.replacingOccurrences(of: "d", with: newPairs["d"]!)
        randomSolved = randomSolved.replacingOccurrences(of: "e", with: newPairs["e"]!)
        randomSolved = randomSolved.replacingOccurrences(of: "f", with: newPairs["f"]!)
        randomSolved = randomSolved.replacingOccurrences(of: "g", with: newPairs["g"]!)
        randomSolved = randomSolved.replacingOccurrences(of: "h", with: newPairs["h"]!)
        randomSolved = randomSolved.replacingOccurrences(of: "i", with: newPairs["i"]!)
        
        randomUnsolved = randomUnsolved.replacingOccurrences(of: "a", with: newPairs["a"]!)
        randomUnsolved = randomUnsolved.replacingOccurrences(of: "b", with: newPairs["b"]!)
        randomUnsolved = randomUnsolved.replacingOccurrences(of: "c", with: newPairs["c"]!)
        randomUnsolved = randomUnsolved.replacingOccurrences(of: "d", with: newPairs["d"]!)
        randomUnsolved = randomUnsolved.replacingOccurrences(of: "e", with: newPairs["e"]!)
        randomUnsolved = randomUnsolved.replacingOccurrences(of: "f", with: newPairs["f"]!)
        randomUnsolved = randomUnsolved.replacingOccurrences(of: "g", with: newPairs["g"]!)
        randomUnsolved = randomUnsolved.replacingOccurrences(of: "h", with: newPairs["h"]!)
        randomUnsolved = randomUnsolved.replacingOccurrences(of: "i", with: newPairs["i"]!)
        
        let rotationDegrees = Int(arc4random_uniform(UInt32(4)))
        
        randomSolved = rotate(degrees: rotationDegrees, square: randomSolved)
        randomUnsolved = rotate(degrees: rotationDegrees, square: randomUnsolved)

        return [randomSolved, randomUnsolved]
    }
    
    private func rotate(degrees deg : Int, square sqr : String) -> String
    {
        var ret = ""
        
        if deg == 0 //0
        {
            return sqr
        }
        else if deg == 1 //90
        {
            let row1 = 72
            let row2 = 63
            let row3 = 54
            let row4 = 45
            let row5 = 36
            let row6 = 27
            let row7 = 18
            let row8 = 9
            let row9 = 0
            
            ret.append(sqr[row1])
            ret.append(sqr[row2])
            ret.append(sqr[row3])
            ret.append(sqr[row4])
            ret.append(sqr[row5])
            ret.append(sqr[row6])
            ret.append(sqr[row7])
            ret.append(sqr[row8])
            ret.append(sqr[row9])
            
            ret.append(sqr[row1+1])
            ret.append(sqr[row2+1])
            ret.append(sqr[row3+1])
            ret.append(sqr[row4+1])
            ret.append(sqr[row5+1])
            ret.append(sqr[row6+1])
            ret.append(sqr[row7+1])
            ret.append(sqr[row8+1])
            ret.append(sqr[row9+1])
            
            ret.append(sqr[row1+2])
            ret.append(sqr[row2+2])
            ret.append(sqr[row3+2])
            ret.append(sqr[row4+2])
            ret.append(sqr[row5+2])
            ret.append(sqr[row6+2])
            ret.append(sqr[row7+2])
            ret.append(sqr[row8+2])
            ret.append(sqr[row9+2])
            
            ret.append(sqr[row1+3])
            ret.append(sqr[row2+3])
            ret.append(sqr[row3+3])
            ret.append(sqr[row4+3])
            ret.append(sqr[row5+3])
            ret.append(sqr[row6+3])
            ret.append(sqr[row7+3])
            ret.append(sqr[row8+3])
            ret.append(sqr[row9+3])
            
            ret.append(sqr[row1+4])
            ret.append(sqr[row2+4])
            ret.append(sqr[row3+4])
            ret.append(sqr[row4+4])
            ret.append(sqr[row5+4])
            ret.append(sqr[row6+4])
            ret.append(sqr[row7+4])
            ret.append(sqr[row8+4])
            ret.append(sqr[row9+4])
            
            ret.append(sqr[row1+5])
            ret.append(sqr[row2+5])
            ret.append(sqr[row3+5])
            ret.append(sqr[row4+5])
            ret.append(sqr[row5+5])
            ret.append(sqr[row6+5])
            ret.append(sqr[row7+5])
            ret.append(sqr[row8+5])
            ret.append(sqr[row9+5])
            
            ret.append(sqr[row1+6])
            ret.append(sqr[row2+6])
            ret.append(sqr[row3+6])
            ret.append(sqr[row4+6])
            ret.append(sqr[row5+6])
            ret.append(sqr[row6+6])
            ret.append(sqr[row7+6])
            ret.append(sqr[row8+6])
            ret.append(sqr[row9+6])
            
            ret.append(sqr[row1+7])
            ret.append(sqr[row2+7])
            ret.append(sqr[row3+7])
            ret.append(sqr[row4+7])
            ret.append(sqr[row5+7])
            ret.append(sqr[row6+7])
            ret.append(sqr[row7+7])
            ret.append(sqr[row8+7])
            ret.append(sqr[row9+7])
            
            ret.append(sqr[row1+8])
            ret.append(sqr[row2+8])
            ret.append(sqr[row3+8])
            ret.append(sqr[row4+8])
            ret.append(sqr[row5+8])
            ret.append(sqr[row6+8])
            ret.append(sqr[row7+8])
            ret.append(sqr[row8+8])
            ret.append(sqr[row9+8])

            return ret
        }
        else if deg == 2 //180
        {
            let row1 = 80
            let row2 = 79
            let row3 = 78
            let row4 = 77
            let row5 = 76
            let row6 = 75
            let row7 = 74
            let row8 = 73
            let row9 = 72
            
            ret.append(sqr[row1])
            ret.append(sqr[row2])
            ret.append(sqr[row3])
            ret.append(sqr[row4])
            ret.append(sqr[row5])
            ret.append(sqr[row6])
            ret.append(sqr[row7])
            ret.append(sqr[row8])
            ret.append(sqr[row9])
            
            ret.append(sqr[row1-(9*1)])
            ret.append(sqr[row2-(9*1)])
            ret.append(sqr[row3-(9*1)])
            ret.append(sqr[row4-(9*1)])
            ret.append(sqr[row5-(9*1)])
            ret.append(sqr[row6-(9*1)])
            ret.append(sqr[row7-(9*1)])
            ret.append(sqr[row8-(9*1)])
            ret.append(sqr[row9-(9*1)])
            
            ret.append(sqr[row1-(9*2)])
            ret.append(sqr[row2-(9*2)])
            ret.append(sqr[row3-(9*2)])
            ret.append(sqr[row4-(9*2)])
            ret.append(sqr[row5-(9*2)])
            ret.append(sqr[row6-(9*2)])
            ret.append(sqr[row7-(9*2)])
            ret.append(sqr[row8-(9*2)])
            ret.append(sqr[row9-(9*2)])
            
            ret.append(sqr[row1-(9*3)])
            ret.append(sqr[row2-(9*3)])
            ret.append(sqr[row3-(9*3)])
            ret.append(sqr[row4-(9*3)])
            ret.append(sqr[row5-(9*3)])
            ret.append(sqr[row6-(9*3)])
            ret.append(sqr[row7-(9*3)])
            ret.append(sqr[row8-(9*3)])
            ret.append(sqr[row9-(9*3)])

            ret.append(sqr[row1-(9*4)])
            ret.append(sqr[row2-(9*4)])
            ret.append(sqr[row3-(9*4)])
            ret.append(sqr[row4-(9*4)])
            ret.append(sqr[row5-(9*4)])
            ret.append(sqr[row6-(9*4)])
            ret.append(sqr[row7-(9*4)])
            ret.append(sqr[row8-(9*4)])
            ret.append(sqr[row9-(9*4)])

            ret.append(sqr[row1-(9*5)])
            ret.append(sqr[row2-(9*5)])
            ret.append(sqr[row3-(9*5)])
            ret.append(sqr[row4-(9*5)])
            ret.append(sqr[row5-(9*5)])
            ret.append(sqr[row6-(9*5)])
            ret.append(sqr[row7-(9*5)])
            ret.append(sqr[row8-(9*5)])
            ret.append(sqr[row9-(9*5)])

            ret.append(sqr[row1-(9*6)])
            ret.append(sqr[row2-(9*6)])
            ret.append(sqr[row3-(9*6)])
            ret.append(sqr[row4-(9*6)])
            ret.append(sqr[row5-(9*6)])
            ret.append(sqr[row6-(9*6)])
            ret.append(sqr[row7-(9*6)])
            ret.append(sqr[row8-(9*6)])
            ret.append(sqr[row9-(9*6)])

            ret.append(sqr[row1-(9*7)])
            ret.append(sqr[row2-(9*7)])
            ret.append(sqr[row3-(9*7)])
            ret.append(sqr[row4-(9*7)])
            ret.append(sqr[row5-(9*7)])
            ret.append(sqr[row6-(9*7)])
            ret.append(sqr[row7-(9*7)])
            ret.append(sqr[row8-(9*7)])
            ret.append(sqr[row9-(9*7)])

            ret.append(sqr[row1-(9*8)])
            ret.append(sqr[row2-(9*8)])
            ret.append(sqr[row3-(9*8)])
            ret.append(sqr[row4-(9*8)])
            ret.append(sqr[row5-(9*8)])
            ret.append(sqr[row6-(9*8)])
            ret.append(sqr[row7-(9*8)])
            ret.append(sqr[row8-(9*8)])
            ret.append(sqr[row9-(9*8)])

            return ret
        }
        else if deg == 3 //270
        {
            let row1 = 8
            let row2 = 17
            let row3 = 26
            let row4 = 35
            let row5 = 44
            let row6 = 53
            let row7 = 62
            let row8 = 71
            let row9 = 80
            
            ret.append(sqr[row1])
            ret.append(sqr[row2])
            ret.append(sqr[row3])
            ret.append(sqr[row4])
            ret.append(sqr[row5])
            ret.append(sqr[row6])
            ret.append(sqr[row7])
            ret.append(sqr[row8])
            ret.append(sqr[row9])
            
            ret.append(sqr[row1-1])
            ret.append(sqr[row2-1])
            ret.append(sqr[row3-1])
            ret.append(sqr[row4-1])
            ret.append(sqr[row5-1])
            ret.append(sqr[row6-1])
            ret.append(sqr[row7-1])
            ret.append(sqr[row8-1])
            ret.append(sqr[row9-1])
            
            ret.append(sqr[row1-2])
            ret.append(sqr[row2-2])
            ret.append(sqr[row3-2])
            ret.append(sqr[row4-2])
            ret.append(sqr[row5-2])
            ret.append(sqr[row6-2])
            ret.append(sqr[row7-2])
            ret.append(sqr[row8-2])
            ret.append(sqr[row9-2])

            ret.append(sqr[row1-3])
            ret.append(sqr[row2-3])
            ret.append(sqr[row3-3])
            ret.append(sqr[row4-3])
            ret.append(sqr[row5-3])
            ret.append(sqr[row6-3])
            ret.append(sqr[row7-3])
            ret.append(sqr[row8-3])
            ret.append(sqr[row9-3])

            ret.append(sqr[row1-4])
            ret.append(sqr[row2-4])
            ret.append(sqr[row3-4])
            ret.append(sqr[row4-4])
            ret.append(sqr[row5-4])
            ret.append(sqr[row6-4])
            ret.append(sqr[row7-4])
            ret.append(sqr[row8-4])
            ret.append(sqr[row9-4])

            ret.append(sqr[row1-5])
            ret.append(sqr[row2-5])
            ret.append(sqr[row3-5])
            ret.append(sqr[row4-5])
            ret.append(sqr[row5-5])
            ret.append(sqr[row6-5])
            ret.append(sqr[row7-5])
            ret.append(sqr[row8-5])
            ret.append(sqr[row9-5])

            ret.append(sqr[row1-6])
            ret.append(sqr[row2-6])
            ret.append(sqr[row3-6])
            ret.append(sqr[row4-6])
            ret.append(sqr[row5-6])
            ret.append(sqr[row6-6])
            ret.append(sqr[row7-6])
            ret.append(sqr[row8-6])
            ret.append(sqr[row9-6])

            ret.append(sqr[row1-7])
            ret.append(sqr[row2-7])
            ret.append(sqr[row3-7])
            ret.append(sqr[row4-7])
            ret.append(sqr[row5-7])
            ret.append(sqr[row6-7])
            ret.append(sqr[row7-7])
            ret.append(sqr[row8-7])
            ret.append(sqr[row9-7])

            ret.append(sqr[row1-8])
            ret.append(sqr[row2-8])
            ret.append(sqr[row3-8])
            ret.append(sqr[row4-8])
            ret.append(sqr[row5-8])
            ret.append(sqr[row6-8])
            ret.append(sqr[row7-8])
            ret.append(sqr[row8-8])
            ret.append(sqr[row9-8])

            return ret
        }
        else
        {
            return sqr
        }
    }

}

extension String {
    subscript (i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }
    subscript (bounds: CountableRange<Int>) -> Substring {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return self[start ..< end]
    }
    subscript (bounds: CountableClosedRange<Int>) -> Substring {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return self[start ... end]
    }
    subscript (bounds: CountablePartialRangeFrom<Int>) -> Substring {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(endIndex, offsetBy: -1)
        return self[start ... end]
    }
    subscript (bounds: PartialRangeThrough<Int>) -> Substring {
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return self[startIndex ... end]
    }
    subscript (bounds: PartialRangeUpTo<Int>) -> Substring {
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return self[startIndex ..< end]
    }
}

extension Substring {
    subscript (i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }
    subscript (bounds: CountableRange<Int>) -> Substring {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return self[start ..< end]
    }
    subscript (bounds: CountableClosedRange<Int>) -> Substring {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return self[start ... end]
    }
    subscript (bounds: CountablePartialRangeFrom<Int>) -> Substring {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(endIndex, offsetBy: -1)
        return self[start ... end]
    }
    subscript (bounds: PartialRangeThrough<Int>) -> Substring {
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return self[startIndex ... end]
    }
    subscript (bounds: PartialRangeUpTo<Int>) -> Substring {
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return self[startIndex ..< end]
    }
}

