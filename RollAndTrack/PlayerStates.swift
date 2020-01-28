//
//  PlayerStates.swift
//  RollAndTrack
//
//  Created by Jason Bice on 1/27/20.
//  Copyright © 2020 B Team Games. All rights reserved.
//

import Foundation
import SwiftUI

class PlayerStates : ObservableObject {
    @EnvironmentObject var dState : DiceStates
    @Published var victoryPoint : Int = 0
    @Published var onesCount : Int = 0
    @Published var twosCount : Int = 0
    @Published var threesCount : Int = 0
    @Published var healthPoints : Int = 6
    @Published var lootPoints : Int = 0

    @Published var attackPower : Int = 0
    @Published var attackCount : Int = 0
    
    func ptsAndPower() {
        //Add values for victoryPoints
        if self.onesCount >= 3 {
            self.victoryPoint += (self.onesCount - 3 + 1)
        }
        if self.twosCount >= 3 {
            self.victoryPoint += ((self.twosCount - 3) + 2)
        }
        if self.threesCount >= 3 {
            self.victoryPoint += ((self.threesCount - 3) + 3)
        }
        //Set Attack Power
        self.attackPower = self.attackCount
        //Reset dice variables and states
    }
    
     func resetPAll(){
        //reset attackCount, onesCount, twosCount, and threesCount to 0
        self.onesCount = 0
        self.twosCount = 0
        self.threesCount = 0
        self.attackCount = 0
    }
    
}
