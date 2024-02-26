//
//  NoteView.swift
//
//
//  Created by osushi on 2024/02/24.
//

import SwiftUI

struct NoteView: View {
  var body: some View {
    HStack(alignment: .top, spacing: 15) {
      Icon(url: "")
      VStack(alignment: .leading, spacing: 10) {
        NameBar(name: "name", id: UUID().uuidString)
        NoteText(text: "text")
        NoteReactionBar()
      }
      .frame(maxWidth: .infinity, alignment: .leading)
    }
  }
}
