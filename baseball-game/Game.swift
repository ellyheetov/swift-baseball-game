//
//  Game.swift
//  baseball-game
//
//  Created by 박혜원 on 2020/11/29.
//

import Foundation

struct Game {
    var computer : Computer
    var player : Player
    
    init() {
        self.computer = Computer()
        self.player = Player()
    }
    mutating func play(){
        computer.generateRandomNumber()
        var playerNumber : String
        
        var result: Result
        
        repeat{
            playerNumber = player.getInput()
            result = computer.checkAnswer(number: playerNumber)
            result.printScore()
        } while(result.numberOfStrike != 3)
        
        restartOrExit()
    }
    mutating func restartOrExit() {
        if player.wantReplay() {
            play()
        }
        else {
            return
//            exit(0)
        }
    }
}
