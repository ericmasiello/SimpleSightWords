//
//  SettingsView.swift
//  SimpleSightWords
//
//  Created by Eric Masiello on 12/19/23.
//

import SwiftUI

struct SettingsView: View {
  
  @AppStorage("questions")  var questions = ""
  @EnvironmentObject var gameStore: GameStore
  
  var questionsAsList: [String] {
    get {
      let arr = questions.split(separator: "\n").map { String($0 )}
      
      return arr
    }
  }
  
  var body: some View {
    GradientView {
      List {
        Text("Settings")
          .font(.largeTitle)
          .padding(.bottom, 8)
        
        Section(header: Text("Questions")) {
          TextEditor(text: $questions)
            .frame(minHeight: 100)
        }
        
        Section(header: Text("Debug")) {
          ForEach(questionsAsList, id: \.self) { value in
            Text(value)
          }
        }
        
        Button("Update Game") {
          gameStore.updateDeck(from: questionsAsList)
        }
      }.scrollContentBackground(.hidden)
    }
  }
}

#Preview {
  SettingsView()
}
