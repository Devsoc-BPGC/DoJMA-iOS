//
//  LaunchScreenViewController.swift
//  DoJMA
//
//  Created by Raghav Prasad on 22/07/18.
//  Copyright © 2018 MAC. All rights reserved.
//

import UIKit

class LaunchScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: {
//            self.performSegue(withIdentifier: "showMainScreen", sender: self)
//        })
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: {
            self.performSegue(withIdentifier: "showMainScreen", sender: self)
        })
        
//        self.navigationController?.setNavigationBarHidden(true, animated: animated)
       
    }
    
    @objc func okay() {
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}

