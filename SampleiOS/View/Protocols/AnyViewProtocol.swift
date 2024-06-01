//
//  AnyViewProtocol.swift
//  SampleiOS
//
//  Created by Krunalb on 30/05/24.
//

import Foundation

protocol AnyViewProtocol: AnyObject {
    func updateLoadingState(_ state: LoadingState)
}

protocol PostsViewProvider: AnyViewProtocol {
    func updateLoadingState(_ state: LoadingState)
    func usersLoadingSuccessful()
    func usersLoadingFailed(with error: String)
}
