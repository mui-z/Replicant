//
//  File.swift
//
//
//  Created by osushi on 2024/02/12.
//
import SwiftUI

import ComposableArchitecture
import TCACoordinators

struct AppCoordinatorView: View {
  let coordinator: StoreOf<AppCoordinator>

  var body: some View {
    TCARouter(coordinator) { screen in
      SwitchStore(screen) { screen in
        switch screen {
        case .timeline:
          CaseLet(
            /AppScreen.State.timeline,
            action: AppScreen.Action.timeline,
            then: TimelineView.init
          )
        }
      }
    }
  }
}

@Reducer
public struct AppScreen {
  public enum State: Equatable {
    case timeline(TimelineReducer.State)
//    case notification(NotificationReducer.State)
//    case settings(SettingsReducer.State)
  }

  public enum Action: Equatable {
    case timeline(TimelineReducer.Action)
//    case notification(NotificationReducer.Action)
//    case settings(SettingsReducer.Action)
  }

  public var body: some ReducerOf<Self> {
    Scope(state: /State.timeline, action: /Action.timeline) {
      TimelineReducer()
    }
//    Scope(state: /State.notification, action: /Action.notification) {
//      NotificationReducer()
//    }
//
//    Scope(state: /State.settings, action: /Action.settings) {
//      SettingsReducer()
//    }
  }
}

@Reducer
public struct AppCoordinator {
  public struct State: Equatable, IndexedRouterState {
    public static let rootTimelineState = AppCoordinator.State(
      routes: [.root(.timeline(.init(count: 0)), embedInNavigationView: false)]
    )

    public var routes: [Route<AppScreen.State>]
  }

  public enum Action: IndexedRouterAction {
    case routeAction(Int, action: AppScreen.Action)
    case updateRoutes([Route<AppScreen.State>])
  }

  public var body: some ReducerOf<Self> {
    Reduce<State, Action> { _, action in
      switch action {
      case .routeAction(_, action: .timeline(.decrement)):
        .none
      default:
        .none
      }
    }.forEachRoute {
      AppScreen()
    }
  }
}
