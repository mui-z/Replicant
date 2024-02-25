//
//  EmojiText.swift
//
//
//  Created by osushi on 2024/02/24.
//

import SwiftUI

struct DecoratedText: View {
  public init(plainText _: String) {}

  var body: some View {
    Text("")
  }
}

extension DecoratedText {
  static func parseEmojiText(raw: String) -> [TextPart] {
    let pattern = ":([a-z\\_]+):"
    var result = [TextPart]()
    var currentIndex = raw.startIndex

    do {
      let regex = try NSRegularExpression(pattern: pattern)
      let matches = regex.matches(in: raw, range: NSRange(raw.startIndex..., in: raw))

      for match in matches {
        let start = match.range(at: 1).location
        let end = start + match.range(at: 1).length

        let startIndex = raw.index(raw.startIndex, offsetBy: start)
        let endIndex = raw.index(raw.startIndex, offsetBy: end)

        let matchedSubstring = String(raw[startIndex ..< endIndex])
        let text = String(raw[currentIndex ..< raw.index(startIndex, offsetBy: -1)])

        if !text.isEmpty {
          result.append(.init(part: text, type: .plain))
        }
        result.append(.init(part: matchedSubstring, type: .emoji))

        currentIndex = raw.index(endIndex, offsetBy: 1)
      }

      if currentIndex != raw.endIndex {
        let text = String(raw[raw.index(currentIndex, offsetBy: 0) ..< raw.endIndex])
        if !text.isEmpty {
          result.append(.init(part: text, type: .plain))
        }
      }
    } catch {
      print("Error in regular expression: \(error)")
    }

    return result
  }
}

struct TextPart: Equatable {
  let part: String
  let type: DecoratedTextType
}

enum DecoratedTextType {
  case plain
  case emoji
  case url
}
