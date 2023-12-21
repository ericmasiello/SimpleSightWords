//
//  GameView.swift
//  SimpleSightWords
//
//  Created by Eric Masiello on 12/19/23.
//

import SwiftUI

struct GameView: View {
  @EnvironmentObject var gameStore: GameStore
  
  var body: some View {
    GradientView {
      VStack {
        if let activeCard = gameStore.activeCard {
          CardView(value: activeCard.value)
        } else {
          Text("No active card")
        }
        
        Button("I don't know it well yet") {
          gameStore.insertCardIntoDeck()
        }
        
        Button("I know it!") {
          gameStore.setNextActiveCard()
        }
        
        VStack {
          CardStackView(cards: gameStore.deck.asList)
        }
        .padding()
        
        Button("Restart Game") {
          gameStore.restartGame()
        }
      }
    }
  }
}

#Preview {
  let words = [
    "I",
    "It",
    "A",
    "Not",
    "One",
    "Two",
    "By",
    "Be",
    "Said",
    "Will",
    "On",
    "To",
  ]
  let gameStore = GameStore()
  gameStore.updateDeck(from: words)
  return GameView().environmentObject(gameStore)
}
