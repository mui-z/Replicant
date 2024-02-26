//
//  ReplicantApp.swift
//  Replicant
//
//  Created by osushi on 2022/03/05.
//

import ReplicantPackage
import SwiftUI

@main
struct ReplicantApp: App {
  @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

  var body: some Scene {
    WindowGroup {
      ReplicantPackageView()
    }
  }
}
