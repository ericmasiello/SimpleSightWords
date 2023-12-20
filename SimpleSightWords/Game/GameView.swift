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
    
    VStack {
      if let activeCard = gameStore.activeCard {
        Text("Active card **\(activeCard.value)**")
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
        
        ForEach(gameStore.deck.asList) { card in
          Text("\(card.value)")
        }
      }
      .padding()
      
      Button("Restart Game") {
        // TODO figure out a way to save the cards and rehydrate w/ the same deck
        gameStore.restartGame()
      }
    }
    
    
  }
}

#Preview {
  let words = ["Now", "One", "When", "Two", "Three", "What"]
  let gameStore = GameStore()
  gameStore.updateDeck(from: words)
  return GameView().environmentObject(gameStore)
}
