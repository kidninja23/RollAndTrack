//
//  sixDice.swift
//  RollAndTrack
//
//  Created by Jason Bice on 1/25/20.
//  Copyright © 2020 B Team Games. All rights reserved.
//

import SwiftUI

struct sixDice: View {
    
    
    @EnvironmentObject var diceStates : SixDiceStates
    
    var body: some View {
        HStack {
            Dice(diceNumber: 1)
            Dice(diceNumber: 2)
            Dice(diceNumber: 3)
           // Dice(diceNumber: 4)
           // Dice(diceNumber: 5)
           // Dice(diceNumber: 6)
        }
    }
}

struct sixDice_Previews: PreviewProvider {
    @State static var curRoll = 1
    static var previews: some View {
        sixDice().environmentObject(SixDiceStates())

    }
}
