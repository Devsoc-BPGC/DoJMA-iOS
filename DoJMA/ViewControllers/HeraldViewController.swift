//
//  HeraldViewController.swift
//  DoJMA
//
//  Created by Vandit Jain on 21/09/18.
//  Copyright © 2018 MAC. All rights reserved.
//

import UIKit
import PINRemoteImage
import NVActivityIndicatorView

class HeraldViewController: UIViewController,UITableViewDelegate, UITableViewDataSource, NVActivityIndicatorViewable {
    
    var postsArray = [post]();
    var totalPages: Int?
    var currentPage: Int = 1
    var selectedPost:post?
    var activityIndicatorView: NVActivityIndicatorView?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postsArray.count;
    }
    var checkSegue: Bool = false
    var category: String?
    
    @IBOutlet weak var reloadButton: UIButton!
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mainTableView.dequeueReusableCell(withIdentifier: "HeraldCell", for: indexPath) as! HeraldCell;
        cell.selectionStyle = UITableViewCellSelectionStyle.none 
        let date = convertDateFormater(self.postsArray[indexPath.item].date)
        cell.titleTV.text = self.postsArray[indexPath.item].title.htmlToString;
        cell.dateTV.text = date;
        if(self.postsArray[indexPath.item].imageURLString.elementsEqual("nil")){
            cell.mainImage.image = UIImage(named: "bitzfeed")
            return cell;
        }
        cell.mainImage.pin_setImage(from: URL(string: self.postsArray[indexPath.item].imageURLString), placeholderImage: UIImage(named: "bitzfeed"))
        
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        selectedPost = postsArray[indexPath.row];
        performSegue(withIdentifier: "heraldSegue", sender: self);
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if(!checkSegue){
            if (scrollView.contentOffset.y >= (scrollView.contentSize.height - scrollView.frame.size.height)) {
                if(currentPage==totalPages!){
                    reloadButton.isHidden = true
                }

                reloadButton.isHidden = false
            }else{
                reloadButton.isHidden = true
            }
        }
    }

    func convertDateFormater(_ date: String) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = dateFormatter.date(from: date)
        dateFormatter.dateFormat = "dd MMM yyyy | hh:mm a"
        return  dateFormatter.string(from: date!)
        
    }
    @IBOutlet weak var mainTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reloadButton.clipsToBounds = true
        reloadButton.layer.cornerRadius = reloadButton.layer.frame.width/2
        
        self.tabBarController?.navigationController?.navigationBar.tintColor = UIColor(hexString: "#454F63")
        self.tabBarController?.tabBar.tintColor = UIColor(hexString: "#3497FD")
        var jsonURLString = "http://bitsherald.org/api/get_posts/";
        activityIndicatorView = NVActivityIndicatorView(frame: CGRect(x: self.view.frame.width/2 - 15, y: self.view.frame.height/2 - 15 - (self.navigationController?.navigationBar.frame.height)! , width: 30, height: 30), type: NVActivityIndicatorType.ballPulseSync, color: UIColor(hexString: "#3497FD"), padding: 3)
        self.view.addSubview(activityIndicatorView!)
        activityIndicatorView?.startAnimating()
        mainTableView.delegate = self;
        mainTableView.dataSource = self;
        self.mainTableView.rowHeight = UITableViewAutomaticDimension;
        self.mainTableView.estimatedRowHeight = 280;
        
        if(checkSegue)
        {
            jsonURLString = "http://bitsherald.org/api/get_category_posts/?slug=\(category ?? "Technology")"
        }
        guard let url = URL(string: jsonURLString) else {
            return;
        }
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, err) in
            
            guard let data = data else {
                return;
            }
            
            do{
                
                let jsonResponse = try JSONSerialization.jsonObject(with: data, options: [])
                let postResponse = jsonResponse as! [String:Any];
                self.totalPages = postResponse["pages"] as? Int ?? 1
                let posts = postResponse["posts"];
                let postJSONArray = posts as! [[String:Any]];
                for dic in postJSONArray{
                    self.postsArray.append(post(json: dic));
                
                }
                DispatchQueue.main.async{
                    if(self.activityIndicatorView?.isAnimating)!{
                        self.activityIndicatorView?.stopAnimating()
                        for post in self.postsArray{
                            print(post.id)
                        }
                    }
                    
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

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "heraldSegue") {
            // initialize new view controller and cast it as your view controller
            let viewController = segue.destination as! HeraldPostVC
            // your new view controller should have property that will store passed value
            viewController.id = selectedPost?.id
        }
    }
    
    @IBAction func loadMoreButtonPressed(_ sender: Any) {
        reloadButton.isHidden = true

        if(currentPage==totalPages!){
            return
        }
        activityIndicatorView?.startAnimating()
        currentPage = currentPage+1
        var jsonURLString = "http://bitsherald.org/api/get_posts/?page=\(currentPage)";
    
    guard let url = URL(string: jsonURLString) else {
    return;
    }
    URLSession.shared.dataTask(with: url, completionHandler: { (data, response, err) in
    
    guard let data = data else {
    return;
    }
    
    do{
    
    let jsonResponse = try JSONSerialization.jsonObject(with: data, options: [])
    let postResponse = jsonResponse as! [String:Any];
    self.totalPages = postResponse["pages"] as? Int ?? 1
    let posts = postResponse["posts"];
    let postJSONArray = posts as! [[String:Any]];
    for dic in postJSONArray{
    self.postsArray.append(post(json: dic));
    }
    DispatchQueue.main.async{
        if(self.activityIndicatorView?.isAnimating)!{
            self.activityIndicatorView?.stopAnimating()
        }
    self.mainTableView.reloadData()
    }
    print(self.postsArray[0].imageURLString);
    }catch let parsingError {
    
    print(parsingError);
    
    }
    
    
    }).resume();
        
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
