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
        // Cosmos
        .remote(
            url: "https://github.com/evgenyneu/Cosmos",
            requirement: .branch("master")
        ),
        // PinLayout
        .remote(
            url: "https://github.com/layoutBox/PinLayout",
            requirement: .branch("master")
        ),
        // ReactorKit
        .remote(
            url: "https://github.com/ReactorKit/ReactorKit.git",
            requirement: .upToNextMajor(from: "3.2.0")
        ),
        // RIBs
        .remote(
            url: "https://github.com/rlarldud1234/RIBs",
            requirement: .branch("main")
        ),
        // RxSwift
        .remote(
            url: "https://github.com/ReactiveX/RxSwift.git",
            requirement: .upToNextMajor(from: "6.5.0")
        ),
        // Then
        .remote(
            url: "https://github.com/devxoul/Then",
            requirement: .upToNextMajor(from: "3.0.0")
        )
        
    ]),
    platforms: [.iOS]
)
