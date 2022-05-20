//
//  NetworkManager.swift
//  GitTestApp
//
//  Created by User on 20.05.2022.
//

import Foundation
import Moya

enum ServerErrors {
    case resourceNotFound
    case other
}

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    private let provider = MoyaProvider<APIProvider>(plugins: [NetworkLoggerPlugin()])
//    private let provider = MoyaProvider<APIProvider>()
    
    // MARK: - Users
    
    func getAllUsers(completion: @escaping (AllUsersModel?, ServerErrors?) -> ()) {
        provider.request(.getAllUsers) { [unowned self] result in
            switch result {
            case .success(let response):
                do {
                    let data = try JSONDecoder().decode(AllUsersModel.self, from: response.data)
                    
                    if let error = self.isValidResponse(response: response) {
                        completion(nil, error)
                    } else {
                        completion(data, nil)
                    }
                } catch let error {
                    print(error)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getUsers(username: String, completion: @escaping (UserModel?, ServerErrors?) -> ()) {
        provider.request(.getUser(username: username)) { [unowned self] result in
            switch result {
            case .success(let response):
                do {
                    let data = try JSONDecoder().decode(UserModel.self, from: response.data)
                    
                    if let error = self.isValidResponse(response: response) {
                        completion(nil, error)
                    } else {
                        completion(data, nil)
                    }
                } catch let error {
                    print(error)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    // MARK: - Support
    
    private func isValidResponse(response: Response) -> ServerErrors? {
        switch response.statusCode {
        case 200:
            return nil
        case 404:
            return .resourceNotFound
        default:
            return .other
        }
    }
    
}
