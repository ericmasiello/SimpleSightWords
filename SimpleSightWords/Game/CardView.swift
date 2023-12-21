//
//  CardView.swift
//  SimpleSightWords
//
//  Created by Eric Masiello on 12/20/23.
//

import SwiftUI

struct CardView: View {
  
  private let gradient = LinearGradient(
    gradient: Gradient(colors: [Color.red, Color.purple]),
    startPoint: .top,
    endPoint: .bottom
  )
  
  private let gradient2 = LinearGradient(
    gradient: Gradient(colors: [Color.purple, Color.red]),
    startPoint: .top,
    endPoint: .bottom
  )
  
  var value: String
  
  var body: some View {
    return ZStack {
      
      Group {
        Rectangle()
          .fill(gradient)
        Rectangle()
          .fill(gradient2)
          .opacity(0.25)
      }
        .frame(width: 320, height: 210)
        .cornerRadius(12)
      
      VStack {
        Spacer()
        VStack(alignment: .center) {
          Text(value.capitalized(with: Locale(identifier: "en-us")))
            .font(.largeTitle)
          
          if (value.lowercased() != "i") {
            Text(value.lowercased())
              .font(.title)
          }
          
        }.padding()
        
        .foregroundColor(.white)
        Spacer()
      }
    }
    .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 3)
    .frame(width: 320, height: 210)
    
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
  
  return VStack {
    CardView(value: "ACTIVE cards can get really long and wrap to new lines")
      .padding()
    CardView(value: "I")
      .padding()
    CardStackView(cards: cards)
  }
}
