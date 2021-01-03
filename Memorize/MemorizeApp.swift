//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Seoyoung Kyung on 12/22/20.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
