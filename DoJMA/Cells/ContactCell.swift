//
//  ContactCell.swift
//  DoJMA
//
//  Created by Vandit Jain on 25/09/18.
//  Copyright © 2018 MAC. All rights reserved.
//

import UIKit
import Photos

class ContactCell: UITableViewCell {

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var addContactBtn: UIButton!
    @IBOutlet weak var callBtn: UIButton!
    
    var number:String?
    var contact:contact?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        addContactBtn.translatesAutoresizingMaskIntoConstraints = false
        addContactBtn.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15).isActive = true
        addContactBtn.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        addContactBtn.isHidden = true
        
        callBtn.translatesAutoresizingMaskIntoConstraints = false
        callBtn.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15).isActive = true
        callBtn.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func callBtnPressed(_ sender: Any) {
        guard let number = URL(string: "tel://" + number!) else { return }
        if #available(iOS 10, *) {
            UIApplication.shared.open(number)
        } else {
            UIApplication.shared.openURL(number)
        }
    }
    
    
    
    
    @IBAction func addContactBtnPressed(_ sender: Any) {
    }

}
