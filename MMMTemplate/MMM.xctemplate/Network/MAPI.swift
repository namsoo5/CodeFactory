//___FILEHEADER___

import Foundation
import Alamofire

protocol MAPI {
    associatedtype Response: Decodable
    
    var hostURL: HostURL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var header: HTTPHeaders? { get }
    var parameter: Parameters? { get }
    var encoding: ParameterEncoding { get }
}

extension MAPI {
    var encoding: ParameterEncoding { URLEncoding.default }
    var header: HTTPHeaders? { nil }
    var urlRequest: URLConvertible {
        return try! (hostURL.rawValue + path).asURL()
    }
}
