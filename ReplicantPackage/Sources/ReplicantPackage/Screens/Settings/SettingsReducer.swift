import ComposableArchitecture

@Reducer
struct SettingsReducer {
  @ObservableState
  struct State: Equatable {
    var count: Int
  }

  enum Action {
    case increment
    case decrement
  }

  var body: some ReducerOf<Self> {
    Reduce { state, action in
      switch action {
      case .increment:
        state.count += 1
        return .none
      case .decrement:
        state.count -= 1
        return .none
      }
    }
  }
}
