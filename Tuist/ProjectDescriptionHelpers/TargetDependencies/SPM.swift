import ProjectDescription

extension TargetDependency {

    public struct SPM {

        // Design Pattern
        public static let RIBs = TargetDependency.external(name: "RIBs")

        // Publishing
        public static let Then = TargetDependency.external(name: "Then")
        public static let PinLayout = TargetDependency.external(name: "PinLayout")

        // Reactive Programing
        public static let RxSwift = TargetDependency.external(name: "RxSwift")
        public static let RxCocoa = TargetDependency.external(name: "RxCocoa")
    }

    public static let globalDependencies: [TargetDependency] = [
        .SPM.RxSwift
    ]

}
