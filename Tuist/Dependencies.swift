import ProjectDescription

let dependencies = Dependencies(
    carthage: CarthageDependencies([
        // FlexLayout
        .github(
            path: "layoutBox/FlexLayout",
            requirement: .branch("master")
        )
    ]),
    swiftPackageManager: SwiftPackageManagerDependencies([
        // RxSwift
        .remote(
            url: "https://github.com/ReactiveX/RxSwift.git",
            requirement: .upToNextMajor(from: "6.5.0")
        ),
        // PinLayout
        .remote(
            url: "https://github.com/layoutBox/PinLayout",
            requirement: .branch("master")
        ),
        // Then
        .remote(
            url: "https://github.com/devxoul/Then",
            requirement: .upToNextMajor(from: "3.0.0")
        ),
        // RIBs
        .remote(
            url: "https://github.com/rlarldud1234/RIBs",
            requirement: .branch("main")
        ),
        // ReactorKit
        .remote(
            url: "https://github.com/ReactorKit/ReactorKit.git",
            requirement: .upToNextMajor(from: "3.2.0")
        )
    ]),
    platforms: [.iOS]
)
