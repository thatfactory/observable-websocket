// swift-tools-version:6.4

import PackageDescription

let strictSwiftSettings: [SwiftSetting] = [
    .treatAllWarnings(as: .error),
    .enableUpcomingFeature("ExistentialAny"),
    .enableUpcomingFeature("InferIsolatedConformances"),
    .enableUpcomingFeature("InternalImportsByDefault"),
    .enableUpcomingFeature("MemberImportVisibility"),
    .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
]

let package = Package(
    name: "ObservableWebSocket",
    platforms: [
        .iOS(.v26),
        .macOS(.v26),
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
            from: "0.1.1"
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
        ),
    ]
)

package.swiftLanguageModes = [.v6]

for target in package.targets {
    target.swiftSettings = strictSwiftSettings
}
