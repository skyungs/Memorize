//
//  Theme.swift
//  Memorize
//
//  Created by Seoyoung Kyung on 12/28/20.
//

import Foundation
import SwiftUI

struct Theme {
    private(set) var concept: String = String()
    private(set) var emojis: Array<String> = Array<String>()
    private(set) var color: Color = Color.white
    private var themes: [String : Array<String>] = [String : Array<String>]()
    
    mutating func createTheme(){
        themes["Spring"] = ["💐", "🌷", "🌸", "🌹", "🌺", "🌻", "🌼", "🌿", "🌱"]
        themes["Summer"] = ["🌞", "⛱", "🍉", "🏄🏽‍♀️", "🌊", "🐚", "⛵️", "🦀", "🎆"]
        themes["Fall"] = ["🍁", "🍂", "🍃", "🎃", "🍬", "👻", "🦹🏻‍♀️", "🧙🏼‍♀️", "🧟‍♀️"]
        themes["Winter"] = ["⛄️", "❄️", "🏂", "⛷", "🗻", "🎅🏻", "🦌", "🎄", "🎉"]
        themes["Animals"] = ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐨"]
        // emojis["flags"] = ["🇧🇩", "🇧🇪", "🇧🇷", "🇫🇮", "🇬🇷", "🇬🇭", "🇲🇽", "🇰🇷", "🇿🇦"]
    }
    
    private mutating func addTheme(theme: String, emojis: Array<String>) {
        themes[theme] = emojis
    }
    
    private mutating func chooseConcept() {
        concept = Array(themes.keys)[Int.random(in: 0..<themes.count)]
        emojis = themes[concept]!
    }
    
    private mutating func chooseColor() {
        switch concept {
        case "Spring":
            color = Color.green
        case "Summer":
            color = Color.blue
        case "Fall":
            color = Color.orange
        case "Winter":
            color = Color.red
        case "Animals":
            color = Color.black
        default:
            color = Color.purple
        }
    }
    
    init() {
        createTheme()
        addTheme(theme: "Flags", emojis: ["🇧🇩", "🇧🇪", "🇧🇷", "🇫🇮", "🇬🇷", "🇬🇭", "🇲🇽", "🇰🇷", "🇿🇦"])
        chooseConcept()
        chooseColor()
    }
    
}
