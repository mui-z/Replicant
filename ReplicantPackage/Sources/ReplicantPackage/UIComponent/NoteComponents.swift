//
//  NoteComponents.swift
//
//
//  Created by osushi on 2024/02/24.
//
import Logging
import SwiftUI

import MisskeyAPIKit

struct Icon: View {
  let size = 40.0
  let url: String

  var body: some View {
    AsyncImage(url: URL(string: url), scale: size) { image in
      image
        .resizable()
        .aspectRatio(contentMode: .fill)
        .frame(width: size, height: size)
        .clipShape(Circle())
    } placeholder: {
      Circle()
        .frame(width: size, height: size)
        .foregroundStyle(.cyan)
    }
  }
}

struct NameBar: View {
  let name: String
  let id: String
  var body: some View {
    HStack(spacing: 0) {
      Text(name)
      Text("@\(id)")
        .foregroundStyle(.gray)
    }
  }
}

struct NoteText: View {
  let text: String?
  var body: some View {
    Text(text ?? "")
      .multilineTextAlignment(.leading)
      .font(.callout)
  }
}

struct NoteReactionBar: View {
  let width = 40.0
  let note: Note

  var body: some View {
    HStack(spacing: 20) {
      withCountButton(systemName: "arrow.uturn.left", count: note.repliesCount)
      withCountButton(systemName: "arrow.2.squarepath", count: note.renoteCount)
      button(systemName: "plus")
      button(systemName: "ellipsis")
    }
    .foregroundStyle(.gray)
  }

  private func withCountButton(systemName: String, count: Int) -> some View {
    HStack(spacing: 2) {
      Image(systemName: systemName)
        .imageScale(.small)

      if count > 0 {
        Text(count.description)
          .font(.caption)
      }
    }
    .frame(width: width, alignment: .leading)
    .onTapGesture {
      logger.info("with count button tapped")
    }
  }

  private func button(systemName: String) -> some View {
    Image(systemName: systemName)
      .imageScale(.small)
      .frame(width: width, alignment: .leading)
      .onTapGesture {
        logger.info("button tapped")
      }
  }
}
