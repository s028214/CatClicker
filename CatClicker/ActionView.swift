//
//  ActionView.swift
//  CatClicker
//
//  Created by Mason Z on 11/1/24.
//

import SwiftUI

struct ActionView: View {
    @State var loot =  [Symbol(image: "food", love: 15), Symbol(image: "expired", love: -10), Symbol(image: "catnip", love: 5)] // food - 15, expired -10, catnip 5
    
    @Binding var symbol:String
    @Binding var love: Int
    @Binding var doubleUp: Bool

    
    var body: some View {
        Button {
            if symbol == "hidden" { // if button is still "?" execute
                let s = loot.randomElement()
                
                symbol = s?.image ?? "hidden"
                
        
                if doubleUp == true {
                    love += 2 * (s?.love ?? 0)
                }
                
                else {
                    love += s?.love ?? 0
                }
                
                if symbol == "catnip" {
                    doubleUp = true
                    print("enabling")

                    DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                        doubleUp = false
                        print("disabling")
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
    ActionView(symbol: Binding.constant("hidden"), love: Binding.constant(0), doubleUp: Binding.constant(false))
}
