// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "MaverickModels",
    products: [
        .library(name: "MaverickModels", targets: ["MaverickModels"]),
    ],
    dependencies: [],
    targets: [
        .target(name: "MaverickModels", dependencies: []),
    ]
)
