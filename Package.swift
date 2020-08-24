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
        .package(url: "https://github.com/CodeNationDev/SimplyLogger.git", .branch("main") )
    ],
    targets: [
        .target(name: "KVTUIKit",
                dependencies: [.byName(name: "SimplyLogger")],
                resources: [
                    .process("Fonts/MyKidsHandwrittenBasic.otf"),
                ]
        )
    ]
)
