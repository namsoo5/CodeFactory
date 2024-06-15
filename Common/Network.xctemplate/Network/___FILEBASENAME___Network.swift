//___FILEHEADER___

import Foundation
import Alamofire

protocol ___VARIABLE_productName___Network {
    func request<API: ___VARIABLE_productName___API>(api: API) async throws -> API.Response?
}

struct ___VARIABLE_productName___NetworkImpl: ___VARIABLE_productName___Network {
    func request<API: ___VARIABLE_productName___API>(api: API) async throws -> API.Response? {
        let response = await _request(api: api)
        if let error = response.error {
            throw errorHandler(error)
        }
        print("statusCode:", response.response?.statusCode ?? "nil")
        return response.value
    }
    
    private func _request<API: ___VARIABLE_productName___API>(api: API) async -> DataResponse<API.Response, AFError> {
        await AF.request(
            api.urlRequest,
            method: api.method,
            parameters: api.parameter,
            encoding: api.encoding,
            headers: api.header
        ) { urlRequest in
            urlRequest.timeoutInterval = 5
            urlRequest.allowsConstrainedNetworkAccess = false
        }
        .serializingDecodable(API.Response.self)
        .response
    }
    
    private func errorHandler(_ error: Error) -> ___VARIABLE_productName___Error {
        guard let afError = error as? AFError else { return ___VARIABLE_productName___Error.unknown }
        print(afError)
        return ___VARIABLE_productName___Error.networkError(afError)
    }
}
