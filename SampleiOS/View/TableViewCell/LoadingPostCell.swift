//
//  LoadingPostCell.swift
//  SampleiOS
//
//  Created by Krunalb on 30/05/24.
//

import UIKit

class LoadingPostCell: UITableViewCell, Reusable {
    
    @IBOutlet weak var activity: UIActivityIndicatorView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

extension LoadingPostCell {
    func setupCell( state: LoadingState, message: String? = nil) {
        activity.isHidden = true
        activity.stopAnimating()
        if state == .loading {
            activity.isHidden = false
            activity.startAnimating()
        }
        titleLabel.text = message != nil ? message : "Loading posts..."
    }
}


