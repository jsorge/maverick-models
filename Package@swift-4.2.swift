// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "MaverickModels",
    products: [
        .library(
            name: "MaverickModels",
            targets: ["MaverickModels"]),
    ],
    dependencies: [
		.package(url: "https://github.com/kylef/PathKit.git", from: "0.9.1"),
    ],
    targets: [
        .target(
            name: "MaverickModels",
            dependencies: ["PathKit"]),
        .testTarget(
            name: "MaverickModelsTests",
            dependencies: ["MaverickModels"]),
    ]
)