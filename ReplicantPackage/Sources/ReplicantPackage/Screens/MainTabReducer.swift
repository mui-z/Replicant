//
//  MainTabReducer.swift
//
//
//  Created by osushi on 2024/02/20.
//

import ComposableArchitecture

@Reducer
struct MainTabReducer {
  enum Tab { case timeline, notification, settings }

  @ObservableState
  struct State: Equatable {
    var currentTab = Tab.timeline
    var timeline = TimelineReducer.State(count: 0)
    var notification = NotificationReducer.State(count: 0)
    var settings = SettingsReducer.State(count: 0)
  }

  enum Action {
    case timeline(TimelineReducer.Action)
    case notification(NotificationReducer.Action)
    case settings(SettingsReducer.Action)
    case selectedTab(Tab)
  }

  var body: some Reducer<State, Action> {
    Scope(state: \.timeline, action: \.timeline) {
      TimelineReducer()
    }
    Scope(state: \.notification, action: \.notification) {
      NotificationReducer()
    }
    Scope(state: \.settings, action: \.settings) {
      SettingsReducer()
    }

    Reduce { state, action in
      switch action {
      case let .selectedTab(tab):
        state.currentTab = tab
        return .none
      default:
        return .none
      }
    }
  }
}
