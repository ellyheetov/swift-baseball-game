//
//  InputView.swift
//  baseball-game
//
//  Created by 박혜원 on 2020/11/30.
//

import Foundation

enum InputError : Error {
    case notNumber // 숫자 판단
    case wrongDigit // 자리수 판단
    case wrongRange // 범위 판단
    case duplication // 중복값 판단
}

struct InputView {
    
    static public func checkInputValidation(inputNumber playerNumber : String?) throws {
 
        /* 숫자 판단 */
        if playerNumber == nil {
            throw InputError.notNumber
        }
        if notNumber(playerNumber!) {
            throw InputError.notNumber
        }
        /* 자리수 판단 */
        if wrongDigit(playerNumber!) {
            throw InputError.wrongDigit
        }
        /* 범위 판단 */
        if wrongRange(playerNumber!) {
            throw InputError.wrongRange
        }
        /* 중복값 판단 */
        if duplication(playerNumber!) {
            throw InputError.duplication
        }
    }
    
    static public func getInputNumber() -> String? {
        let question = "숫자를 입력해주세요"
        var number :String?

        do{
            number = getAnswerTo(question)
            try checkInputValidation(inputNumber: number)
        } catch InputError.notNumber {
            print("숫자가 아닙니다. 숫자를 입력해 주세요")
            return nil
        } catch InputError.wrongDigit {
            print("3개의 숫자를 입력해주세요")
            return nil
        } catch InputError.wrongRange {
            print("1부터 9사이로 이루어진 3개의 숫자를 입력해주세요")
            return nil
        } catch InputError.duplication {
            print("중복된 숫자는 허용되지 않습니다. 각 다른 숫자로 이루어진 3개의 숫자를 입력해주세요.")
            return nil
        } catch {
            print("이건 예상치 못한 에러군...")
            return nil
        }
        return number!
    }
    
    static public func wantReplay() -> Bool {
        let question = "게임을 새로 시작하려면 1, 종료하려면 2를 입력하세요."
        var answer : String?
        
        repeat {
            answer = getAnswerTo(question)
        } while(answer != "1" && answer != "2")
        
        if answer == "1" {
            return true
        }
        return false
    }
    
    static public func getAnswerTo(_ question: String) -> String? {
        print(question)
        guard let answer = readLine() else {
            return nil
        }
        return answer
    }
    
    static public func notNumber(_ number: String) -> Bool {
        return Int(number) == nil
    }
    static public func wrongDigit(_ number: String) -> Bool {
        return number.count != 3
    }
    static public func wrongRange(_ number: String) -> Bool {
        for oneNumber in number {
            let integerNumber : Int = Int(String(oneNumber))!
            if integerNumber <= 0 {
                return true
            }
        }
        return false
    }
    static public func duplication(_ number: String) -> Bool {
        var set = Set<Character>()
        for oneNumber in number {
            if set.contains(oneNumber){
                return true
            }
            set.insert(oneNumber)
        }
        return false
    }
}
