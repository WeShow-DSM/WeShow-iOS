import ProjectDescription

extension TargetDependency {

    public struct Services {
        public static let WeShowService = service(name: "WeShowService")
        public static let AuthService = service(name: "AuthService")
        public static let ProductService = service(name: "ProductService")
    }

    private static func service(name: String) -> TargetDependency {
        return TargetDependency.project(
            target: name,
            path: .relativeToRoot("Services/\(name)")
        )
    }
}
