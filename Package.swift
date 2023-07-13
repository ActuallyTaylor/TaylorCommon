// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TaylorCommon",
    platforms: [
        .iOS(.v16),
        .macOS(.v11)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "TaylorCommon",
            targets: ["TaylorCommon"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/ActuallyTaylor/HydrogenReporter", from: "1.0.0"),
        .package(url: "https://github.com/evgenyneu/keychain-swift", from: "20.0.0"),
    ],
    targets: [
        .target(
            name: "TaylorCommon",
            dependencies: [
                .product(name: "HydrogenReporter", package: "HydrogenReporter"),
                .product(name: "KeychainSwift", package: "keychain-swift")
            ]
        ),
    ]
)
