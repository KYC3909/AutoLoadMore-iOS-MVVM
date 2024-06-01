//
//  PostsVM.swift
//  SampleiOS
//
//  Created by Krunalb on 29/05/24.
//

import Foundation

class PostsVM {
    var page: Int = 0
    let limit: Int = 10
    private(set) var posts = [Post]()
    private(set) var loadinState: LoadingState = .none
    private weak var view: PostsViewProvider!
    private(set) var allPostsLoaded = false
    private(set) var errorPostsMessage: String? = nil

    let service: DataServicesProtocol!
    init(view: PostsViewProvider!, service: DataServicesProtocol!) {
        self.view = view
        self.service = service
    }
}

extension PostsVM: PostsViewModelProvider {
    
    func fetchNextPosts() {
        fetchPosts()
    }
    
    private func fetchPosts() {
        if loadinState == .loading || allPostsLoaded == true { return }
        page += 1
        loadinState = .loading
        self.view.updateLoadingState(loadinState)
        
        guard let getUsersRequest = service.createRequestFor(for: .posts(["_page", "_limit"],
                                                                         [page.description, limit.description])) else { return }
        service.performRequestFor(getUsersRequest, [Post].self) { [weak self] (response) in
            guard let self = self else { return }
            loadinState = .finished
            self.view.updateLoadingState(loadinState)
            switch response{
            case .success(let posts):
                debugPrint("page:", page)
                debugPrint("Success in:\(#function): Posts: \(posts)")
                self.posts.append(contentsOf: posts)
                
                if posts.isEmpty {
                    self.allPostsLoaded = true
                }
                self.view.usersLoadingSuccessful()
            case .failure(let error):
                errorPostsMessage = error.localizedDescription
                debugPrint("Error in:\(#function): Error: \(error.localizedDescription)")
                self.view.usersLoadingFailed(with: error.localizedDescription)
            }
        }
    }
    
}


extension PostsVM {
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfPosts() -> Int {
        return self.posts.count
    }

    func numberOfRowsInSection(_ section: Int) -> Int {
        return self.posts.count + 1
    }

    func getPost(_ index: Int) -> Post {
        return self.posts[index]
    }

}
