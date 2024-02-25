//
//  NoteView.swift
//
//
//  Created by osushi on 2024/02/24.
//

import MisskeyAPIKit
import SwiftUI

struct NoteView: View {
  let note: Note
  var body: some View {
    HStack(alignment: .top, spacing: 15) {
      Icon(url: note.user.avatarUrl)
      VStack(alignment: .leading, spacing: 10) {
        NameBar(name: note.user.name ?? note.user.username, id: note.user.username)
        NoteText(text: note.text)
        NoteReactionBar(note: note)
      }
      .frame(maxWidth: .infinity, alignment: .leading)
    }
  }
}
