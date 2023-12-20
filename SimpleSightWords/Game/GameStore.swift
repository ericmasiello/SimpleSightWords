//
//  LearningStore.swift
//  SimpleSightWords
//
//  Created by Eric Masiello on 12/17/23.
//

import Foundation

struct FlashCard: Identifiable {
  let id = UUID()
  var value: String
  var isActive = true
}

class FlashDeck: ObservableObject {
  @Published private var cards: [FlashCard]
  
  init(from sightWords: [String]) {
    cards = sightWords.map { FlashCard(value: $0, isActive: true) }
  }
  
  func shuffle() {
    cards.shuffle()
  }
  
  func peek() -> FlashCard? {
    return cards.last
  }
  
  func pop() {
    cards.removeLast()
  }
  
  func reinsert(card currentCard: FlashCard) {
    if cards.count < 1 {
      return
    }
    else if cards.count < 2 {
      cards.insert(currentCard, at: cards.count - 1)
    } else {
      cards.insert(currentCard, at: cards.count - 2)
    }
  }
  
  var asList: [FlashCard]  {
    get {
      self.cards.reversed()
    }
  }
  
  var count: Int {
    get {
      cards.count
    }
  }
}

class GameStore: ObservableObject {
  @Published var deck = FlashDeck(from: [])
  
  private var initialDeck: [String] = []
  
  @Published var activeCard: FlashCard? = nil
  
  func setNextActiveCard() -> Void {
    activeCard = deck.peek()
    
    if activeCard != nil {
      deck.pop()
    }
  }
  
  func insertCardIntoDeck() -> Void {
    
    guard deck.count > 0 else {
      return
    }
    
    guard let card = activeCard else {
      return
    }
    
    // reset the active card
    activeCard = nil
    
    // move the activeCard back into the deck toward the top
    deck.reinsert(card: card)
    
    // get the next card / sets the active card
    setNextActiveCard()
  }
  
  func restartGame() {
    self.deck = FlashDeck(from: initialDeck.shuffled())
    self.setNextActiveCard()
  }
  
  func updateDeck(from deck: [String]) {
    initialDeck = deck
    self.deck = FlashDeck(from: deck)
    self.setNextActiveCard()
  }
}
