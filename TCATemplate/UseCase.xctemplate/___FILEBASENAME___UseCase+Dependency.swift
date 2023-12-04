//___FILEHEADER___

import ComposableArchitecture

extension ___VARIABLE_productName___UseCaseImpl: DependencyKey {
    static let liveValue: any ___VARIABLE_productName___UseCase = ___VARIABLE_productName___UseCaseImpl(
        service: ___VARIABLE_productName___ServiceImpl(
            network: MNetworkImpl()
        )
    )
}

extension DependencyValues {
    var ___VARIABLE_productName___UseCase: any ___VARIABLE_productName___UseCase {
        get { self[___VARIABLE_productName___UseCaseImpl.self] }
        set { self[___VARIABLE_productName___UseCaseImpl.self] = newValue }
    }
}
