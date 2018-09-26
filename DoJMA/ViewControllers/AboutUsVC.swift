//
//  AboutUsVC.swift
//  DoJMA
//
//  Created by Vandit Jain on 26/09/18.
//  Copyright © 2018 MAC. All rights reserved.
//

import UIKit

class AboutUsVC: UIViewController {

    @IBOutlet weak var card1: UIView!
    @IBOutlet weak var card2: UIView!
    @IBOutlet weak var macLogo: UIImageView!
    @IBOutlet weak var DoJMALogo: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        card1.clipsToBounds = true
        card2.clipsToBounds = true
        card1.layer.cornerRadius = 15
        card2.layer.cornerRadius = 15
        
        card1.layer.masksToBounds = false
        card1.layer.cornerRadius = 20
        card1.layer.shadowColor = UIColor(hexString: "#455B63").cgColor
        card1.layer.shadowOffset = CGSize(width: 0, height: 4)
        card1.layer.shadowRadius = 8
        card1.layer.shadowOpacity = 0.10
        
        card2.layer.masksToBounds = false
        card2.layer.cornerRadius = 20
        card2.layer.shadowColor = UIColor(hexString: "#455B63").cgColor
        card2.layer.shadowOffset = CGSize(width: 0, height: 4)
        card2.layer.shadowRadius = 8
        card2.layer.shadowOpacity = 0.10
        
        macLogo.clipsToBounds = true
        DoJMALogo.clipsToBounds = true
        macLogo.layer.cornerRadius = macLogo.layer.frame.width/2
        DoJMALogo.layer.cornerRadius = DoJMALogo.layer.frame.width/2
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
