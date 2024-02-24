import Logging

import ComposableArchitecture
import MisskeyAPIKit

@Reducer
public struct TimelineReducer {
  @ObservableState
  public struct State: Equatable {
    var count: Int
    var notes: [Note] = []
  }

  public enum Action {
    case getHomeNotes
    case getHomeNotesResult(Result<[Note], APIError>)
  }

  public var body: some ReducerOf<Self> {
    Reduce { state, action in
      switch action {
      case .getHomeNotes:
        return .run { send in
          do {
            let notes = try await misskey.notes.getLocalTimeline(.init())
            await send(.getHomeNotesResult(.success(notes)))
          } catch {
            await send(.getHomeNotesResult(.failure(error as! APIError)))
          }
        }
      case let .getHomeNotesResult(.success(notes)):
        state.notes = notes
        return .none
      case let .getHomeNotesResult(.failure(error)):
        logger.error(.init(stringLiteral: error.localizedDescription))
        return .none
      }
    }
  }
}

extension Note: Equatable, Identifiable {
  public static func == (lhs: MisskeyAPIKit.Note, rhs: MisskeyAPIKit.Note) -> Bool {
    lhs.id == rhs.id
  }
}
