import ProjectDescription

extension TargetDependency {

    public struct SPM {

        // Care LocalData
        public static let KeychainSwift = TargetDependency.external(name: "KeychainSwift")

        // Design Pattern
        public static let ReactorKit = TargetDependency.external(name: "ReactorKit")
        public static let RIBs = TargetDependency.external(name: "RIBs")

        // DI
        public static let Swinject = TargetDependency.external(name: "Swinject")

        // Publishing
        public static let Cosmos = TargetDependency.external(name: "Cosmos")
        public static let Then = TargetDependency.external(name: "Then")
        public static let PinLayout = TargetDependency.external(name: "PinLayout")

        // Reactive Programing
        public static let RxSwift = TargetDependency.external(name: "RxSwift")
        public static let RxCocoa = TargetDependency.external(name: "RxCocoa")

        // Server Interworking
        public static let Moya = TargetDependency.external(name: "Moya")
        public static let RxMoya = TargetDependency.external(name: "RxMoya")

    }

    public static let globalDependencies: [TargetDependency] = [
        .SPM.RxSwift,
        .SPM.Swinject
    ]

}
