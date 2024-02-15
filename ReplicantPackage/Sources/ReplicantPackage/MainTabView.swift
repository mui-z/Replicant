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
    let store: StoreOf<MainTabReducer>

    @ObservedObject var viewStore: ViewStoreOf<MainTabReducer>

    var body: some View {
        TabView(selection: viewStore.binding(send: MainTabReducer.Action.selectedTabChanged($0))) {
            AppCoordinatorView(
                coordinator: store.scope(
                    state: \.timelineTab,
                    action: { .timelineTab($0) }
                )
            )
        }
    }
}

public enum Tabs: Int, CaseIterable {
    case timeline
}

@Reducer
struct MainTabReducer {
    struct State: Equatable {
        var timelineTab = AppCoordinator.State.rootTimelineState
        var selectedTab: Tabs = .timeline
    }

    enum Action {
        case timelineTab(AppCoordinator.Action)
        case selectedTabChanged(Tabs)
    }

    var body: some ReducerOf<Self> {
        Reduce<State, Action> { state, action in
            switch action {
            case let .selectedTabChanged(tab):
                state.selectedTab = tab
                return .none
            case .timelineTab:
                return .none
            }
        }

        Scope(state: \.timelineTab, action: /Action.timelineTab) {
            AppCoordinator()
        }
    }
}
