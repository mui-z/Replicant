// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "ReplicantPackage",
  platforms: [.iOS(.v17)],
  products: [
    // Products define the executables and libraries a package produces, and make them visible to other packages.
    .library(
      name: "ReplicantPackage",
      targets: ["ReplicantPackage"]
    ),
  ],
  dependencies: [
    // Dependencies declare other packages that this package depends on.
    // .package(url: /* package url */, from: "1.0.0"),
    .package(url: "https://github.com/pointfreeco/swift-composable-architecture", from: "1.8.2"),
    .package(url: "git@github.com:petitstrawberry/MisskeyAPIKit.git", from: "0.2.0"),
    .package(url: "https://github.com/apple/swift-log.git", from: "1.0.0"),
  ],
  targets: [
    // Targets are the basic building blocks of a package. A target can define a module or a test suite.
    // Targets can depend on other targets in this package, and on products in packages this package depends on.
    .target(
      name: "ReplicantPackage",
      dependencies: [
        .product(
          name: "ComposableArchitecture",
          package: "swift-composable-architecture"
        ),
        .product(
          name: "MisskeyAPIKit",
          package: "MisskeyAPIKit"
        ),
        .product(
          name: "Logging",
          package: "swift-log"
        ),
      ]
    ),
    .testTarget(
      name: "ReplicantPackageTests",
      dependencies: ["ReplicantPackage"]
    ),
  ]
)
