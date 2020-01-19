//
//  Dice.swift
//  RollAndTrack
//
//  Created by Jason Bice on 1/15/20.
//  Copyright © 2020 B Team Games. All rights reserved.
//

import SwiftUI

struct Dice: View {
    var diceFace: Int
    @Binding var isLocked : Bool
    @Binding var rolling: Int
    var body: some View {
        
        // all lock states set to false in content view will later move this functionality
        Button(action: { if self.rolling != 0 {
            self.isLocked.toggle()}
            
        }, label: {
            if isLocked == true {
                ZStack {
                    Image("DiceSide0" + String(diceFace)).renderingMode(.original).resizable().frame(width: 60, height: 60)
                    if self.rolling != 3 { Image("DiceLock").renderingMode(.original).resizable().frame(width: 20, height: 20).padding(.bottom, 38).padding(.trailing, 38)
                    }
                    
                }
                
            } else {
                Image("DiceSide0" + String(diceFace)).renderingMode(.original).resizable().frame(width: 60, height: 60)
                }
            }
        ) //Button close
}
                
struct Dice_Previews: PreviewProvider {
    @State static var myCoolBool = false
    @State static var myRollCount = 0
    
    static var previews: some View {
        Dice(diceFace: Int.random(in: 1...6), isLocked: $myCoolBool, rolling: $myRollCount)
    }
}
}
