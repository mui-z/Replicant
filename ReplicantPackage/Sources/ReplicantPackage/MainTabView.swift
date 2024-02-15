//
//  MainTabView.swift
//
//
//  Created by osushi on 2024/02/16.
//

import Foundation
import SwiftUI

import ComposableArchitecture
import TCACoordinators

struct MainTabView: View {
    let store: StoreOf<MainTabCoordinator>
    @ObservedObject var viewStore: ViewStoreOf<MainTabCoordinator>

    init(store: StoreOf<MainTabCoordinator>) {
        self.store = store
        viewStore = ViewStoreOf<MainTabCoordinator>(store, observe: { $0 })
    }

    var body: some View {
        TabView(selection: viewStore.binding(get: { $0.selectedTab }, send: MainTabCoordinator.Action.selectedTabChanged)) {
            AppCoordinatorView(
                coordinator: store.scope(
                    state: \.timelineTab,
                    action: \.timelineTab
                )
            )
            .tabItem { Text("🏠") }
            .tag(MainTabCoordinator.Tab.timeline)
        }
    }
}

@Reducer
struct MainTabCoordinator {
    enum Tab: Hashable {
        case timeline
    }

    struct State: Equatable {
        var timelineTab = AppCoordinator.State.rootTimelineState
        var selectedTab: Tab = .timeline
    }

    enum Action {
        case timelineTab(AppCoordinator.Action)
        case selectedTabChanged(Tab)
    }

    var body: some ReducerOf<Self> {
        Scope(state: \.timelineTab, action: /Action.timelineTab) {
            AppCoordinator()
        }

        Reduce<State, Action> { state, action in
            switch action {
            case let .selectedTabChanged(tab):
                state.selectedTab = tab
                return .none
            case .timelineTab:
                return .none
            }
        }
    }
}
