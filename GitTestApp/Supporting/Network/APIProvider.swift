//
//  APIProvider.swift
//  GitTestApp
//
//  Created by User on 20.05.2022.
//

import Moya

enum APIProvider {
    // Users
    case getAllUsers
    case getUser(username: String)
}

extension APIProvider: TargetType {
    var baseURL: URL { URL(string: APIConfiguration.serverUrl)! }
    
    var path: String {
        switch self {
        
        case .getAllUsers: return "/users"
        case .getUser(let username): return "/users/\(username)"
            
        }
    }
    
    var method: Method {
        switch self {
        case .getAllUsers,
             .getUser: return .get
        }
    }
    
    var sampleData: Data {
        switch self {
        default:
            return Data()
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        switch self {
        default:
            return URLEncoding.default
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        default:
            return [:]
        }
    }
    
    var task: Task {
        switch self {
        default:
            return .requestParameters(parameters: parameters!, encoding: parameterEncoding)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default:
            return ["accept":"application/json"]
        }
    }
}
