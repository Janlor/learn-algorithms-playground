// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "HelloAlgoStructurePackage",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "HelloAlgoStructurePackage",
            targets: ["HelloAlgoStructurePackage"]
        ),
    ],
    dependencies: [
//        .package(url: "https://github.com/apple/swift-collections.git", .upToNextMinor(from: "1.4.0"))
        .package(url: "https://gitee.com/zhahao/swift-collections.git", from: "1.4.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "HelloAlgoStructurePackage",
            dependencies: [
                .product(name: "Collections", package: "swift-collections")
            ]
        ),

    ]
)
