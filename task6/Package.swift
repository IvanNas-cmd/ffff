// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "task6",
    products: [
        .library(
            name: "DictionaryCore",
            targets: ["DictionaryCore"]
        ),
        .executable(
            name: "Task6App",
            targets: ["Task6App"]
        )
    ],
    targets: [
        .target(
            name: "DictionaryCore"
        ),
        .executableTarget(
            name: "Task6App",
            dependencies: ["DictionaryCore"]
        ),
        .testTarget(
            name: "DictionaryCoreTests",
            dependencies: ["DictionaryCore"]
        )
    ]
)
