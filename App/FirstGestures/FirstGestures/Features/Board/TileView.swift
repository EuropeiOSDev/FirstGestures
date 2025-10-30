//
//  TileView.swift
//  FirstGestures
//
//  Created by Valery Shel on 30.10.2025.
//

import SwiftUI

struct TileView: View {
  let title: String
  let action: () -> Void
  var body: some View {
    Button(action: action) {
      VStack(spacing: 8) {
        // временно без иконок — добавим позже
        Text(title).font(.title3).multilineTextAlignment(.center).frame(maxWidth: .infinity)
      }
      .padding().frame(height: 96)
      .background(.ultraThinMaterial).clipShape(RoundedRectangle(cornerRadius: 16))
    }.buttonStyle(.plain)
  }
}
