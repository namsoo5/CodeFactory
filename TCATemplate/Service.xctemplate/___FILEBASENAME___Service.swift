//___FILEHEADER___

protocol ___VARIABLE_productName___Service {
    
}

struct ___VARIABLE_productName___ServiceImpl: ___VARIABLE_productName___Service {
    private let network: any MNetwork
    
    init(network: any MNetwork) {
        self.network = network
    }
}
