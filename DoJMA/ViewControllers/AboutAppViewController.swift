//
//  AboutAppViewController.swift
//  DoJMA
//
//  Created by Raghav Prasad on 01/09/18.
//  Copyright © 2018 MAC. All rights reserved.
//

import UIKit

class AboutAppViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        vanditProfPic.layer.cornerRadius = vanditProfPic.layer.frame.width/2
        raghavProfPic.layer.cornerRadius = raghavProfPic.layer.frame.width/2
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var vanditProfPic: UIImageView!
    @IBOutlet weak var raghavProfPic: UIImageView!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func fbClicled(_ sender: Any) {
        guard let url = URL(string: "https://FB.com/macbitsgoa") else {
            return //be safe
        }
        
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
    @IBAction func macClicked(_ sender: Any) {
        guard let url = URL(string: "https://macbitsgoa.com") else {
            return //be safe
        }
        
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
        
    }
    
    @IBAction func linkedINClicked(_ sender: Any) {
        guard let url = URL(string: "https://www.linkedin.com/company/mobile-applications-club") else {
            return //be safe
        }
        
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
    @IBAction func githubClicked(_ sender: Any) {
        guard let url = URL(string: "https://GitHub.com/mobileapplicationsclub") else {
            return //be safe
        }
        
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
    @IBAction func appStoreClicked(_ sender: Any) {
        guard let url = URL(string: "https://itunes.apple.com/in/developer/rushikesh-jogdand/id1436508757") else {
            return //be safe
        }
        
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
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
