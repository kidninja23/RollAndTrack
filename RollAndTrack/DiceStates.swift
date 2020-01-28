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
    

}
