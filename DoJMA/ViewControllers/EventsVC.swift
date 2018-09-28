//
//  EventsVC.swift
//  DoJMA
//
//  Created by Vandit Jain on 22/09/18.
//  Copyright © 2018 MAC. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import NVActivityIndicatorView

class EventsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    struct event {
        var desc: String;
        var location: String;
        var startDate: String;
        var startTime: String;
        var title: String;
        
        init(snap: [String:Any]){
            desc = snap["desc"] as? String ?? "";
            location = snap["location"] as? String ?? "";
            startDate = snap["startDate"] as? String ?? "";
            startTime = snap["startTime"] as? String ?? "";
            title = snap["title"] as? String ?? "";
            
        }
    }
    
    var Events = [event]();
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Events.count;
    }
    func convertDateFormater(_ date: String) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "ddMMyyyy"
        let date = dateFormatter.date(from: date)
        dateFormatter.dateFormat = "dd MMM"
        return  dateFormatter.string(from: date!)
        
    }
    func convertTimeFormater(_ date: String) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HHmm"
        let date = dateFormatter.date(from: date)
        dateFormatter.dateFormat = "h:mm a"
        return  dateFormatter.string(from: date!)
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = self.eventsTV.dequeueReusableCell(withIdentifier: "topCell") as! EventCell;
            cell.dateTV.text = convertDateFormater(Events[indexPath.count - indexPath.row].startDate) ;
            cell.timeTV.text = convertTimeFormater(Events[indexPath.count - indexPath.row].startTime);
            cell.detailsTV.text = Events[indexPath.count - indexPath.row].desc;
            cell.venueTV.text = Events[indexPath.count - indexPath.row].location;
            cell.titleTV.text = Events[indexPath.count - indexPath.row].title;

            cell.selectionStyle = UITableViewCellSelectionStyle.none
            return cell
        }
        else if indexPath.count == indexPath.row {
            let cell = self.eventsTV.dequeueReusableCell(withIdentifier: "endCell") as! EventCell;
            cell.dateTV.text = convertDateFormater(Events[indexPath.count - indexPath.row].startDate) ;
            cell.timeTV.text = convertTimeFormater(Events[indexPath.count - indexPath.row].startTime);
            cell.detailsTV.text = Events[indexPath.count - indexPath.row].desc;
            cell.venueTV.text = Events[indexPath.count - indexPath.row].location;
            cell.titleTV.text = Events[indexPath.count - indexPath.row].title;

            cell.selectionStyle = UITableViewCellSelectionStyle.none
            return cell;
        }
        
        let cell = self.eventsTV.dequeueReusableCell(withIdentifier: "middleCell") as! EventCell;
        cell.dateTV.text = convertDateFormater(Events[indexPath.count - indexPath.row].startDate) ;
        cell.timeTV.text = convertTimeFormater(Events[indexPath.count - indexPath.row].startTime);
        cell.detailsTV.text = Events[indexPath.count - indexPath.row].desc;
        cell.venueTV.text = Events[indexPath.count - indexPath.row].location;
        cell.titleTV.text = Events[indexPath.count - indexPath.row].title;
        cell.selectionStyle = UITableViewCellSelectionStyle.none

        return cell;
    }
    

    
    @IBOutlet weak var eventsTV: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        eventsTV.delegate = self;
        eventsTV.dataSource = self;
        eventsTV.rowHeight = 80;
        let activityIndicatorView = NVActivityIndicatorView(frame: CGRect(x: self.view.frame.width/2 - 15, y: self.view.frame.height/2 - 15 - (self.navigationController?.navigationBar.frame.height)! , width: 30, height: 30), type: NVActivityIndicatorType.ballPulseSync, color: UIColor(hexString: "#3497FD"), padding: 3)
        self.view.addSubview(activityIndicatorView)
        activityIndicatorView.startAnimating()
        let ref = Database.database().reference();
        ref.child("events2").queryOrdered(byChild: "startDate").observe(.childAdded, with: { (snapshot) in
            if let dictionary = snapshot.value as? [String:Any]{
                self.Events.append(event(snap: dictionary));
            }
            DispatchQueue.main.async{
                if(activityIndicatorView.isAnimating){
                    activityIndicatorView.stopAnimating()
                }
                self.eventsTV.reloadData()
            }
        })
        self.Events.reverse()
        
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
