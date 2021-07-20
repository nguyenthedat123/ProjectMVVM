import Foundation
import Moya


//MARK: - enum
enum API {
    case catRepositories
}


//MARK: - TargetType
extension API: TargetType {
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
    var baseURL: URL {
        let url = URL(string: "https://thatcopy.pw")!
        return url
    }
    
    var path: String {
        switch self {
        case .catRepositories:
            return "/catapi/rest/"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        var dataUrl: URL?

        switch self {
        case .catRepositories:
            if let file = Bundle.main.url(forResource: "catResponse", withExtension: "json") {
                dataUrl = file
            }
        }
        if let url = dataUrl, let data = try? Data(contentsOf: url) {
            return data
        }

        return Data()
    }
    
    var task: Task {
        switch self {
        case .catRepositories:
            return .requestPlain
        }
        
        var headers: [String: String]? {
            return ["Content-type": "application/json"]
        }
        
        
        // For json encode. Use in post request
        var jsonEncoding: JSONEncoding {
            return JSONEncoding.default
        }
        
        // For param encode. Use in get request
        var parameterEncoding: ParameterEncoding {
            return URLEncoding.default
        }
    }
}
