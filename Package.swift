// swift-tools-version:4.1
import PackageDescription

let package = Package(
    name: "MaverickModels",
    products: [
        .library(
            name: "MaverickModels",
            targets: ["MaverickModels"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "MaverickModels",
            dependencies: []),
        .testTarget(
            name: "MaverickModelsTests",
            dependencies: ["MaverickModels"]),
    ]
)
