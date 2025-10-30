//
//  AACWord.swift
//  FirstGestures
//
//  Created by Valery Shel on 30.10.2025.
//

import Foundation
struct AACWord: Identifiable, Codable {
  var id: String { key }
  let key: String
  let labels: [String:String]
  let symbolName: String
  let isCore: Bool
  let isFree: Bool
  let displayOrder: Int
  func localizedTitle(locale: Locale = .current) -> String {
    let code = locale.language.languageCode?.identifier ?? "en"
    return labels[code] ?? labels["en"] ?? key.capitalized
  }
}
