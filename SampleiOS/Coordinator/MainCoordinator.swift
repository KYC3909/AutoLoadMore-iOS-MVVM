//
//  MainCoordinator.swift
//  SampleiOS
//
//  Created by Krunalb on 29/05/24.
//

import Foundation
import UIKit

class MainCoordinator: NSObject {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

//MARK: - Coordinator
extension MainCoordinator: Coordinator {
    
    func start() {
        let vc = PostsVC.instantiate()
        let service = NetworkServices(baseURLString: ServerUrl.url,
                                      parser: JSONParser())
        let vm = PostsVM(view: vc, service: service)
        vc.viewModel = vm
        vc.coordinator = self
        vc.title = "Posts"
        self.navigationController.navigationBar.prefersLargeTitles = true
        self.navigationController.setViewControllers([vc], animated: true)
        self.navigationController.setNavigationBarHidden(false, animated: false)
    }
 
    func startPostDetailsVC(_ post: Post){
        let viewModel = PostDetailsVM(post: post)
        let vc = PostDetailsVC.instantiate()
        vc.viewModel = viewModel
        vc.coordinator = self
        vc.title = viewModel.title
        self.navigationController.pushViewController(vc, animated: true)
        self.navigationController.setNavigationBarHidden(false, animated: false)
    }

}
