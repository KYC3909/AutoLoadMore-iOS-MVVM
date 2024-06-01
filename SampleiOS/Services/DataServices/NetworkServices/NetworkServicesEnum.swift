//
//  NetworkServicesEnum.swift
//  SampleiOS
//
//  Created by Krunalb on 30/05/24.
//

import Foundation

struct ServerUrl {
    static let url = "https://jsonplaceholder.typicode.com"
}
enum ApiEndpoint {
    case getUsers, posts([String],[String])

    var endpointString: String {
        switch self {
        case .getUsers:
            return "/users"
        case .posts:
            return "/posts"
        }
    }
}

extension ApiEndpoint {
    var method: String {
        switch self {
        case .getUsers, .posts:
            return "GET"
        }
    }

    var queryItems: [URLQueryItem] {
        switch self {
        case .getUsers:
            return []
        case .posts(let keys, let values):
            var items = [URLQueryItem]()
            for index in keys.indices {
                items.append(URLQueryItem.init(name: keys[index], value: values[index]))
            }
            return items
        }
    }

    var httpBody: Data? {
        switch self {
        case .getUsers, .posts:
            return nil
        }
    }
}

struct HeaderConfiguration {
    let value: String
    let key: String
}

public enum NetworkError: Error {
    case error(statusCode: Int, data: Data?)
    case notConnected
    case cancelled
    case generic(Error)
    case urlGeneration
    case emptyData
}
