import ProjectDescription

extension TargetDependency {

    public struct Services {
        public static let Test = service(name: "Test")
    }

    private static func service(name: String) -> TargetDependency {
        return TargetDependency.project(
            target: name,
            path: "Services/\(name)"
        )
    }

}
