//___FILEHEADER___

import Foundation
import Alamofire

enum MError: Error {
    case unknown
    case networkError(AFError)
}
