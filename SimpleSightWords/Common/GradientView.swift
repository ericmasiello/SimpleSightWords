//
//  GradientView.swift
//  SimpleSightWords
//
//  Created by Eric Masiello on 12/21/23.
//

import SwiftUI

// Primary (with added Hot Magenta)
let electricCyan = Color(red: 0, green: 1.0, blue: 1.0)
let radicalRose = Color(red: 1.0, green: 0, blue: 1.0)
let hotMagenta = Color(red: 1.0, green: 0, blue: 0.4) // Added hot pink
let toxicLime = Color(red: 0.56, green: 0.87, blue: 0)
let solarFlareOrange = Color(red: 1.0, green: 0.6, blue: 0)
let ultraviolet = Color(red: 0.4, green: 0, blue: 1.0)

// Secondary (with Neon Purple)
let midnightTeal = Color(red: 0, green: 0.2, blue: 0.4)
let gunmetalGrey = Color(red: 0.2, green: 0.2, blue: 0.2)
let graphiteBlack = Color(red: 0.13, green: 0.13, blue: 0.13)
let neonPurple = Color(red: 1.0, green: 0.2, blue: 1.0) // Added neon purple
let holographicSilver = Color(red: 0.94, green: 0.94, blue: 0.94)

// Tertiaries (with Sakura Glow)
let seafoamGlow = Color(red: 0.47, green: 0.82, blue: 0.8)
let lavenderDust = Color(red: 0.85, green: 0.7, blue: 0.82)
let sakuraGlow = Color(red: 1.0, green: 0.85, blue: 0.95) // Added soft pink
let blushNeon = Color(red: 1.0, green: 0.94, blue: 0.94)
let pastelGlitch = Color(red: 1.0, green: 1.0, blue: 0.8)
let periwinkleHaze = Color(red: 0.69, green: 0.77, blue: 1.0)

struct GradientView<Content: View>: View {
  
  
  
  let gradient = LinearGradient(colors: [.orange, .green],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing)
  
  
  /// Duotone Pulse (Animated) with hot pink
//  let duotonePulse = Animation.easeInOut(duration: 2).repeatForever(autoreverses: true)
//      .value(Gradient(colors: [electricCyan, hotMagenta]))

  // Rainbow Spectrum with added hot pink
  let rainbowSpectrum = Gradient(colors: [
      electricCyan,
//      radicalRose,
      hotMagenta, // Added hot pink
//      toxicLime,
//      solarFlareOrange,
      ultraviolet
  ])

  // Neon Sunset with neon purple
  let neonSunset = Gradient(colors: [
      solarFlareOrange,
      neonPurple, // Replaced plasma purple with neon purple
      ultraviolet
  ])

  
  // The content closure to capture child views
  let content: () -> Content
  
  var body: some View {
    // Arrange the child views within your custom layout
    ZStack {
//      rainbowSpectrum.ignoresSafeArea().opacity(0.35)
      Rectangle().fill(rainbowSpectrum).ignoresSafeArea().opacity(0.35)
      content() // Embed the child views here
    }
  }
}

#Preview {
  GradientView {
    Text("Hello world")
  }
}
