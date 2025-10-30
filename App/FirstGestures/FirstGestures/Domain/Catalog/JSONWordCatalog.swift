//
//  JSONWordCatalog.swift
//  FirstGestures
//
//  Created by Valery Shel on 30.10.2025.
//

import Foundation

final class JSONWordCatalog {

  enum CatalogError: Error {
    case notFound
  }

  func load() throws -> [AACWord] {
    let url = try findResourceURL()
    let data = try Data(contentsOf: url)
    var words = try JSONDecoder().decode([AACWord].self, from: data)
    words.sort { $0.displayOrder < $1.displayOrder }
    return words
  }

  // Ищем в корне бандла и в подпапках (если папка была добавлена как "blue folder")
  private func findResourceURL() throws -> URL {
    let fm = FileManager.default
    // 1) Прямо в корне бандла
    if let url = Bundle.main.url(forResource: "core_words", withExtension: "json") {
      return url
    }
    // 2) В любой подпапке бандла
    if let bundlePath = Bundle.main.resourcePath,
       let enumerator = fm.enumerator(atPath: bundlePath) {
      for case let path as String in enumerator {
        if path.hasSuffix("/core_words.json") || path == "core_words.json" {
          return URL(fileURLWithPath: bundlePath).appendingPathComponent(path)
        }
      }
    }
    // 3) Не нашли — лог и ошибка
    debugPrint("⚠️ core_words.json not found in app bundle. Check Target Membership & Copy Bundle Resources.")
    throw CatalogError.notFound
  }
}
