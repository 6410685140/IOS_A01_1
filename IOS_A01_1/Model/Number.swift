//
//  RGB.swift
//  IOS_A01_1
//
//  Created by นายธนภัทร สาระธรรม on 19/1/2567 BE.
//

import Foundation
import SwiftUI

struct Number {
    
    var Num = 0.5
    
    
    static func random() -> Number {
        var number1 = Number()
        number1.Num = Double.random(in: 0...50)
        return number1
    }

    func difference(target: Number) -> Double {
        var n_Diff = Num * 50.0 - target.Num
        if n_Diff < 0 {
            n_Diff = 0 - n_Diff
        }

        if n_Diff < 1 {
            return 1
        }
        return 0
        }
    
    func intString() -> String {
        "R: \(Int(Num * 50))"
    }
    
    func  HL(High: Double) -> String {
        if Num * 50.0 > High {
            
            return "< HIGH !"
        }
        
        return "> LOW !"
    }
}
