//
//  OnboardingView.swift
//  FirstGestures
//
//  Created by Valery Shel on 30.10.2025.
//

import SwiftUI

struct OnboardingView: View {
  var onFinish: () -> Void

  var body: some View {
    ZStack {
      // читаемый светлый фон (а не прозрачный)
      LinearGradient(
        colors: [Color(.systemBackground), Color(.secondarySystemBackground)],
        startPoint: .top, endPoint: .bottom
      )
      .ignoresSafeArea()

      VStack(spacing: 20) {
        Text(NSLocalizedString("onb_title", comment: ""))
          .font(.largeTitle).bold()
          .multilineTextAlignment(.center)

        Text(NSLocalizedString("onb_subtitle", comment: ""))
          .font(.body)
          .multilineTextAlignment(.center)

        Spacer(minLength: 24)

        Button(NSLocalizedString("onb_finish", comment: "")) { onFinish() }
          .buttonStyle(.borderedProminent)
          .tint(.blue)            // явный цвет кнопки на светлом фоне
          .controlSize(.large)
      }
      .padding(24)
      .frame(maxWidth: 520)
      .foregroundStyle(.primary)  // тёмный текст в светлой схеме
    }
  }
}
