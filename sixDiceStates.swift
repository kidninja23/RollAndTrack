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

}
