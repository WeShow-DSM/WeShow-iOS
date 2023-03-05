import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.framework(
    name: "OrderService",
    dependencies: [
        .Services.WeShowService
    ]
)
