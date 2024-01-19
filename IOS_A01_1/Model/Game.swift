//
//  Game.swift
//  IOS_A01_1
//
//  Created by นายธนภัทร สาระธรรม on 19/1/2567 BE.
//

import Foundation

struct Game {
    var target = Number.random()
    var score = 0
    
    
    mutating func check(guess: Number) {
        let difference = lround(guess.difference(target: target))
        
        score = difference
    }
    
    mutating func startNewGame() {
        score = 0
        target = Number.random()
    }
}
