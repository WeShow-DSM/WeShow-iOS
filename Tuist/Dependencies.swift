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
        // KeychainSwift
        .remote(
            url: "https://github.com/evgenyneu/keychain-swift",
            requirement: .upToNextMajor(from: "20.0.0")
        ),
        // Moya
        .remote(
            url: "https://github.com/Moya/Moya.git",
            requirement: .upToNextMajor(from: "15.0.0")
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
        // Swinject
        .remote(
            url: "https://github.com/Swinject/Swinject.git",
            requirement: .upToNextMajor(from: "2.8.3")
        ),
        // Then
        .remote(
            url: "https://github.com/devxoul/Then",
            requirement: .upToNextMajor(from: "3.0.0")
        )
        
    ]),
    platforms: [.iOS]
)
