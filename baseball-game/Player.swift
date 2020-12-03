//
//  Player.swift
//  baseball-game
//
//  Created by 박혜원 on 2020/11/29.
//

import Foundation

struct Player {
    
    var playerNumber : String?
    
    init() {
        self.playerNumber = nil
    }
    
    mutating func getInput() -> String {
        
        repeat {
            self.playerNumber = InputView.getInputNumber()
        } while (self.playerNumber == nil)
        
        return playerNumber!
    }
    func wantReplay() -> Bool {
        return InputView.wantReplay()
    }
}
