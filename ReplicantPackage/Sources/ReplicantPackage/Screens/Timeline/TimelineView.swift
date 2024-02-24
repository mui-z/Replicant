import ComposableArchitecture
import SwiftUI

struct TimelineView: View {
  @ObservedObject var viewStore: ViewStoreOf<TimelineReducer>

  init(store: StoreOf<TimelineReducer>) {
    viewStore = ViewStoreOf<TimelineReducer>(store, observe: { $0 })
  }

  var body: some View {
    List {
      ForEach(viewStore.notes) { note in
        NoteView(note: note)
          .padding(.top, 3)
      }
    }
    .onAppear {
      viewStore.send(.getHomeNotes)
    }
  }
}
