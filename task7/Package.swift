// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "task7",
    products: [
        .executable(
            name: "Task7App",
            targets: ["Task7App"]
        )
    ],
    targets: [
        .executableTarget(
            name: "Task7App"
        ),
        .testTarget(
            name: "Task7AppTests",
            dependencies: ["Task7App"]
        )
    ]
)
