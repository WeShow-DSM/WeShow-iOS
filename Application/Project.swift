import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "WeShow-iOS",
    organizationName: "WeShow-DSM",
    targets: [
        Target(
            name: "WeShow-iOS",
            platform: .iOS,
            product: .app,
            bundleId: "com.WeShow-DSM.WeShow-iOS",
            deploymentTarget: .iOS(
                targetVersion: "13.0",
                devices: .iphone
            ),
            infoPlist: .file(path: Path("SupportingFiles/Info.plist")),
            sources: ["Sources/**"],
            resources: ["Resources/**"],
            scripts: [.swiftLintScript],
            dependencies: [
                .Carthage.FlexLayout,
                .SPM.Cosmos,
                .SPM.PinLayout,
                .SPM.ReactorKit,
                .SPM.RIBs,
                .SPM.RxCocoa,
                .SPM.Then
            ] + TargetDependency.globalDependencies,
            settings: .settings(base: ["OTHER_LDFLAGS": "-ObjC"])
        )
    ]
)
