//
//  NoteComponents.swift
//
//
//  Created by osushi on 2024/02/24.
//

import SwiftUI

struct Icon: View {
  var body: some View {
    Circle()
      .frame(width: 50, height: 50)
      .foregroundStyle(.cyan)
  }
}

struct NameBar: View {
  var body: some View {
    HStack(spacing: 5) {
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
  var body: some View {
    HStack(spacing: 20) {
      HStack(spacing: 2) {
        Image(systemName: "arrow.uturn.left")
          .imageScale(.small)
        Text("12")
          .font(.caption)
      }
      HStack(spacing: 2) {
        Image(systemName: "arrow.2.squarepath")
          .imageScale(.small)
        Text("12")
          .font(.caption)
      }
      Image(systemName: "plus")
        .imageScale(.small)
      Image(systemName: "ellipsis")
        .imageScale(.small)
    }
    .foregroundStyle(.gray)
  }
}
