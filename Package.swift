// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "ObservableWebSocket",
    platforms: [
        .iOS(.v17),
        .macOS(.v14)
    ],
    products: [
        .library(
            name: "ObservableWebSocket",
            targets: ["ObservableWebSocket"]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/thatfactory/toolbox.git",
            from: "0.1.0"
        )
    ],
    targets: [
        .target(
            name: "ObservableWebSocket",
            dependencies: [
                .product(
                    name: "Toolbox",
                    package: "toolbox"
                )
            ]
        ),
        .testTarget(
            name: "ObservableWebSocketTests",
            dependencies: ["ObservableWebSocket"]
        )
    ]
)
