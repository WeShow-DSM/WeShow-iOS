import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.framework(
    name: "AuthService",
    dependencies: [
        .SPM.KeychainSwift,
        .SPM.Moya,
        .SPM.RxMoya
    ]
)
