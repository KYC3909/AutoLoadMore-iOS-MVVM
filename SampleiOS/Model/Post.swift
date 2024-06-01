//
//  Post.swift
//  SampleiOS
//
//  Created by Krunalb on 29/05/24.
//

import Foundation

struct Post: Codable {
    let id: Int
    let userId: Int
    let title: String
    let body: String
}
