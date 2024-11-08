//
//  ContentView.swift
//  CatClicker
//
//  Created by Mason Z on 10/30/24.
//

import SwiftUI

struct ContentView: View {

    @State var doubleUp = false
    @State var loot =  [Symbol(image: "food", love: 10), Symbol(image: "expired", love: -10), Symbol(image: "catnip", love: 0)]
    @State var symbol = ["hidden", "hidden", "hidden", "hidden", "hidden", "hidden"]
    @State var love: Int = 0 // 10 - 1%
    @State var roll: Bool = false // no action button have been clicked
   
    var body: some View {
        
        // background
        ZStack {
            Rectangle()
                .foregroundColor(Color.backgroundBlue)
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                
                // lvl
                HStack {
                    Text("❤️ : " + String(love/10) + "%")
                        .font(.custom("Helvetica Neue Thin", size: 30))
                        .bold()
                        .padding(.all, 10)
                        .background(Color.viewWhite)
                        .cornerRadius(20)
                }.padding(.horizontal)
                
                Spacer()
                
                // clicky cat
                Button {
                    if doubleUp == true {
                        love += 1
                    }
                    love += 1
                } label: {
                    Image("catInvis")
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .cornerRadius(20)
                        .background(Color.buttonWhite)
                        .cornerRadius(20)
                }.padding(.horizontal)
                
                Spacer()
                
                // Action - Loot
                VStack {
                    HStack {
                        ActionView(symbol: $symbol[0], love: $love, doubleUp: $doubleUp)
                        ActionView(symbol: $symbol[1], love: $love, doubleUp: $doubleUp)
                        ActionView(symbol: $symbol[2], love: $love, doubleUp: $doubleUp)
                    }
                    HStack {
                        ActionView(symbol: $symbol[3], love: $love, doubleUp: $doubleUp)
                        ActionView(symbol: $symbol[4], love: $love, doubleUp: $doubleUp)
                        ActionView(symbol: $symbol[5], love: $love, doubleUp: $doubleUp)
                    }
                }
                .padding(.horizontal)
                
                Spacer()
                
                // Reroll
                HStack {
                    Button {
                        symbol = ["hidden", "hidden", "hidden", "hidden", "hidden", "hidden"] // reset
                    } label: {
                        Image("reroll")
                            .resizable()
                            .frame(width: 50, height: 50)
                          
                        Text("reroll")
                            .bold()
                            .padding(.horizontal)
                    }
                    .background(Color.viewWhite)
                    .cornerRadius(20)
                } 
                
                Button {
                    if doubleUp {
                        // Disable double up
                        doubleUp = false
                    } else {
                        // Enable double up for 5 seconds
                        doubleUp = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                            doubleUp = false
                        }
                    }
                } label: {
                    Text(doubleUp ? "Double Up Active" : "Double Up")
                        .font(.headline)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
               
            }
        }
    }
}

#Preview {
    ContentView()
}
