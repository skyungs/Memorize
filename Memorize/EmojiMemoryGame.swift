//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Seoyoung Kyung on 12/23/20.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    var themeModel: Theme
    @Published private var gameModel: MemoryGame<String>
    
    init() {
        themeModel = Theme()
        gameModel = EmojiMemoryGame.createMemoryGame(with: themeModel)
    }
    
    static func createMemoryGame(with: Theme) -> MemoryGame<String> {
        let emojis = with.emojis.shuffled()
        let nCards = Int.random(in: 2..<emojis.count)
        return MemoryGame<String>(numberOfPairsOfCards: nCards) { pairIndex in
            return emojis[pairIndex] }
    }
    
    //Mark: - Access to the Model
    
    var cards: Array<MemoryGame<String>.Card> {
        gameModel.cards
    }
    
    var concept: String {
        themeModel.concept
    }
    
    var color: Color {
        themeModel.color
    }
    
    var score: Int {
        gameModel.score
    }
    
    //Mark: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        objectWillChange.send()
        gameModel.choose(card: card)
    }
    
    func resetGame() {
        objectWillChange.send()
        themeModel = Theme()
        gameModel = EmojiMemoryGame.createMemoryGame(with: themeModel)
    }
}
