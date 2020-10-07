// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "KVTUIKit",
    platforms: [
        .iOS(.v11),
    ],
    products: [
        .library(
            name: "KVTUIKit",
            targets: ["KVTUIKit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/CodeNationDev/SimplyLogger.git", .branch("main")),
        .package(name: "SwiftMagicHelpers", url: "https://github.com/CodeNationDev/SwiftMagicHelpers.git", .branch("develop"))
    ],
    targets: [
        .target(name: "KVTUIKit",
                dependencies: [.byName(name: "SimplyLogger"),
                               .byName(name: "SwiftMagicHelpers")
                ],
                resources: [
                    .process("Fonts/MyKidsHandwrittenBasic.otf"),
                ]
        )
    ]
)
