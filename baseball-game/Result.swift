//
//  Result.swift
//  baseball-game
//
//  Created by 박혜원 on 2020/11/30.
//  난수와 예측 값의 비교 결과를 저장하는 구조체
//

import Foundation

struct Result {
    var _numberOfBall : Int
    var _numberOfStrike : Int
    
    var numberOfBall : Int {
        get {
            return _numberOfBall
        }
        set(newValue){
            _numberOfBall = newValue
        }
    }
    
    var numberOfStrike : Int {
        get {
            return _numberOfStrike
        }
        set(newValue){
            _numberOfStrike = newValue
        }
    }
    
    init() {
        self._numberOfBall = 0
        self._numberOfStrike = 0
    }
    
    func printScore() {
        if(self.numberOfStrike == 3){
            print("3 Strike")
            print("\(self.numberOfStrike) 3개의 숫자를 모두 맞히셨습니다! 게임 종료")
        }
        else if(self.numberOfBall == 0 && self.numberOfStrike == 0){
            print("Nothing")
        }
        else {
            print("\(self.numberOfBall)볼 \(self.numberOfStrike)스트라이크")
        }
    }
}
