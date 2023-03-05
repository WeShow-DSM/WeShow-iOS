import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.framework(
    name: "ProductService",
    dependencies: [
        .Services.WeShowService
    ]
)
