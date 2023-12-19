//
//  SimpleSightWordsApp.swift
//  SimpleSightWords
//
//  Created by Eric Masiello on 12/17/23.
//

import SwiftUI

// TODO: this needs to be fed from settings
let words = ["Now", "One", "When", "Two", "Three", "Something Else"]

@main
struct SimpleSightWordsApp: App {
  
    let gameStore = GameStore(from: words)
  
    var body: some Scene {
        WindowGroup {
            HomeView()
            .environmentObject(gameStore)
        }
    }
}
