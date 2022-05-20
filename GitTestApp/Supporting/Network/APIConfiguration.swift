//
//  APIConfiguration.swift
//  GitTestApp
//
//  Created by User on 20.05.2022.
//

import Foundation

enum APIConfiguration {
    static let baseUrl = "https://ott.cryptoguard.com"
    
    static let port = ":443"
    
    static let urlApi = "/src/OTT/api/v1"
    
    static var serverUrl: String {
        return baseUrl + port + urlApi
    }
}
