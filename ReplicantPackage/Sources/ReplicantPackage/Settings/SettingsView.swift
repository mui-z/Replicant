import ComposableArchitecture
import SwiftUI

struct SettingsView: View {
    @ObservedObject var viewStore: ViewStoreOf<SettingsReducer>

    init(store: StoreOf<SettingsReducer>) {
        viewStore = ViewStoreOf<SettingsReducer>(store, observe: { $0 })
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
