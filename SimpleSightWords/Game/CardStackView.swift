//
//  CardStackView.swift
//  SimpleSightWords
//
//  Created by Eric Masiello on 12/20/23.
//

import SwiftUI

struct CardStackView: View {
  var cards: [FlashCard]
  var body: some View {
    ZStack {
      ForEach(Array(cards.enumerated()), id: \.element.id) { (index, card) in
        // using an offset to give the cards depth
        CardView(value: card.value)
          .offset(CGSize(width: Double(Double(index) * -0.4), height: Double(Double(index) * -1.2)))
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
  
  let cards = words.map { FlashCard(value: $0) }
  
  return CardStackView(cards: cards)
}
