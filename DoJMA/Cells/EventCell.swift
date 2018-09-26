//
//  EventCell.swift
//  DoJMA
//
//  Created by Vandit Jain on 22/09/18.
//  Copyright © 2018 MAC. All rights reserved.
//

import UIKit

class EventCell: UITableViewCell {

    @IBOutlet weak var titleTV: UITextView!
    @IBOutlet weak var venueTV: UITextView!
    @IBOutlet weak var detailsTV: UITextView!
    @IBOutlet weak var dateTV: UITextView!
    @IBOutlet weak var timeTV: UITextView!
    @IBOutlet weak var circleImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews();
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setupViews(){
        titleTV.translatesAutoresizingMaskIntoConstraints = false;
        venueTV.translatesAutoresizingMaskIntoConstraints = false;
        detailsTV.translatesAutoresizingMaskIntoConstraints = false;
        dateTV.translatesAutoresizingMaskIntoConstraints = false;
        timeTV.translatesAutoresizingMaskIntoConstraints = false;
        circleImage.translatesAutoresizingMaskIntoConstraints = false;
        
        dateTV.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true;
        dateTV.widthAnchor.constraint(equalToConstant: 60).isActive = true;
        dateTV.heightAnchor.constraint(equalToConstant: 30).isActive = true;
        dateTV.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -8).isActive = true;
        
        timeTV.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true;
        timeTV.widthAnchor.constraint(equalToConstant: 60).isActive = true;
        timeTV.heightAnchor.constraint(equalToConstant: 30).isActive = true;
        timeTV.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 8).isActive = true;
        
        circleImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 54).isActive = true;
        circleImage.widthAnchor.constraint(equalToConstant: 12).isActive = true;
        circleImage.heightAnchor.constraint(equalToConstant: 12).isActive = true;
        circleImage.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true;
        
        titleTV.leftAnchor.constraint(equalTo: circleImage.centerXAnchor, constant: 15).isActive = true;
        titleTV.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true;
        titleTV.heightAnchor.constraint(equalToConstant: 35).isActive = true;
        titleTV.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true;
        
        venueTV.leftAnchor.constraint(equalTo: circleImage.centerXAnchor, constant: 15).isActive = true;
        venueTV.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true;
        venueTV.heightAnchor.constraint(equalToConstant: 20).isActive = true;
        venueTV.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true;
        
        detailsTV.leftAnchor.constraint(equalTo: circleImage.centerXAnchor, constant: 15).isActive = true;
        detailsTV.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true;
        detailsTV.heightAnchor.constraint(equalToConstant: 20).isActive = true;
        detailsTV.topAnchor.constraint(equalTo: venueTV.bottomAnchor, constant: 0).isActive = true;
        
    
        
    }
}
