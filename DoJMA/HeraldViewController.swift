//
//  HeraldViewController.swift
//  DoJMA
//
//  Created by Vandit Jain on 21/09/18.
//  Copyright © 2018 MAC. All rights reserved.
//

import UIKit
import PINRemoteImage

class HeraldViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    var postsArray = [post]();
    struct post{
        let id: Int;
        let title: String;
        let date: String;
        let imageURLString: String;
        let postURLString: String;
        
        init(json: [String:Any]) {
            id = json["id"] as? Int ?? -1
            title = json["title"] as? String ?? "";
            date = json["date"] as? String ?? "";
            let thumbnaildata = json["thumbnail_images"] as! [String:Any];
            let fulldata = thumbnaildata["full"] as! [String:Any];
            imageURLString = fulldata["url"] as? String ?? "";
            postURLString = ""
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postsArray.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mainTableView.dequeueReusableCell(withIdentifier: "HeraldCell", for: indexPath) as! HeraldCell;
        var date = self.postsArray[indexPath.item].date;
        date.removeLast(9);
        cell.titleTV.text = self.postsArray[indexPath.item].title.htmlToString;
        cell.dateTV.text = date;
    
        cell.mainImage.pin_setImage(from: URL(string: self.postsArray[indexPath.item].imageURLString));
        
        return cell;
    }
    

    @IBOutlet weak var mainTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let jsonURLString = "http://bitsherald.org/api/get_posts/";
        guard let url = URL(string: jsonURLString) else {
            return;
        }
        mainTableView.delegate = self;
        mainTableView.dataSource = self;
        mainTableView.rowHeight = 350;
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, err) in
            
            guard let data = data else {
                return;
            }
            do{
                let jsonResponse = try JSONSerialization.jsonObject(with: data, options: [])
                let postResponse = jsonResponse as! [String:Any];
                let posts = postResponse["posts"];
                let postJSONArray = posts as! [[String:Any]];
                for dic in postJSONArray{
                    self.postsArray.append(post(json: dic));
                }
                DispatchQueue.main.async{
                    self.mainTableView.reloadData()
                }
                print(self.postsArray[0].imageURLString);
            }catch let parsingError {
                print(parsingError);
            }
            
           
        }).resume();

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
