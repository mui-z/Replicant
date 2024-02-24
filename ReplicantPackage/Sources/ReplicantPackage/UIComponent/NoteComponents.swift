//
//  NoteComponents.swift
//
//
//  Created by osushi on 2024/02/24.
//

import SwiftUI

struct Icon: View {
  let size = 40.0
  var body: some View {
    Circle()
      .frame(width: size, height: size)
      .foregroundStyle(.cyan)
  }
}

struct NameBar: View {
  var body: some View {
    HStack(spacing: 0) {
      Text("name")
      Text("@id")
        .foregroundStyle(.gray)
    }
  }
}

struct NoteText: View {
  var body: some View {
    Text("hello world\ndsafasf\ndfafjdajfkl")
      .multilineTextAlignment(.leading)
      .font(.callout)
  }
}

struct NoteReactionBar: View {
  let width = 40.0
  var body: some View {
    HStack(spacing: 20) {
      withCountButton(systemName: "arrow.uturn.left", count: 12)
      withCountButton(systemName: "arrow.2.squarepath", count: 12)
      button(systemName: "plus")
      button(systemName: "ellipsis")
    }
    .foregroundStyle(.gray)
  }

  private func withCountButton(systemName: String, count: Int) -> some View {
    Button {
      print("pushed")
    } label: {
      HStack(spacing: 2) {
        Image(systemName: systemName)
          .imageScale(.small)
        Text(count.description)
          .font(.caption)
      }
      .frame(width: width, alignment: .leading)
    }
  }

  private func button(systemName: String) -> some View {
    Button {
      print("normal button")
    } label: {
      Image(systemName: systemName)
        .imageScale(.small)
        .frame(width: width, alignment: .leading)
    }
  }
}
