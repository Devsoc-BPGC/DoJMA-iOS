//
//  IssuesMainScreenCell.swift
//  DoJMA
//
//  Created by Vandit Jain on 24/09/18.
//  Copyright © 2018 MAC. All rights reserved.
//

import UIKit

class IssuesMainScreenCell: UITableViewCell {

    @IBOutlet weak var parallaxImage: UIImageView!
    @IBOutlet weak var cellText: UILabel!
    @IBOutlet weak var parallaxImageHeight: NSLayoutConstraint!
    @IBOutlet weak var parallaxImageTop: NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        parallaxImage.clipsToBounds = true
    }

}
