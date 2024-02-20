import ComposableArchitecture

@Reducer
public struct TimelineReducer {
  @ObservableState
  public struct State: Equatable {
    var count: Int
  }

  public enum Action {
    case increment
    case decrement
  }

  public var body: some ReducerOf<Self> {
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
