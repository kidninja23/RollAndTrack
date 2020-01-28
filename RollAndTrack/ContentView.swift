//
//  ContentView.swift
//  RollAndTrack
//
//  Created by Jason Bice on 1/15/20.
//  Copyright © 2020 B Team Games. All rights reserved.
//
       
import SwiftUI

 struct ContentView: View {
    @EnvironmentObject var dState : DiceStates
    @EnvironmentObject var pState : PlayerStates
    @State private var rollCount = 0
    //player determines which player is currently active and dice values will be assigned to. Variable not currently in use
    @State private var player = 0

    var body: some View {
        ZStack {
            Image("Background").resizable().edgesIgnoringSafeArea(.all)
            
            VStack{
                Spacer()
                //Rollcount is for testing purposes
                Text("Roll Count " + String(self.dState.allDStates.RollCount))
                sixDice()
                 if self.dState.allDStates.RollCount < 3 {
                    //ToDo consolidate multiple rolls into single function
                    Button(action: {
                        self.dState.rollAll(theStates: self.dState.allDStates)},
                           label: {
                            Image("RollButton").renderingMode(.original).resizable().frame(width: 100, height: 60, alignment: .center)
                     }//End label
                        ) //End Button
                } else {
                    Button(action: {
                        self.trackValues(theDCount: self.dState.maxDice)
                        self.dState.resetAll()
                        self.resetPAll()
                    },
                           label: {
                            Image("SwordButton").renderingMode(.original).resizable().frame(width: 100, height: 60, alignment: .center)})//button close
                }// End Else
                
                //Following HStack is for testing purposes only
                HStack {
                    Text("ATK " + String(self.pState.attackPower))
                    Text("Coins " + String(self.pState.lootPoints))
                    Text("VP " + String(self.pState.victoryPoint))
                    Text("Health " + String(self.pState.healthPoints))
                }//End HStack
            }//End VStack
        }//End ZStack

     }
    
     func resetPAll(){
        //reset attackCount, onesCount, twosCount, and threesCount to 0
        self.pState.onesCount = 0
        self.pState.twosCount = 0
        self.pState.threesCount = 0
        self.pState.attackCount = 0
    }
    
    func trackValues(theDCount: Int) {
        self.dState.getFaces(dCount: theDCount)
        for value in self.dState.allFaces {
            switch value {
            case 1: self.pState.attackCount += 1
            case 2: if self.pState.healthPoints < 10 {self.pState.healthPoints += 1 }
            case 3: self.pState.lootPoints += 1
            case 4: self.pState.onesCount += 1
            case 5: self.pState.twosCount += 1
            case 6: self.pState.threesCount += 1
            default:
                break
            }
        }
        //Add values for victoryPoints
        if self.pState.onesCount >= 3 {
            self.pState.victoryPoint += (self.pState.onesCount - 3 + 1)
        }
        if self.pState.twosCount >= 3 {
            self.pState.victoryPoint += ((self.pState.twosCount - 3) + 2)
        }
        if self.pState.threesCount >= 3 {
            self.pState.victoryPoint += ((self.pState.threesCount - 3) + 3)
        }
        //Set Attack Power
        self.pState.attackPower = self.pState.attackCount
        //Reset dice variables and states
    }
    



 }

 struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(DiceStates()).environmentObject(PlayerStates())
    }
}
