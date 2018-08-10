//
//  UtilitiesViewController.swift
//  DoJMA
//
//  Created by Raghav Prasad on 10/08/18.
//  Copyright © 2018 MAC. All rights reserved.
//

import UIKit

class UtilitiesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let height: CGFloat = 75
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        let navbar = UINavigationBar(frame: CGRect(x: 0, y: statusBarHeight, width: UIScreen.main.bounds.width, height: statusBarHeight))
        navbar.backgroundColor = UIColor.white
        navbar.delegate = self as? UINavigationBarDelegate
        
//        UIApplication.shared.statusBarStyle = .default
        
        let navItem = UINavigationItem()
        navItem.title = "Utilities"
        navItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "flash-20"), style: .plain, target: self, action: nil)
        navItem.leftBarButtonItem?.tintColor = UIColor.black
        navItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "dropdown menu-20"), style: .plain, target: self, action: nil)
        navItem.rightBarButtonItem?.tintColor = UIColor.black
        
        navbar.items = [navItem]
        
        print(statusBarHeight)
        
        view.addSubview(navbar)

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
