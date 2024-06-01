//
//  BaseVC.swift
//  SampleiOS
//
//  Created by Krunalb on 29/05/24.
//

import UIKit

class BaseVC: UIViewController, Storyboarded {
    weak var coordinator: MainCoordinator?
    
    override func viewDidLoad() {
        self.view.backgroundColor = Colors.ghostWhite.uiColor
        setup()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }    
}

//MARK: - Setup UI
extension BaseVC {
    private func setup(){
        
    }
}
