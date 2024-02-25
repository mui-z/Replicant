//
//  EmojiTextTest.swift
//
//
//  Created by osushi on 2024/02/24.
//

@testable import Replicant
@testable import ReplicantPackage
import XCTest

final class DecoratedTextTest: XCTestCase {
  func testOnceText() throws {
    let raw = "hello:world:hey"

    let expect = DecoratedText.parseEmojiText(raw: raw)
    let actual: [TextPart] = [
      .init(part: "hello", type: .plain),
      .init(part: "world", type: .emoji),
      .init(part: "hey", type: .plain),
    ]

    XCTAssertEqual(actual, expect)
  }

  func testBothEmojiEnds() throws {
    let raw = "hello:world:hey:misskey:"

    let expect = DecoratedText.parseEmojiText(raw: raw)
    let actual: [TextPart] = [
      .init(part: "hello", type: .plain),
      .init(part: "world", type: .emoji),
      .init(part: "hey", type: .plain),
      .init(part: "misskey", type: .emoji),
    ]

    XCTAssertEqual(actual, expect)
  }

  func testPlainOnly() throws {
    let raw = "asdf"

    let expect = DecoratedText.parseEmojiText(raw: raw)
    let actual: [TextPart] = [
      .init(part: "asdf", type: .plain),
    ]

    XCTAssertEqual(actual, expect)
  }

  func testEmojiOnceOnly() throws {
    let raw = ":asdf:"

    let expect = DecoratedText.parseEmojiText(raw: raw)
    let actual: [TextPart] = [
      .init(part: "asdf", type: .emoji),
    ]

    XCTAssertEqual(actual, expect)
  }

  func testEmojiSecondOnly() throws {
    let raw = ":asdf::ppp:"

    let expect = DecoratedText.parseEmojiText(raw: raw)
    let actual: [TextPart] = [
      .init(part: "asdf", type: .emoji),
      .init(part: "ppp", type: .emoji),
    ]

    XCTAssertEqual(actual, expect)
  }
}
