//
//  PostsViewModelProvider.swift
//  SampleiOS
//
//  Created by Krunalb on 30/05/24.
//

import Foundation

protocol TableViewViewModelProvider: AnyObject {
    func numberOfSections() -> Int
    func numberOfRowsInSection(_ section: Int) -> Int
}

protocol PostsViewModelProvider: TableViewViewModelProvider {
    func fetchNextPosts() 
    func getPost(_ index: Int) -> Post
}
