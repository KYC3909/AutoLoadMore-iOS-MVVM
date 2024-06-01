//
//  PostDetailsVC.swift
//  SampleiOS
//
//  Created by Krunalb on 29/05/24.
//

import UIKit

class PostDetailsVC: BaseVC {
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    var viewModel: PostDetailsVM?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

extension PostDetailsVC {
    private func setupUI() {
        idLabel.text = viewModel?.id
        titleLabel.text = viewModel?.title
        bodyLabel.text = viewModel?.body
    }
}
