//
//  File.swift
//  
//
//  Created by osushi on 2024/02/12.
//

import ComposableArchitecture
import TCACoordinators

@Reducer
public struct AppCoordinator {
  enum State: Equatable {
    case timeline
    case notification
    case settings
  }
  
  enum Action: Equatable {
    case timeline
    case notification
    case settings
  }
  
  var body: some ReducerOf<Self> {
    Scope(state: /State.timeline, action: /Action.timeline) {
      TimelineReducer()
    }
    
    Scope(state: /State.notification, action: /Action.notification) {
      NotificationReducer()
    }
    
    Scope(state: /State.settings, action: /Action.settings) {
      SettingsReducer()
    }
  }
}
