//
//  Contact.swift
//  DoJMA
//
//  Created by Vandit Jain on 25/09/18.
//  Copyright © 2018 MAC. All rights reserved.
//

import Foundation

struct contact {
    var Name: String
    var number: String
    var sub1: String
    
    init(dictionary: [String:Any]){
        Name = dictionary["name"] as? String ?? ""
        number = dictionary["number"] as? String ?? ""
        sub1 = dictionary["sub1"] as? String ?? ""
    }
}
