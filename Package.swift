// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "SwiduxWatchmen",
    products: [
        .library(
            name: "SwiduxWatchmen",
            targets: ["SwiduxWatchmen"]),
    ],
    dependencies: [
        .package(url: "https://github.com/clmntcrl/swidux.git", .branch("master")),
    ],
    targets: [
        .target(
            name: "SwiduxWatchmen",
            dependencies: ["Swidux"]),
        .testTarget(
            name: "SwiduxWatchmenTests",
            dependencies: ["Swidux", "SwiduxWatchmen"]),
    ]
)
