//
//  MainTabView.swift
//
//
//  Created by osushi on 2024/02/16.
//

import ComposableArchitecture
import SwiftUI

struct MainTabView: View {
  @Bindable var store: StoreOf<MainTabReducer>

  var body: some View {
    TabView(selection: $store.currentTab.sending(\.selectedTab)) {
      NavigationStack {
        TimelineView(store: store.scope(state: \.timeline, action: \.timeline))
      }
      .tag(MainTabReducer.Tab.timeline)
      .tabItem {
        Text("timeline")
      }

      NavigationStack {
        NotificationView(store: store.scope(state: \.notification, action: \.notification))
      }
      .tag(MainTabReducer.Tab.notification)
      .tabItem {
        Text("notification")
      }

      NavigationStack {
        SettingsView(store: store.scope(state: \.settings, action: \.settings))
      }
      .tag(MainTabReducer.Tab.settings)
      .tabItem {
        Text("settings")
      }
    }
  }
}
