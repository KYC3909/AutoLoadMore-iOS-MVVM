//
//  DataParsingServices.swift
//  SampleiOS
//
//  Created by Krunalb on 30/05/24.
//

import Foundation

protocol Parser: AnyObject {
    func decode<T:Decodable>(_ data: Data, _ responseType: T.Type) throws -> T
}

final class JSONParser: Parser  {
    func decode<T:Decodable>(_ data: Data, _ responseType: T.Type) throws -> T {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }
}
