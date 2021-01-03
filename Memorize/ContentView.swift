//
//  ContentView.swift
//  Memorize
//
//  Created by Seoyoung Kyung on 12/22/20.
//

import SwiftUI
    
struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    let maxSize = 10
    
    var body: some View {
        
        VStack {
            VStack {
                Text("Theme: \(viewModel.concept)")
                Text("Score: \(viewModel.score)")
            }.foregroundColor(viewModel.color)
        
            Grid(viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    withAnimation(.linear(duration: onTapAnimationDuration)) {
                        viewModel.choose(card: card)
                    }
                }
                .padding(5)
            }
            .padding()
            .foregroundColor(viewModel.color)
            
            Button(action: {
                withAnimation(.easeInOut) {
                    viewModel.resetGame()
                }
            })
            {
                HStack {
                    Text("New Game")
                }
                .padding(cornerRadius)
                .foregroundColor(viewModel.color)
                .overlay(
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(lineWidth: edgeLineWidth)
                        .foregroundColor(viewModel.color)
                )
            }
        }
    }
    
    // MARK: - Drawing Constants
    private let cornerRadius: CGFloat = 10.0
    private let edgeLineWidth: CGFloat = 2
    private let onTapAnimationDuration = 0.75
}


struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            body(for: geometry.size)
        }
    }
    
    @State private var animatedBonusRemaining: Double = 0
    
    private func startBonusTimeAnimation() {
        animatedBonusRemaining = card.bonusRemaining
        withAnimation(.linear(duration: card.bonusTimeRemaining)) {
            animatedBonusRemaining = 0
        }
    }
    
    @ViewBuilder
    private func body(for size: CGSize) -> some View {
        if card.isFaceUp || !card.isMatched {
            ZStack {
                Group {
                    if card.isConsumingBonusTime {
                        Pie(startAngle: startAngle, endAngle: Angle.degrees(-animatedBonusRemaining*360 - 90), clockwise: true)
                            .onAppear {
                                startBonusTimeAnimation()
                            }
                    } else {
                        Pie(startAngle: startAngle, endAngle: Angle.degrees(-card.bonusRemaining*360 - 90), clockwise: true)
                    }
                }.padding(5).opacity(0.4)
                Text(card.content)
                    .font(Font.system(size: fontSize(for: size)))
                    .rotationEffect(Angle.degrees(card.isMatched ? 360 : 0))
                    .animation(card.isMatched ? Animation.linear(duration: 1).repeatForever(autoreverses: false) : .default)
            }
            .cardify(isFaceUp: card.isFaceUp)
            
            //offset
            .transition(AnyTransition.scale)
        }
    }
    
    // MARK: - Drawing Constants
    private let startAngle = Angle.degrees(0 - 90)
    private let cornerRadius: CGFloat = 10.0
    private let edgeLineWidth: CGFloat = 3
    private let fontScaleFactor: CGFloat = 0.7
    private func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * fontScaleFactor
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: EmojiMemoryGame())
    }
}
