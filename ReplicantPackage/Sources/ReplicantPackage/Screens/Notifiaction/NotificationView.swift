import ComposableArchitecture
import SwiftUI

struct NotificationView: View {
  @ObservedObject var viewStore: ViewStoreOf<NotificationReducer>

  init(store: StoreOf<NotificationReducer>) {
    viewStore = ViewStoreOf<NotificationReducer>(store, observe: { $0 })
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
