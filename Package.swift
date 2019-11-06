// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "MaverickModels",
    platforms: [.macOS(.v10_14)],
    products: [
        .library(name: "MaverickModels", targets: ["MaverickModels"]),
    ],
    dependencies: [
        .package(url: "https://github.com/dduan/Pathos.git", from: "0.2.1")
    ],
    targets: [
        .target(name: "MaverickModels", dependencies: ["Pathos",]),
    ]
)
