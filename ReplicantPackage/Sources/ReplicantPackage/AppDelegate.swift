//
//  AppDelegate.swift
//
//
//  Created by osushi on 2024/02/25.
//

import Foundation
import UIKit

import ATProtoKit

public class AppDelegate: NSObject, UIApplicationDelegate {
  public func application(_: UIApplication, didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
    authenticateServer()

    return true
  }
}

private extension AppDelegate {
  func authenticateServer() {
    Task {
      do {
        let result = try await config.authenticate()

        switch result {
        case let .success(session):
          logger.info("Result (Access Token): \(session.accessToken)")
          logger.info("Result (Refresh Token): \(session.refreshToken)")
          atClient = ATProtoKit(session: session)
        case let .failure(error):
          logger.info("Error: \(error)")
        }
      } catch {
        print(error)
      }
    }
  }
}
