//
//  PostManager.swift
//  SampleiOS
//
//  Created by Krunalb on 29/05/24.
//

import Foundation

protocol PostManagerProvider {
    func fetctPosts() async -> [Post]
}

class PostManager {
    let dataService: DataServicesProtocol
    let page: Int
    let limit: Int
    
    init(dataService: DataServicesProtocol, page: Int, limit: Int) {
        self.dataService = dataService
        self.page = page
        self.limit = limit
    }
}

//MARK: - Api Calling
extension PostManager: PostManagerProvider{
    
    func fetctPosts() async -> [Post] {
//        await dataService.fetchData()
        return []
    }
}
