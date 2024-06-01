//
//  PostDetailsVM.swift
//  SampleiOS
//
//  Created by Krunalb on 29/05/24.
//

import Foundation

class PostDetailsVM {
    let post: Post
    
    init(post: Post) {
        self.post = post
    }
}

extension PostDetailsVM {
    var id: String {
        post.id.description
    }
    
    var title: String {
        post.title
    }

    var body: String {
        post.body
    }

}
