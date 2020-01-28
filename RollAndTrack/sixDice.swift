//
//  sixDice.swift
//  RollAndTrack
//
//  Created by Jason Bice on 1/25/20.
//  Copyright © 2020 B Team Games. All rights reserved.
//

import SwiftUI

struct sixDice: View {
    

    @EnvironmentObject var dState : DiceStates
    
    var body: some View {
        VStack {
            //Text(String(diceStates.allDiceStates.Dice1.1))
            HStack {
                NewDice(dNumber: 1)
                NewDice(dNumber: 2)
                NewDice(dNumber: 3)
                NewDice(dNumber: 4)
                NewDice(dNumber: 5)
                NewDice(dNumber: 6)
            }
        }
        
    }
}

struct sixDice_Previews: PreviewProvider {
    @State static var curRoll = 1
    static var previews: some View {
        sixDice().environmentObject(DiceStates())

    }
}
