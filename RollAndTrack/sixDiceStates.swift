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
class SixDiceStates : ObservableObject {
    typealias DiceStateValues = (Dice1: (Int, Bool), Dice2 : (Int, Bool),Dice3: (Int, Bool), Dice4: (Int, Bool), Dice5: (Int, Bool), Dice6: (Int, Bool), Dice7 : (Int,Bool), RollCount : Int)
    @Published var allDiceStates : DiceStateValues = (Dice1: (0, false), Dice2 : (0, false), Dice3 : (0, false), Dice4 : (0, false), Dice5 : (0, false), Dice6 : (0, false), Dice7: (0, false), RollCount : 1)
    
    func lockIt(diceNumber : Int) -> Bool {
        var retVal = false
        if diceNumber == 1 {
            allDiceStates.Dice1.1.toggle()
            retVal = allDiceStates.Dice1.1
        }
        if diceNumber == 2 {
            allDiceStates.Dice1.1.toggle()
            retVal = allDiceStates.Dice2.1
        }
        if diceNumber == 3 {
            allDiceStates.Dice1.1.toggle()
            retVal = allDiceStates.Dice3.1
        }
        if diceNumber == 4 {
            allDiceStates.Dice1.1.toggle()
            retVal = allDiceStates.Dice4.1
        }
        if diceNumber == 5 {
            allDiceStates.Dice1.1.toggle()
            retVal = allDiceStates.Dice5.1
        }
        if diceNumber == 6 {
            allDiceStates.Dice1.1.toggle()
            retVal = allDiceStates.Dice6.1
        }
        if diceNumber == 7 {
            allDiceStates.Dice1.1.toggle()
            retVal = allDiceStates.Dice7.1
        }
        return retVal
    }

}
