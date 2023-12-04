//___FILEHEADER___

import Foundation
import Alamofire

protocol MNetwork {
    func request<API: MAPI>(api: API) async throws -> API.Response?
}

struct MNetworkImpl: MNetwork {
    func request<API: MAPI>(api: API) async throws -> API.Response? {
        let response = await _request(api: api)
        if let error = response.error {
            throw errorHandler(error)
        }
        print("statusCode:", response.response?.statusCode ?? "nil")
        return response.value
    }
    
    private func _request<API: MAPI>(api: API) async -> DataResponse<API.Response, AFError> {
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
    
    private func errorHandler(_ error: Error) -> MError {
        guard let afError = error as? AFError else { return MError.unknown }
        print(afError)
        return MError.networkError(afError)
    }
}
