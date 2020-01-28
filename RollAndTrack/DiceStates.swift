//
//  sixDiceStates.swift
//  RollAndTrack
//
//  Created by Jason Bice on 1/25/20.
//  Copyright © 2020 B Team Games. All rights reserved.
//

import Foundation
import SwiftUI
/*
 Published variable maintains all dice state values.
 Notice Dice7 not currently utilized, but will be used
 with later marketplace abilities.
 */
class DiceStates : ObservableObject {
    @EnvironmentObject var pState : PlayerStates
    typealias DiceStateValues = (Dice1: (Int, Bool), Dice2 : (Int, Bool),Dice3: (Int, Bool), Dice4: (Int, Bool), Dice5: (Int, Bool), Dice6: (Int, Bool), Dice7 : (Int,Bool), RollCount : Int)
    @Published var allDStates : DiceStateValues = (Dice1: (0, false), Dice2 : (0, false), Dice3 : (0, false), Dice4 : (0, false), Dice5 : (0, false), Dice6 : (0, false), Dice7: (0, false), RollCount : 0)
    @Published var maxDice : Int = 6
    @Published var allFaces : [Int] = []
    
    func getFaces(dCount : Int) {
        self.allFaces.removeAll()
        if dCount == 0 {return}
        self.allFaces.append(self.allDStates.Dice1.0)
        if dCount == 1 {return}
        self.allFaces.append(self.allDStates.Dice2.0)
        if dCount == 2 {return}
        self.allFaces.append(self.allDStates.Dice3.0)
        if dCount == 3 {return}
        self.allFaces.append(self.allDStates.Dice4.0)
        if dCount == 4 {return}
        self.allFaces.append(self.allDStates.Dice5.0)
        if dCount == 5 {return}
        self.allFaces.append(self.allDStates.Dice6.0)
        if dCount == 6 {return}
        self.allFaces.append(self.allDStates.Dice7.0)
    }
    
    func diceRoll(lockStatus: Bool, diceFace: inout Int) {
        if lockStatus == false {
            diceFace = Int.random(in: 1...6)
        }
    }
    
    func rollAll(theStates : DiceStateValues) {
        self.diceRoll(lockStatus: self.allDStates.Dice1.1, diceFace: &(self.allDStates.Dice1.0))
        self.diceRoll(lockStatus: self.allDStates.Dice2.1, diceFace: &(self.allDStates.Dice2.0))
        self.diceRoll(lockStatus: self.allDStates.Dice3.1, diceFace: &(self.allDStates.Dice3.0))
        self.diceRoll(lockStatus: self.allDStates.Dice4.1, diceFace: &(self.allDStates.Dice4.0))
        self.diceRoll(lockStatus: self.allDStates.Dice5.1, diceFace: &(self.allDStates.Dice5.0))
        self.diceRoll(lockStatus: self.allDStates.Dice6.1, diceFace: &(self.allDStates.Dice6.0))
        self.allDStates.RollCount += 1
    }
    
     func resetAll(){
        //reset all dice faces to zero face
        allDStates.Dice1.0 = 0
        allDStates.Dice2.0 = 0
        allDStates.Dice3.0 = 0
        allDStates.Dice4.0 = 0
        allDStates.Dice5.0 = 0
        allDStates.Dice6.0 = 0
        allDStates.Dice7.0 = 0
        //reset roll count to 0
        allDStates.RollCount = 0
        // reset all lock states
        allDStates.Dice1.1 = false
        allDStates.Dice2.1 = false
        allDStates.Dice3.1 = false
        allDStates.Dice4.1 = false
        allDStates.Dice5.1 = false
        allDStates.Dice6.1 = false
        allDStates.Dice7.1 = false
        
        //pState.onesCount = 0
        //pState.twosCount = 0
        //pState.threesCount = 0
        //pState.attackCount = 0
    }
    
    func trackValues(theDCount: Int) {
        self.getFaces(dCount: theDCount)
        for value in self.allFaces {
            switch value {
            case 1: self.pState.attackCount += 1
            case 2: if self.pState.healthPoints < 10 {self.pState.healthPoints += 1 }
            case 3: self.pState.lootPoints += 1
            case 4: self.pState.onesCount += 1
            case 5: self.pState.twosCount += 1
            case 6: self.pState.threesCount += 1
            default:
                break
            }
        }
        //Add values for victoryPoints
        if self.pState.onesCount >= 3 {
            self.pState.victoryPoint += (self.pState.onesCount - 3 + 1)
        }
        if self.pState.twosCount >= 3 {
            self.pState.victoryPoint += ((self.pState.twosCount - 3) + 2)
        }
        if self.pState.threesCount >= 3 {
            self.pState.victoryPoint += ((self.pState.threesCount - 3) + 3)
        }
        //Set Attack Power
        self.pState.attackPower = self.pState.attackCount
        //Reset dice variables and states
        self.resetAll()
    }
    

}
