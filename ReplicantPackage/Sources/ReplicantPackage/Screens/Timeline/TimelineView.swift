import ComposableArchitecture
import SwiftUI

struct TimelineView: View {
  @ObservedObject var viewStore: ViewStoreOf<TimelineReducer>

  init(store: StoreOf<TimelineReducer>) {
    viewStore = ViewStoreOf<TimelineReducer>(store, observe: { $0 })
  }

  var body: some View {
    List {
      NoteView()
        .padding(.top, 3)
      NoteView()
        .padding(.top, 3)
      NoteView()
        .padding(.top, 3)
      NoteView()
        .padding(.top, 3)
      NoteView()
        .padding(.top, 3)
      NoteView()
        .padding(.top, 3)
    }
  }
}
