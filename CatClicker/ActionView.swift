//
//  ActionView.swift
//  CatClicker
//
//  Created by Mason Z on 11/1/24.
//

import SwiftUI

struct ActionView: View {
    @State var loot =  [Symbol(image: "yarn", love: 20), Symbol(image: "food", love: 8), Symbol(image: "catnip", love: 5), Symbol(image: "wetCat", love: -20), Symbol(image: "expired", love: -12), Symbol(image: "litterBox", love: -5)]
    
    /*
     Yarn - Toy, Interaction, 20+ Love
     Food - Hospitality, Interaction, 15+ love
     Catnip - Stimulation Drug, 5+ Love & 5 Second Cumulative doubleUp
     
     Wet Cat - Shower, Interaction, -20 love (Cats hate it)
     Expired Food - Accidental Betrayal, Attack Interaction, -12 love
     Litter Box - Neglect emotion, nasty, -5 love
     */
    
    @Binding var symbol:String
    @Binding var love: Int
    @Binding var doubleUp: Bool
    
    // timer
    @Binding var timer: Int
    @Binding var timerEnd: Date?

    
    var body: some View {
        Button {
            if symbol == "hidden" { // if button is still "?" execute
                let s = loot.randomElement()
                
                symbol = s?.image ?? "hidden" // set background to new background
                
                love += doubleUp ? 2 * (s?.love ?? 0) : s?.love ?? 0 // add love xp depending on doubleUp condition
                
                // catnip functions - LASTS FOR or ADDS 5 SECOND EACH PRESS
                if symbol == "catnip" {
                    if timer == 0 { // timer not yet running
                        timer += 5
                        timerEnd = Date().addingTimeInterval(5)
                    } else if timerEnd! > Date() { // timer is running but not yet expired
                        timer += 5 // compounds - so take if you clicked it once, 5 seconds. Even if 3 seconds used, another press brings it to 10. Total 13s. 
                        timerEnd = Date().addingTimeInterval(5)
                    }
                }
            } // if code is "?" it indicates the button has been pressed
        } label: {
            Image(symbol)
                .resizable()
                .aspectRatio(1, contentMode: .fit)
                .cornerRadius(20)
        }
    }
}

#Preview {
    ActionView(symbol: Binding.constant("hidden"), love: Binding.constant(0), doubleUp: Binding.constant(false), timer: Binding.constant(0), timerEnd: Binding.constant(Date()))
}
