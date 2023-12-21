//
//  SimpleSightWordsApp.swift
//  SimpleSightWords
//
//  Created by Eric Masiello on 12/17/23.
//

import SwiftUI

@main
struct SimpleSightWordsApp: App {
  @AppStorage("questions")  var questions = ""
  
  var questionsAsList: [String] {
    get {
      questions.split(separator: "\n").map { String($0 )}
    }
  }
  
  let gameStore = GameStore()
  
  var body: some Scene {
    WindowGroup {
//      DemoTabView()
      HomeView()
        .environmentObject(gameStore)
        .onAppear(perform: {
          gameStore.updateDeck(from: questionsAsList)
        })
      
    }
  }
}
