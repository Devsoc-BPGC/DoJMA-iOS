//
//  HeraldCell.swift
//  DoJMA
//
//  Created by Vandit Jain on 21/09/18.
//  Copyright © 2018 MAC. All rights reserved.
//

import UIKit

class HeraldCell: UITableViewCell {

    @IBOutlet weak var shareTV: UIButton!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var titleTV: UITextView!
    @IBOutlet weak var dateTV: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        mainImage.layer.cornerRadius = 5
        mainImage.layer.masksToBounds = true
        //dateTV.translatesAutoresizingMaskIntoConstraints = false
        //dateTV.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 5).isActive = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func shareTVClicked(_ sender: Any) {
    }
    
}
