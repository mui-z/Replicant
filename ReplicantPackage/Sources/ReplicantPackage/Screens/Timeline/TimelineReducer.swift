import Logging

import ATProtoKit
import ComposableArchitecture

@Reducer
public struct TimelineReducer {
  @ObservableState
  public struct State: Equatable {
    var count: Int
  }

  public enum Action {
    case getFollowingTimeline
  }

  public var body: some ReducerOf<Self> {
    Reduce { _, action in
      switch action {
      case .getFollowingTimeline:
        .run { _ in
        }
      }
    }
  }
}
