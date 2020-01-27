//
//  ContentView.swift
//  RollAndTrack
//
//  Created by Jason Bice on 1/15/20.
//  Copyright © 2020 B Team Games. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    //ToDo Use a mapping to hold all of the dice variables and implement a for loop on the roll button.
    @State private var dice1Lock = false
    @State private var dice2Lock = false
    @State private var dice3Lock = false
    @State private var dice4Lock = false
    @State private var dice5Lock = false
    @State private var dice6Lock = false

    @State private var allDice: [String : Int] = ["dice1" : 0, "dice2" : 0, "dice3" : 0, "dice4" : 0, "dice5" : 0, "dice6" : 0 ]
    
    // rollCount determines what actions are available based on how many times a player has rolled.
    @State private var rollCount = 0
    //player determines which player is currently active and dice values will be assigned to.
    @State private var player = 0
    /*Multiple values track a players various point values: victoryPoints, healthPoints, lootPoints
     TODO: these point values are tracked but can not be used for any purpose in this version of the app. Later versions will use these values to determine if players have won the game or if players are able to purchase items from a market place.
    */
    @State private var victoryPoints = 0
    @State private var onesCount = 0
    @State private var twosCount = 0
    @State private var threesCount = 0
    @State private var healthPoints = 6 //artificially set to low value for testing.
    @State private var lootPoints = 0
    
    @State private var attackPower = 0
    @State private var attackCount = 0
    
    //ToDo - Modularize the main body into reuseable blocks
    var body: some View {
        VStack{
            
            Spacer()
            Text("Roll Count \(rollCount)")
            HStack {
                //dice1
                Dice(diceFace: allDice["dice1"] ?? 0, isLocked: $dice1Lock, rolling: $rollCount)
                Dice(diceFace: allDice["dice2"] ?? 0, isLocked: $dice2Lock, rolling: $rollCount)
                Dice(diceFace: allDice["dice3"] ?? 0, isLocked: $dice3Lock, rolling: $rollCount)
                Dice(diceFace: allDice["dice4"] ?? 0, isLocked: $dice4Lock, rolling: $rollCount)
                Dice(diceFace: allDice["dice5"] ?? 0, isLocked: $dice5Lock, rolling: $rollCount)
                Dice(diceFace: allDice["dice6"] ?? 0, isLocked: $dice6Lock, rolling: $rollCount)
                
            }
            
            if self.rollCount < 3 {
                Button(action: {
                    self.diceRoll(lockStatus: self.dice1Lock, diceNumber: &(self.allDice["dice1"])!)
                    self.diceRoll(lockStatus: self.dice2Lock, diceNumber: &(self.allDice["dice2"])!)
                    self.diceRoll(lockStatus: self.dice3Lock, diceNumber: &(self.allDice["dice3"])!)
                    self.diceRoll(lockStatus: self.dice4Lock, diceNumber: &(self.allDice["dice4"])!)
                    self.diceRoll(lockStatus: self.dice5Lock, diceNumber: &(self.allDice["dice5"])!)
                    self.diceRoll(lockStatus: self.dice6Lock, diceNumber: &(self.allDice["dice6"])!)
                    self.rollCount += 1
                    },
                    
                    label: { Image("RollButton").renderingMode(.original).resizable().frame(width: 100, height: 60, alignment: .center)
                        
                }
                    )
            } else {
                Button(action: {
                    //Track values to each of player point types and attack power variables
                    for (_, value) in self.allDice {
                        if value == 1 {
                            self.attackCount += 1
                        }
                        if value == 2 && self.healthPoints < 10 {
                            self.healthPoints += 1
                        }
                        if value == 3 {
                            self.lootPoints += 1
                        }
                        if value == 4 {
                            self.onesCount += 1
                        }
                        if value == 5 {
                            self.twosCount += 1
                        }
                        if value == 6 {
                            self.threesCount += 1
                        }
                    }
                    //Add values for victoryPoints
                    if self.onesCount >= 3 {
                        self.victoryPoints += (self.onesCount - 3 + 1)
                    }
                    if self.twosCount >= 3 {
                        self.victoryPoints += ((self.twosCount - 3) + 2)
                    }
                    if self.threesCount >= 3 {
                        self.victoryPoints += ((self.threesCount - 3) + 3)
                    }
                    //Set Attack Power
                    self.attackPower = self.attackCount
                    
                    //reset all dice faces to zero
                    //Todo - function for resetting all values at once
                    self.allDice["dice1"] = 0
                    self.allDice["dice2"] = 0
                    self.allDice["dice3"] = 0
                    self.allDice["dice4"] = 0
                    self.allDice["dice5"] = 0
                    self.allDice["dice6"] = 0
                    //reset roll count to 0
                    self.rollCount = 0
                    //reset attackCount, onesCount, twosCount, and threesCount to 0
                    self.onesCount = 0
                    self.twosCount = 0
                    self.threesCount = 0
                    self.attackCount = 0
                    // reset all lock states
                    self.dice1Lock = false
                    self.dice2Lock = false
                    self.dice3Lock = false
                    self.dice4Lock = false
                    self.dice5Lock = false
                    self.dice6Lock = false
                    
                    
                }//action close
                    , label: {
                        Image("SwordButton").renderingMode(.original).resizable().frame(width: 100, height: 60, alignment: .center)
                        
                }//label close
                )//button close
            }
            //Following HStack is for testing purposes only
            //Observe that the dice states are properly tracked for future game interaction
            HStack {
                Text("ATK " + String(self.attackPower))
                Text("Coins " + String(self.lootPoints))
                Text("VP " + String(self.victoryPoints))
                Text("Health " + String(self.healthPoints))
            }
        }
        
    }
    func diceRoll(lockStatus: Bool, diceNumber: inout Int) {
        if lockStatus == false {
            diceNumber = Int.random(in: 1...6)
        }
    }
    

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}