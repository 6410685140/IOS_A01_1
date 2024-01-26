//
//  ContentView.swift
//  IOS_A01_1
//
//  Created by นายธนภัทร สาระธรรม on 19/1/2567 BE.
//

import SwiftUI

struct ContentView: View {
    @State var game = Game()
    @State var guess = Number()
    @State var showScore = false
    @State var miss = false
    @State var count = 0
    var body: some View {
        VStack {
            
            
            Text("Guess Number: ??? ")
            Text(guess.HL(High: game.target.Num))
            
            
            ColorSlider(value: $guess.Num, trackColor: .red)
            Text(guess.intString())
            
            
            
            
            Button("Hit Me!!!") {
                
                
                game.check(guess: guess)
                count = count + 1
                if game.score != 0 {
                    showScore = true
                }
                
            }
            
            
            .alert(isPresented: $showScore) {
                Alert(
                    
                    title: Text("Your Score"),
                    message: Text(String(count)),
                    dismissButton: .default(Text("OK")) {
                        guess = Number()
                        game.startNewGame()
                        count = 0
                    }
                    
                )
                
                
                
            }
            
            Text("R: \((game.target.Num))")
        }
        .padding()
    }
}

struct ColorSlider: View {
    @Binding var value: Double
    var trackColor: Color
    var body: some View {
        HStack {
            Text("0")
            Slider(value: $value)
                .accentColor(trackColor)
            Text("20")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
