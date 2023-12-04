//___FILEHEADER___

import Foundation

protocol Reducer: ObservableObject {
    associatedtype State: Equatable
    associatedtype Action
    associatedtype Effect
    
    var state: State { get set }
    
    func effect(action: Action) async throws -> Effect
    @MainActor
    func reduce(state: State, effect: Effect) -> State
}

extension Reducer {
    @MainActor
    func action(_ action: Action) {
        Task {
            let effect = try await effect(action: action)
            self.state = reduce(state: state, effect: effect)
        }
    }
}
