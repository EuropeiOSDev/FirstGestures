//
//  TTSService.swift
//  FirstGestures
//
//  Created by Valery Shel on 30.10.2025.
//

import AVFoundation
final class TTSService {
  private let synth = AVSpeechSynthesizer()
  func speak(_ text: String, locale: Locale = .current) {
    let ut = AVSpeechSynthesisVoice.speechVoices().first(where: { $0.language.hasPrefix(locale.language.languageCode?.identifier ?? "en") })?.language
    let utter = AVSpeechUtterance(string: text)
    utter.voice = AVSpeechSynthesisVoice(language: ut ?? Locale.current.identifier)
    synth.speak(utter)
  }
}
