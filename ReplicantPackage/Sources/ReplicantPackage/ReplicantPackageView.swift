//
//  ReplicantPackageView.swift
//
//
//  Created by osushi on 2024/02/12.
//

import ComposableArchitecture
import SwiftUI

public struct ReplicantPackageView: View {
  public init() {}

  public var body: some View {
    Demo(store: Store(initialState: MainTabReducer.State()) { MainTabReducer() }) { store in
      MainTabView(store: store)
    }
  }
}

/// This wrapper provides an "entry" point into an individual demo that can own a store.
struct Demo<State, Action, Content: View>: View {
  @SwiftUI.State var store: Store<State, Action>
  let content: (Store<State, Action>) -> Content

  init(
    store: Store<State, Action>,
    @ViewBuilder content: @escaping (Store<State, Action>) -> Content
  ) {
    self.store = store
    self.content = content
  }

  var body: some View {
    content(store)
  }
}
