import Logging
import SwiftUI

import ATProtoKit
import ComposableArchitecture

struct TimelineView: View {
  @ObservedObject var viewStore: ViewStoreOf<TimelineReducer>

  init(store: StoreOf<TimelineReducer>) {
    viewStore = ViewStoreOf<TimelineReducer>(store, observe: { $0 })
  }

  var body: some View {
    List {
      Button("get client") {
        viewStore.send(.getFollowingTimeline)
      }
    }
    .onAppear {}
  }
}
