import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.framework(
    name: "WeShowService",
    dependencies: [
        .Services.AuthService,
        .SPM.KeychainSwift,
        .SPM.Moya,
        .SPM.RxMoya
    ]
)
