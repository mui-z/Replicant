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
    MainTabView(
      store: Store(initialState: MainTabCoordinator.State()) {
        MainTabCoordinator()
      }
    )
  }
}
