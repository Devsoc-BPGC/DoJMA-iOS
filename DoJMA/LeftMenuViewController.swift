//
//  LeftMenuViewController.swift
//  DoJMA
//
//  Created by Raghav Prasad on 29/07/18.
//  Copyright © 2018 MAC. All rights reserved.
//

import UIKit

var leftViewNumber: Int! = 0
var leftActive: Bool!  = true

class LeftMenuViewController: UIViewController {
    
//    var viewNumber: Int!
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self as UITableViewDelegate
        tableView.dataSource = self as UITableViewDataSource
        tableView.separatorStyle = .none
        tableView.frame = CGRect(x: 20, y: (self.view.frame.size.height - 54 * 5) / 2.0, width: self.view.frame.size.width, height: 54 * 5)
        tableView.autoresizingMask = [.flexibleTopMargin, .flexibleBottomMargin, .flexibleWidth]
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.isOpaque = false
        tableView.backgroundColor = UIColor.clear
        tableView.backgroundView = nil
        tableView.bounces = false
       return tableView
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.clear
        view.addSubview(tableView)

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

extension LeftMenuViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 54
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let titles: [String] = ["Issues", "Campus", "Interviews", "DoJMA Recommends", "BitzFeed"]
        
//        let images: [String] = ["IconHome", "IconCalendar", "IconProfile", "IconSettings", "IconEmpty"]
        
        cell.backgroundColor = UIColor.clear
        cell.layer.cornerRadius = cell.frame.size.height/4
        cell.textLabel?.font = UIFont(name: "HelveticaNeue", size: 21)
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.text  = titles[indexPath.row]
        cell.selectionStyle = .default
//        cell.setHighlighted(true, animated: true)
//        cell.setSelected(false, animated: true)
//        cell.imageView?.image = UIImage(named: images[indexPath.row])
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
//        tableView.didSele
        
        switch indexPath.row {
        case 0:
//            IssuesViewController.viewDidLoad(IssuesViewController())
            leftViewNumber = 0
            break
        case 1:
            leftViewNumber = 1
            break
            
        case 2:
            leftViewNumber = 2
            break
            
        case 3:
            leftViewNumber = 3
            break
            
        case 4:
            leftViewNumber = 4
            break
            
        default:
            break
        }
        
        leftActive = true
        sideMenuViewController?.contentViewController = UINavigationController(rootViewController: IssuesViewController())
        sideMenuViewController?.hideMenuViewController()
        
        
    }
    
}
