//
//  CustomCell.swift
//  DoJMA
//
//  Created by Raghav Prasad on 31/08/18.
//  Copyright © 2018 MAC. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    
    @IBOutlet weak var personName: UILabel!
    @IBOutlet weak var personNumber: UILabel!
    @IBOutlet weak var personEmail: UILabel!
    @IBOutlet weak var personPosition: UILabel!
    
    @IBOutlet weak var personImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func openNumber() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(onTapNumber))
        personNumber.isUserInteractionEnabled = true
        tap.delegate = self
        personNumber.addGestureRecognizer(tap)
    }
    
    /*func openEmail() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(onTapEmail))
        personEmail.isUserInteractionEnabled = true
        personEmail.addGestureRecognizer(tap)
    }*/
    
    @objc func onTapNumber(sender: UITapGestureRecognizer) {
//        let num = personNumber.attributedText
//        let url = URL(string: "tel://\(String(describing: num))")!
//        UIApplication.shared.open(url, options: [:], completionHandler: nil)
        print("hello")
    }
    
    

}
