//
//  NewDice.swift
//  RollAndTrack
//
//  Created by Jason Bice on 1/27/20.
//  Copyright © 2020 B Team Games. All rights reserved.
//

import SwiftUI

struct NewDice: View {
    @EnvironmentObject var dState : SixDiceStates
    @State var value = "test"
    @State var dNumber : Int
    
    var body: some View {
        VStack {
            //Text(value)
            Button(action: {
                if self.dState.allDiceStates.RollCount != 0 {
                    self.dToggle(theD: self.dNumber)}
            }, label: {
                if self.dLock(theD: self.dNumber) {
                    ZStack {
                        Image("DiceSide0" + String(self.dFace(theD: self.dNumber))).renderingMode(.original).resizable().frame(width: 60, height: 60)
                        if dState.allDiceStates.RollCount != 3 { Image("DiceLock").renderingMode(.original).resizable().frame(width: 20, height: 20).padding(.bottom, 38).padding(.trailing, 38)
                        }
                    } // End ZStack
                } //End IF
                else {
                    Image("DiceSide0" + String(self.dFace(theD: self.dNumber))).renderingMode(.original).resizable().frame(width: 60, height: 60)
                }//End ELSE
            })//End Button
        }
    }
    func dToggle(theD : Int) -> Void {
        if theD == 1 {
            self.dState.allDiceStates.Dice1.1.toggle()
            self.value = String(self.dState.allDiceStates.Dice1.1)
        }
        if theD == 2 {
            self.dState.allDiceStates.Dice2.1.toggle()
            self.value = String(self.dState.allDiceStates.Dice2.1)
        }
        if theD == 3 {
            self.dState.allDiceStates.Dice3.1.toggle()
            self.value = String(self.dState.allDiceStates.Dice3.1)
        }
        if theD == 4 {
            self.dState.allDiceStates.Dice4.1.toggle()
            self.value = String(self.dState.allDiceStates.Dice4.1)
        }
        if theD == 5 {
            self.dState.allDiceStates.Dice5.1.toggle()
            self.value = String(self.dState.allDiceStates.Dice5.1)
        }
        if theD == 6 {
            self.dState.allDiceStates.Dice6.1.toggle()
            self.value = String(self.dState.allDiceStates.Dice6.1)
        }
        if theD == 7 {
            self.dState.allDiceStates.Dice7.1.toggle()
            self.value = String(self.dState.allDiceStates.Dice7.1)
        }
    }
    
    func dFace(theD: Int) -> Int {
        var retVal = 0
        if theD == 1 {
            retVal = self.dState.allDiceStates.Dice1.0
        }
        if theD == 2 {
            retVal = self.dState.allDiceStates.Dice2.0
        }
        if theD == 3 {
            retVal = self.dState.allDiceStates.Dice3.0
        }
        if theD == 4 {
            retVal = self.dState.allDiceStates.Dice4.0
        }
        if theD == 5 {
            retVal = self.dState.allDiceStates.Dice5.0
        }
        if theD == 6 {
            retVal = self.dState.allDiceStates.Dice6.0
        }
        if theD == 7 {
            retVal = self.dState.allDiceStates.Dice6.0
        }
        return retVal
    }
    
    func dLock(theD: Int) -> Bool {
        var retVal = false
        if theD == 1 {
            retVal = self.dState.allDiceStates.Dice1.1
        }
        if theD == 2 {
            retVal = self.dState.allDiceStates.Dice2.1
        }
        if theD == 3 {
            retVal = self.dState.allDiceStates.Dice3.1
        }
        if theD == 4 {
            retVal = self.dState.allDiceStates.Dice4.1
        }
        if theD == 5 {
            retVal = self.dState.allDiceStates.Dice5.1
        }
        if theD == 6 {
            retVal = self.dState.allDiceStates.Dice6.1
        }
        if theD == 7 {
            retVal = self.dState.allDiceStates.Dice7.1
        }
        return retVal
    }
    

    
}

struct NewDice_Previews: PreviewProvider {
    @State static var someInt = 1
    static var previews: some View {
        NewDice(dNumber: 1).environmentObject(SixDiceStates())
    }
}