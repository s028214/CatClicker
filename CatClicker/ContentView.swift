//
//  ContentView.swift
//  CatClicker
//
//  Created by Mason Z on 10/30/24.
//

import SwiftUI

// music dependencies
import AVFoundation
var player: AVAudioPlayer!


struct ContentView: View {
    @State private var isMuted = false // track mute or unmute
    
    @State var doubleUp = false
    @State var symbol = ["hidden", "hidden", "hidden", "hidden", "hidden", "hidden"]
    @State var love: Int = 0 // 10 - 1%
    @State var roll: Bool = false // no action button have been clicked
    
    // timer
    @State private var timer = 0
    @State private var timerEnd: Date? // set date of when it should end
    
    var clickyCatColor: Color {
        doubleUp ?  Color.yellow : Color.buttonWhite
    }
    
    var body: some View {
        ZStack {
            // background
            Rectangle()
                .foregroundColor(Color.backgroundBlue)
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                HStack(alignment: .center) {
                    Text("❤️ : " + String(love/10) + "%")
                        .font(.custom("Helvetica Neue Thin", size: 30))
                        .bold()
                        .padding(.all, 10)
                        .background(Color.viewWhite)
                        .cornerRadius(20)
                }
                
                
                
                Spacer()
                
                // clicky cat - adds 1
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
                        .background(clickyCatColor)
                        .cornerRadius(20)
                }.padding(.horizontal)
                
                Spacer()
                
                // Action - Loot
                VStack {
                    HStack {
                        ActionView(symbol: $symbol[0], love: $love, doubleUp: $doubleUp, timer: $timer, timerEnd: $timerEnd)
                        ActionView(symbol: $symbol[1], love: $love, doubleUp: $doubleUp, timer: $timer, timerEnd: $timerEnd)
                        ActionView(symbol: $symbol[2], love: $love, doubleUp: $doubleUp, timer: $timer, timerEnd: $timerEnd)
                    }
                    HStack {
                        ActionView(symbol: $symbol[3], love: $love, doubleUp: $doubleUp, timer: $timer, timerEnd: $timerEnd)
                        ActionView(symbol: $symbol[4], love: $love, doubleUp: $doubleUp, timer: $timer, timerEnd: $timerEnd)
                        ActionView(symbol: $symbol[5], love: $love, doubleUp: $doubleUp, timer: $timer, timerEnd: $timerEnd)
                    }
                }
                .onReceive(Timer.publish(every: 0.05, on: .main, in: .common).autoconnect()) { _ in
                    doubleUp = timer != 0 // Update doubleUp based on timer
                    
                    // debug print(doubleUp)
                    if let timerEnd = timerEnd, timerEnd <= Date() { // if timerEnd is has reached current time.
                        timer = 0
                        // debug print (doubleUp)
                    }
                }
                .padding(.horizontal)
                /*
                 .onReceive - Adds an action to perform when this view detects data emitted by the given publisher.
                 Checks every 0.05 of a second - RESOURCE INTENSIVE
                 
                 https://developer.apple.com/documentation/foundation/timer/3329589-publish
                 */
                
                Spacer()
            
                // mute + reroll
                HStack {
                    // mute & unmute
                    Button {
                        isMuted.toggle()
                        mutePlayer()
                    } label: {
                        Image(systemName: isMuted ? "speaker.slash.fill" : "speaker.3.fill")
                        /* sf symbols
                         https://github.com/andrewtavis/sf-symbols-online
                         */
                            .font(.system(size: 24))
                            .padding(10)
                    }
                    .background(Color.viewWhite)
                    .cornerRadius(20)
                   
                    // reroll
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
            }  
            .onAppear {
                playSound()
            }
        }
    }
    
    // music func taken from Sound Experiment project
    
    // mute
    func mutePlayer() {
        if let player = player {
            player.volume = isMuted ? 0.0 : 1.0
        }
    }

    // play
    func playSound() {
        let url = Bundle.main.url(forResource: "elevator", withExtension: "mp3")

        guard let url = url else {
            return
        }

        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
            player?.numberOfLoops = -1
        } catch {
            print("error playing audio: \(error)")
        }
    }
    
}

#Preview {
    ContentView()
}
