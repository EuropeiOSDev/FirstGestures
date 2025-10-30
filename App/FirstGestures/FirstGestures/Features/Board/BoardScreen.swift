//
//  BoardScreen.swift
//  FirstGestures
//
//  Created by Valery Shel on 30.10.2025.
//

import SwiftUI

struct BoardScreen: View {
  @State private var words: [AACWord] = []
  private let tts = TTSService()
  private let columns = Array(repeating: GridItem(.flexible(), spacing: 12), count: 3)

  var body: some View {
    Group {
      if words.isEmpty {
        // видимый плейсхолдер вместо "белого экрана"
        VStack(spacing: 12) {
          Text("No cards yet").font(.headline)
          Text("Make sure core_words.json is in the app bundle.")
            .multilineTextAlignment(.center)
            .foregroundStyle(.secondary)
          Button("Reload") { loadCatalog() }
            .buttonStyle(.bordered)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemBackground))
      } else {
        ScrollView {
          LazyVGrid(columns: columns, spacing: 12) {
            ForEach(words) { w in
              TileView(title: w.localizedTitle()) {
                tts.speak(w.localizedTitle())
              }
            }
          }
          .padding()
        }
      }
    }
    .navigationTitle(NSLocalizedString("board_title", comment: ""))
    .onAppear { if words.isEmpty { loadCatalog() } }
  }

  private func loadCatalog() {
    do { words = try JSONWordCatalog().load() }
    catch { print("Catalog error:", error.localizedDescription) }
  }
}
