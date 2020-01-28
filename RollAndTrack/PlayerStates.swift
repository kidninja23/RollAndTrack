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
    
    func trackValues(theDCount: Int) {
        self.dState.getFaces(dCount: theDCount)
        for value in self.dState.allFaces {
            switch value {
            case 1: self.attackCount += 1
            case 2: if self.healthPoints < 10 {self.healthPoints += 1 }
            case 3: self.lootPoints += 1
            case 4: self.onesCount += 1
            case 5: self.twosCount += 1
            case 6: self.threesCount += 1
            default:
                break
            }
        }
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

    }
    
}
