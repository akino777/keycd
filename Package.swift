// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "keycd",
    products: [
        .executable(name: "keycd", targets: ["keycd"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser.git", branch: "main"),
    ],
    targets: [
        .executableTarget(
            name: "keycd",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
            ]
        ),
        .testTarget(
            name: "Tests",
            dependencies: ["keycd"]
        ),
    ]
)
