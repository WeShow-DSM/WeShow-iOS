import ProjectDescription

extension Project {

    public static func framework(
        name: String,
        dependencies: [TargetDependency]
    ) -> Project {
        return Project(
            name: name,
            organizationName: "WeShow-DSM",
            targets: [
                Target(
                    name: name,
                    platform: .iOS,
                    product: .framework,
                    bundleId: "com.WeShow-DSM.\(name)",
                    deploymentTarget: .iOS(
                        targetVersion: "13.0",
                        devices: .iphone
                    ),
                    infoPlist: .default,
                    sources: ["Sources/**"],
                    scripts: [.swiftLintScript],
                    dependencies: dependencies + TargetDependency.globalDependencies
                )
            ]
        )
    }

}
