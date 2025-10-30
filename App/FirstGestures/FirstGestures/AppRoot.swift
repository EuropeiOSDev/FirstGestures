//
//  AppRoot.swift
//  FirstGestures
//
//  Created by Valery Shel on 30.10.2025.
//

import SwiftUI

struct AppRoot: View {
  @State private var hasOnboarded = FirstRunFlagStore().hasOnboarded

  var body: some View {
    NavigationStack {
      if hasOnboarded {
        BoardScreen()
      } else {
        OnboardingView {
          FirstRunFlagStore().setDone()
          hasOnboarded = true
        }
      }
    }
  }
}
