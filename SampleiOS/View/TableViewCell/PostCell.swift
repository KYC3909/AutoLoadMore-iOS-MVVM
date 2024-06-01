//
//  PostCell.swift
//  SampleiOS
//
//  Created by Krunalb on 30/05/24.
//

import UIKit

class PostCell: UITableViewCell, Reusable {
    
    @IBOutlet weak var postIdViewContainer: UIView!
    @IBOutlet weak var postIdLabel: UILabel!
    @IBOutlet weak var postTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

extension PostCell {
    func setupCell(_ post: Post) {
        postIdLabel.text = post.id.description
        postTitleLabel.text = post.title
    }
}


