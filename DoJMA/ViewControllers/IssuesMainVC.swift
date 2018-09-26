//
//  IssuesMainVC.swift
//  DoJMA
//
//  Created by Vandit Jain on 24/09/18.
//  Copyright © 2018 MAC. All rights reserved.
//

import UIKit

class IssuesMainVC: UIViewController,UITableViewDelegate, UITableViewDataSource {

    var categories = ["Campus","National","World","Technology","Sports","Interviews","DoJMA-Recommends","BITZFEED"]
    var images: [UIImage] = [
        UIImage(named: "campus")!,
        UIImage(named: "national")!,
        UIImage(named: "international")!,
        UIImage(named: "technology")!,
        UIImage(named: "sports")!,
        UIImage(named: "interviews")!,
        UIImage(named: "dojma-recommends")!,
        UIImage(named: "bitzfeed")!,
    ]
    var SelectedCategory:String?
    var parallaxOffsetSpeed: CGFloat = 50
    var cellheight: CGFloat = 125
    
    var parallaxImageHeight: CGFloat {
        let maxOffset = (sqrt(pow(cellheight,2) + 4 * parallaxOffsetSpeed * self.tableView.frame.height) - cellheight)/2
        return maxOffset + cellheight
    }
    
    @IBOutlet weak var gradientVie: UIView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "issuesMainScreenCell") as! IssuesMainScreenCell
        cell.cellText.text = categories[indexPath.row]
        cell.parallaxImage.image = images[indexPath.row]
        cell.parallaxImageHeight.constant = self.parallaxImageHeight
        cell.parallaxImageTop.constant = parallaxOffset(newOffsetY: tableView.contentOffset.y, cell: cell)
        return cell
    }
    func parallaxOffset(newOffsetY: CGFloat, cell: UITableViewCell) -> CGFloat {
        return (newOffsetY - cell.frame.origin.y)/parallaxImageHeight*parallaxOffsetSpeed
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showIssues") {
            // initialize new view controller and cast it as your view controller
            let viewController = segue.destination as! HeraldViewController
            // your new view controller should have property that will store passed value
            viewController.checkSegue = true
            viewController.category = self.SelectedCategory
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        SelectedCategory = categories[indexPath.row]
        self.performSegue(withIdentifier: "showIssues", sender: self)
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = tableView.contentOffset.y
        for cell in tableView.visibleCells as! [IssuesMainScreenCell] {
            cell.parallaxImageTop.constant = parallaxOffset(newOffsetY: tableView.contentOffset.y, cell: cell)
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
