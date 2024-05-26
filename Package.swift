// swift-tools-version: 5.10
import PackageDescription

let package = Package(
    name: "radio-browser-swift",
    platforms: [
        .iOS(.v16),
        .macOS(.v13),
        .tvOS(.v16),
        .watchOS(.v9)
    ],
    products: [
        .library(name: "RadioBrowserSwift", targets: ["RadioBrowserSwift"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-async-dns-resolver", .upToNextMajor(from: "0.4.0"))
    ],
    targets: [
        .target(name: "RadioBrowserSwift", dependencies: [
            .product(name: "AsyncDNSResolver", package: "swift-async-dns-resolver"),
        ]),
        .testTarget(name: "RadioBrowserSwiftTests", dependencies: ["RadioBrowserSwift"]),
    ]
)
