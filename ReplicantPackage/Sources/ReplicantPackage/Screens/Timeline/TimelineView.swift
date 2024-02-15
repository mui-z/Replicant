import ComposableArchitecture
import SwiftUI

struct TimelineView: View {
  @ObservedObject var viewStore: ViewStoreOf<TimelineReducer>

  init(store: StoreOf<TimelineReducer>) {
    viewStore = ViewStoreOf<TimelineReducer>(store, observe: { $0 })
  }

  var body: some View {
    VStack {
      Text(viewStore.count.description)
      HStack {
        Button(action: {
          viewStore.send(.decrement)
        }, label: {
          Text("-")
        })
        Button(action: {
          viewStore.send(.increment)
        }, label: {
          Text("+")
        })
      }
    }
  }
}
