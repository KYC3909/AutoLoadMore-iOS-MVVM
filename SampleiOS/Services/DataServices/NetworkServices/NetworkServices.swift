//
//  NetworkServices.swift
//  SampleiOS
//
//  Created by Krunalb on 29/05/24.
//

import Foundation

final class NetworkServices {
    private var baseURL: URL!
    private var parser: Parser!

    init(baseURLString: String, parser: Parser) {
        let url = URL(string: baseURLString)!
        self.baseURL = url
        self.parser = parser
    }
}

//MARK: - DataServices Protocol
extension NetworkServices: DataServicesProtocol {
    
    // Create Request
    func createRequestFor(for endpoint: ApiEndpoint) -> URLRequest? {
        var urlComponent = URLComponents(string: baseURL.absoluteString + endpoint.endpointString)

        urlComponent?.queryItems = endpoint.queryItems.isEmpty ? nil :  endpoint.queryItems

        guard let requestURL = urlComponent?.url else { return nil }

        var urlRequest = URLRequest(url: requestURL,
                                    cachePolicy: .reloadRevalidatingCacheData)
        urlRequest.timeoutInterval = 10

        urlRequest.httpMethod = endpoint.method
        urlRequest.httpBody = endpoint.httpBody
        return urlRequest
    }
}


//MARK: - DataServices Protocol
extension NetworkServices {
    
    // Perform Request
    func performRequestFor<T:Codable>(_ request: URLRequest, _ responseType: T.Type, _ completion: @escaping (Result<T, Error>) -> Void) {
        let task = URLSession.shared.dataTask(with: request) { (data, response, requestError) in
            if let requestError = requestError {
                var error: NetworkError
                if let response = response as? HTTPURLResponse {
                    error = .error(statusCode: response.statusCode, data: data)
                } else {
                    error = self.resolve(error: requestError)
                }
                completion(.failure(error))
            } else {
                guard let data = data else {
                    completion(.failure(NetworkError.emptyData))
                    return
                }
                do {
                    let parsedData = try self.parser.decode(data, responseType)
                    completion(.success(parsedData))
                } catch let err {
                    completion(.failure(err))
                }
            }
        }
        task.resume()
    }
    
    private func resolve(error: Error) -> NetworkError {
        let code = URLError.Code(rawValue: (error as NSError).code)
        switch code {
        case .notConnectedToInternet: return .notConnected
        case .cancelled: return .cancelled
        case .zeroByteResource: return .emptyData
        default: return .generic(error)
        }
    }
}
