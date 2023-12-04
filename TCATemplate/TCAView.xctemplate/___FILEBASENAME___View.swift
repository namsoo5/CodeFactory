//___FILEHEADER___

import SwiftUI
import ComposableArchitecture

struct ___VARIABLE_productName___View: View {
    let store: StoreOf<___VARIABLE_productName___Reducer>
    
    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            Text("하이")
        }
    }
}

#Preview {
    ___VARIABLE_productName___View(
        store: Store(initialState: ___VARIABLE_productName___Reducer.State()) {
            ___VARIABLE_productName___Reducer()
        }
    )
}
