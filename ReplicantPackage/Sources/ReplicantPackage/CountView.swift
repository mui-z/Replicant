import SwiftUI
import ComposableArchitecture

struct CountView: View {
  @ObservedObject var viewStore: ViewStoreOf<CountReducer>

  init(store: StoreOf<CountReducer>) {
    self.viewStore = ViewStoreOf<CountReducer>(store, observe: { $0 })
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
