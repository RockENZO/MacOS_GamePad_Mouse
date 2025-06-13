// swift-tools-version: 6.1
import PackageDescription

let package = Package(
    name: "GamepadMouseMacOS",
    platforms: [
        .macOS(.v10_15)
    ],
    products: [
        .app(
            name: "GamepadMouseMacOS",
            targets: ["GamepadMouseMacOS"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "GamepadMouseMacOS",
            dependencies: []
        ),
        .testTarget(
            name: "GamepadMouseMacOSTests",
            dependencies: ["GamepadMouseMacOS"]
        )
    ]
)
