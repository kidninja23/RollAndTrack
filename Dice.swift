//
//  Dice.swift
//  RollAndTrack
//
//  Created by Jason Bice on 1/15/20.
//  Copyright © 2020 B Team Games. All rights reserved.
//

import SwiftUI

struct Dice: View {
    @State var diceNumber: Int
    @State var diceFace: Int = 0
    @State var isLocked : Bool = false
    @State var rolling: Int = 0
    @EnvironmentObject var diceStates : SixDiceStates

    //Add in the environment variables and then set a switch statment to set diceFace to the correct variable.
    var body: some View {
        
        // all lock states set to false in content view will later move this functionality
        VStack {
            
            Text(String(self.diceStates.allDiceStates.Dice1.1))
        
            Button(action: { if self.rolling != 0 {
                self.toggleLockStatus(thisDiceNumber: self.diceNumber)
                }
                
            }, label: {
                
                if self.isLocked {
                    ZStack {
                        Image("DiceSide0" + String(getDiceFace(thisDiceNumber: self.diceNumber))).renderingMode(.original).resizable().frame(width: 60, height: 60)
                        if self.rolling != 3 { Image("DiceLock").renderingMode(.original).resizable().frame(width: 20, height: 20).padding(.bottom, 38).padding(.trailing, 38)
                        }
                        
                    }
                    
                } else {
                    Image("DiceSide0" + String(getDiceFace(thisDiceNumber: self.diceNumber))).renderingMode(.original).resizable().frame(width: 60, height: 60)
                    }
                }
            )
        }
    }
    
    
    //TODO - Redefine functions with switch cases
    func getDiceFace(thisDiceNumber: Int) -> Int {
        var retVal : Int = 0
        self.rolling = self.diceStates.allDiceStates.RollCount
        if thisDiceNumber == 1 {
            self.diceFace = self.diceStates.allDiceStates.Dice1.0
            self.isLocked = self.diceStates.allDiceStates.Dice1.1
            retVal = self.diceStates.allDiceStates.Dice1.0
        }
        if thisDiceNumber == 2 {
            self.diceFace = self.diceStates.allDiceStates.Dice2.0
            retVal = self.diceStates.allDiceStates.Dice2.0
        }
        if thisDiceNumber == 3 {
            self.diceFace = self.diceStates.allDiceStates.Dice3.0
            retVal = self.diceStates.allDiceStates.Dice3.0
        }
        if thisDiceNumber == 4 {
            self.diceFace = self.diceStates.allDiceStates.Dice4.0
            retVal = self.diceStates.allDiceStates.Dice4.0
        }
        if thisDiceNumber == 5 {
            self.diceFace = self.diceStates.allDiceStates.Dice5.0
            retVal = self.diceStates.allDiceStates.Dice5.0
        }
        if thisDiceNumber == 6 {
            self.diceFace = self.diceStates.allDiceStates.Dice6.0
            retVal = self.diceStates.allDiceStates.Dice6.0
        }
        if thisDiceNumber == 7 {
            self.diceFace = self.diceStates.allDiceStates.Dice7.0
            retVal = self.diceStates.allDiceStates.Dice7.0
        }
        return retVal
    }
    
    func toggleLockStatus(thisDiceNumber: Int) {
        if thisDiceNumber == 1 {
            self.diceStates.allDiceStates.Dice1.1.toggle()
            self.isLocked = self.diceStates.allDiceStates.Dice1.1
            
        }
        if thisDiceNumber == 2 {
            self.diceStates.allDiceStates.Dice2.1.toggle()
            self.isLocked = self.diceStates.allDiceStates.Dice2.1
            
        }
        if thisDiceNumber == 3 {
            self.diceStates.allDiceStates.Dice3.1.toggle()
            self.isLocked = self.diceStates.allDiceStates.Dice3.1
            
        }
        if thisDiceNumber == 4 {
            self.diceStates.allDiceStates.Dice4.1.toggle()
            self.isLocked = self.diceStates.allDiceStates.Dice4.1
            
        }
        if thisDiceNumber == 5 {
            self.diceStates.allDiceStates.Dice5.1.toggle()
            self.isLocked = self.diceStates.allDiceStates.Dice5.1
            
        }
        if thisDiceNumber == 6 {
            self.diceStates.allDiceStates.Dice6.1.toggle()
            self.isLocked = self.diceStates.allDiceStates.Dice6.1
            
        }
        if thisDiceNumber == 7 {
            self.diceStates.allDiceStates.Dice7.1.toggle()
            self.isLocked = self.diceStates.allDiceStates.Dice7.1
            
        }
    }
    
    func getLockStatus(thisDiceNumber: Int) -> Bool {
        var retVal : Bool = false
        if thisDiceNumber == 1 {
            self.isLocked = self.diceStates.allDiceStates.Dice1.1
            retVal = self.diceStates.allDiceStates.Dice1.1
        }
        if thisDiceNumber == 2 {
            self.isLocked = self.diceStates.allDiceStates.Dice2.1
            retVal = self.diceStates.allDiceStates.Dice2.1
            
        }
        if thisDiceNumber == 3 {
            self.isLocked = self.diceStates.allDiceStates.Dice3.1
            retVal = self.diceStates.allDiceStates.Dice3.1
            
        }
        if thisDiceNumber == 4 {
            self.isLocked = self.diceStates.allDiceStates.Dice4.1
            retVal = self.diceStates.allDiceStates.Dice4.1
            
        }
        if thisDiceNumber == 5 {
            self.isLocked = self.diceStates.allDiceStates.Dice5.1
            retVal = self.diceStates.allDiceStates.Dice5.1
            
        }
        if thisDiceNumber == 6 {
            self.isLocked = self.diceStates.allDiceStates.Dice6.1
            retVal = self.diceStates.allDiceStates.Dice6.1
            
        }
        if thisDiceNumber == 7 {
            self.isLocked = self.diceStates.allDiceStates.Dice7.1
            retVal = self.diceStates.allDiceStates.Dice7.1
            
        }
        return retVal
    }
    
                
struct Dice_Previews: PreviewProvider {
    @State static var myCoolBool = false
    @State static var myRollCount = 1
    @State static var myDiceNumber = 1
    @State static var myDiceFace = 0
    
    static var previews: some View {
        Dice(diceNumber: myDiceNumber, diceFace: myDiceFace, isLocked: myCoolBool, rolling: myRollCount).environmentObject(SixDiceStates())
    }
}
}
