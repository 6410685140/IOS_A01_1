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
    @State var Buttontrue = false
    var body: some View {
        
        VStack {
            Spacer()
                .frame(width: 10)
            
            
            Text("Guess Number:  ??? ")
                .foregroundColor(.yellow)
                .font(.title)
            Spacer()
                .frame(width: 10)
            
            
            
            ColorSlider(value: $guess.Num, trackColor: .blue)
                .padding()
            
            Text(guess.intString())
                .foregroundColor(.green)
            Spacer()
                .frame(width: 10)
            Button("Hit Me!!!") {
                game.check(guess: guess)
                count = count + 1
                Buttontrue = true
                if game.score != 0 {
                    showScore = true
                }
            }
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [.yellow, .orange, .red]), startPoint: .topLeading,
                                       endPoint: .bottomTrailing))
            .foregroundColor(.black)
            .cornerRadius(10)
            
            .alert(isPresented: $Buttontrue) {
                if showScore {
                    return Alert(
                        title: Text("Your Score"),
                        message: Text(String(count)),
                        dismissButton: .default(Text("OK")) {
                            guess = Number()
                            game.startNewGame()
                            count = 0
                            showScore = false
                        }
                    )
                }
                else {
                    return Alert(
                        title: Text(String(Int(guess.Num * 50)))
                            .foregroundColor(.green),
                        message: Text(guess.HL(High: game.target.Num)),
                        dismissButton: .default(Text("OK")) {
                        }
                    )
                }
                
                
            }
            Spacer()
                .frame(width: 10)
        }
        .padding()
        .background(LinearGradient(gradient: Gradient(colors: [.black, .gray]), startPoint: .topLeading,
            endPoint: .bottomTrailing))
        .edgesIgnoringSafeArea(.all)
        
        Spacer()
            .frame(width: 20)
        
    }
}

struct ColorSlider: View {
    @Binding var value: Double
    var trackColor: Color
    var body: some View {
        HStack {
            Text("0")
                .foregroundColor(.green)
            Slider(value: $value)
                .accentColor(trackColor)
            Text("50")
                .foregroundColor(.green)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
