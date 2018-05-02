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
    let seedSolved = ["935816274416927583287534916169378452378245691524691837791482365852163749643759128","123678945584239761967145328372461589691583274458792613836924157219857436745316892","152489376739256841468371295387371295387124659591763428246895713914637582625948137873512964"]
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
        
        return [randomSolved, randomUnsolved]
    }
    
    //todo?
    private func rotate(degrees deg : Int, square sqr : String) -> String
    {
        var ret = ""
        
        if deg == 0 //0
        {
            return ret
        }
        else if deg == 1 //90
        {
            /*
            ret.append(sqr[72])
            ret.append(sqr[63])
            ret.append(sqr[54])
            ret.append(sqr[45])
            ret.append(sqr[36])
            ret.append(sqr[27])
            ret.append(sqr[18])
            ret.append(sqr[9])
            ret.append(sqr[0])
            */
            return ret
        }
        else if deg == 2 //180
        {
            
            return ret
        }
        else if deg == 3 //270
        {
            
            return ret
        }
        else
        {
            return ret
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
