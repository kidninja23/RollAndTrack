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
    @Published var victoryPoint : Int = 0
    @Published var onesCount : Int = 0
    @Published var twosCount : Int = 0
    @Published var threesCount : Int = 0
    @Published var healthPoints : Int = 6
    @Published var lootPoints : Int = 0

    @Published var attackPower : Int = 0
    @Published var attackCount : Int = 0
    
}
