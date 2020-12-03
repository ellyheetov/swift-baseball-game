//
//  Computer.swift
//  baseball-game
//
//  Created by 박혜원 on 2020/11/29.
//

import Foundation

struct Computer {
    
    var randomNumber : String
    
    init() {
        self.randomNumber = ""
    }
    
    mutating func generateRandomNumber() {
        var numberSet = Set<String>()
        while(numberSet.count != 3){
            let num = Int.random(in: 1..<10)
            numberSet.insert(String(num))
        }
        let stringNumbers = [String](numberSet)
        self.randomNumber = stringNumbers.joined()
    }
    
    func checkAnswer(number playerNumber: String) -> Result {
        var result = Result()
        
        for index in randomNumber.indices{
            if randomNumber[index] == playerNumber[index] {
                result.numberOfStrike = result.numberOfStrike + 1
            }
            else if randomNumber.contains(playerNumber[index]){
                result.numberOfBall = result.numberOfBall + 1
            }
        }
        return result
    }
}
