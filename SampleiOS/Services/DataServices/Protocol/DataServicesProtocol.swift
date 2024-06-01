//
//  DataServicesProtocol.swift
//  SampleiOS
//
//  Created by Krunalb on 29/05/24.
//

import Foundation

protocol DataServicesProtocol: AnyObject {
    func createRequestFor(for endpoint: ApiEndpoint) -> URLRequest?
    func performRequestFor<T:Codable>(_ request: URLRequest, _ responseType: T.Type, _ completion: @escaping (Result<T, Error>) -> Void)
}
