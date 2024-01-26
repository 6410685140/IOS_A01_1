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
    @State var count = 0

    var body: some View {
        VStack {
            Text("Guess Number: ??? ")
                .foregroundColor(.blue)
                .font(.title)
            Text("")
            
            Text(guess.HL(High: game.target.Num))
                .foregroundColor(.purple)
            
            ColorSlider(value: $guess.Num, trackColor: .red)
                .padding()
            
            Text(guess.intString())
                .foregroundColor(.green)
            
            Button("Hit Me!!!") {
                game.check(guess: guess)
                count = count + 1
                if game.score != 0 {
                    showScore = true
                }
            }
            .padding()
            .background(Color.orange)
            .foregroundColor(.white)
            .cornerRadius(10)
            
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
        }
        .padding()
        .background(LinearGradient(gradient: Gradient(colors: [.yellow, .pink]), startPoint: .topLeading, endPoint: .bottomTrailing))
        .edgesIgnoringSafeArea(.all)
    }
}

struct ColorSlider: View {
    @Binding var value: Double
    var trackColor: Color
    var body: some View {
        HStack {
            Text("0")
                .foregroundColor(.blue)
            Slider(value: $value)
                .accentColor(trackColor)
            Text("20")
                .foregroundColor(.blue)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
