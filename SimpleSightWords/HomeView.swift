//
//  HomeView.swift
//  SimpleSightWords
//
//  Created by Eric Masiello on 12/19/23.
//

import SwiftUI

struct HomeView: View {
  @State var selectedTab = 0
  
  
  var body: some View {
    TabView(selection: $selectedTab) {
      GameView()
      .tabItem {
        VStack {
          Image(systemName: "rectangle.dock")
          Text("Game")
        }
      }
      .tag(0)
      
      SettingsView()
      .tabItem {
        VStack {
          Image(systemName: "gear")
          Text("Settings")
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
  return HomeView().environmentObject(gameStore)
}
