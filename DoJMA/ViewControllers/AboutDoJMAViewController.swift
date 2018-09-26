//
//  AboutDoJMAViewController.swift
//  DoJMA
//
//  Created by Raghav Prasad on 31/08/18.
//  Copyright © 2018 MAC. All rights reserved.
//

import UIKit

class AboutDoJMAViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func fbClicked(_ sender: Any) {
        guard let url = URL(string: "https://www.facebook.com/DoJMABITSGoa/") else {
            return //be safe
        }
        
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
    
    @IBAction func twitterClicked(_ sender: Any) {
        guard let url = URL(string: "https://twitter.com/dojmabitsgoa") else {
            return //be safe
        }
        
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
    @IBAction func youtubeClicked(_ sender: Any) {
        guard let url = URL(string: "https://www.youtube.com/channel/UCtO0OtOBQ40poBQpJZ8ZVuA") else {
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
