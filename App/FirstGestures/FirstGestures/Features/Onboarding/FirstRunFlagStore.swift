//
//  FirstRunFlagStore.swift
//  FirstGestures
//
//  Created by Valery Shel on 30.10.2025.
//

import Foundation
struct FirstRunFlagStore {
  private let key = "hasOnboarded"
  var hasOnboarded: Bool { UserDefaults.standard.bool(forKey: key) }
  func setDone() { UserDefaults.standard.set(true, forKey: key) }
}
