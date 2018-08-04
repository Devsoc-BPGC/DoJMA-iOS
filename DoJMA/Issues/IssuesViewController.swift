//
//  IssuesViewController.swift
//  DoJMA
//
//  Created by Raghav Prasad on 29/07/18.
//  Copyright © 2018 MAC. All rights reserved.
//

import UIKit

class IssuesViewController: UIViewController {
    
    var issuesView: IssuesView!
    var campusView: CampusView!
    var interviewsView: InterviewsView!
    var dojmaRecommendsView: DoJMARecommendsView!
    var bitzfeedView: BitzFeedView!
    var nationalView: NationalView!
    var worldView: WorldView!
    var technologyView: TechnologyView!
    var sportsView: SportsView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
//        title = "Issues"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "menu"), style: .plain, target: self, action: #selector(SSASideMenu.presentLeftMenuViewController))
        navigationItem.leftBarButtonItem?.tintColor = UIColor.black
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "menu"), style: .plain, target: self, action: #selector(SSASideMenu.presentRightMenuViewController))
        navigationItem.rightBarButtonItem?.tintColor = UIColor.black
        
        issuesView = IssuesView(frame: self.view.bounds)
//        campusView = CampusView(frame: self.view.bounds)

        self.view.addSubview(issuesView)
//
//        if(viewNumber == 0) {
//            self.view.addSubview(issuesView)
//        }
//
//        else {
//            self.view.addSubview(campusView)
//        }

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        issuesView = IssuesView(frame: self.view.bounds)
        campusView = CampusView(frame: self.view.bounds)
        interviewsView = InterviewsView(frame: self.view.bounds)
        dojmaRecommendsView = DoJMARecommendsView(frame: self.view.bounds)
        bitzfeedView = BitzFeedView(frame: self.view.bounds)
        nationalView = NationalView(frame: self.view.bounds)
        worldView = WorldView(frame: self.view.bounds)
        technologyView = TechnologyView(frame: self.view.bounds)
        sportsView = SportsView(frame: self.view.bounds)
        
        switch leftViewNumber {
        case 0:
            self.view.addSubview(issuesView)
            title = "Issues"
            break
            
        case 1:
            self.view.addSubview(campusView)
            title = "Campus"
            break
            
        case 2:
            self.view.addSubview(interviewsView)
            title = "Interviews"
            break
            
        case 3:
            self.view.addSubview(dojmaRecommendsView)
            title = "DoJMA Recommends"
            break
            
        case 4:
            self.view.addSubview(bitzfeedView)
            title = "BitzFeed"
            break
            
        default:
            break
        }
        
        
        if(!leftActive) {
            switch rightViewNumber {
            case 0:
                self.view.addSubview(nationalView)
                title = "National"
                break
                
            case 1:
                self.view.addSubview(worldView)
                title = "World"
                break
                
            case 2:
                self.view.addSubview(technologyView)
                title = "Technology"
                break
                
            case 3:
                self.view.addSubview(sportsView)
                title = "Sports"
                break
                
            default:
                break
            }
        }
        
        
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
