// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RxReachability",
    platforms: [
        .macOS(.v10_10),
        .iOS(.v11),
        .tvOS(.v11)
    ],
    products: [
        .library(
            name: "RxReachability",
            targets: ["RxReachability"])
    ],
    dependencies: [
        .package(url: "https://github.com/ReactiveX/RxSwift", .upToNextMajor(from: "6.0.0")),
        .package(
            name: "Reachability",
            url: "https://github.com/StreamLayer/Reachability.swift.git",
            .upToNextMajor(from: "1.0.1")
        )
    ],
    targets: [
        .target(
            name: "RxReachability",
            dependencies: [
                "RxSwift",
                .product(name: "RxCocoa", package: "RxSwift"),
                .product(name: "ReachabilityLib", package: "Reachability")
        ]),

        // MARK: SwiftPM tests
        .testTarget(
            name: "RxReachabilityTests",
            dependencies: [
            "RxReachability",
            .product(name: "RxBlocking", package: "RxSwift")
            ]),
    ]
)
