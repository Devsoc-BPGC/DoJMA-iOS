//
//  HeraldPostVC.swift
//  DoJMA
//
//  Created by Vandit Jain on 22/09/18.
//  Copyright © 2018 MAC. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class HeraldPostVC: UIViewController {

    var post: POST?
    var id: Int?
    var activityIndicatorView: NVActivityIndicatorView?
    override func viewDidLoad() {
        
        var jsonURLString = "http://bitsherald.org/api/get_post/?id=\(id!)";
        activityIndicatorView = NVActivityIndicatorView(frame: CGRect(x: self.view.frame.width/2 - 15, y: self.view.frame.height/2 - 15 - (self.navigationController?.navigationBar.frame.height)! , width: 30, height: 30), type: NVActivityIndicatorType.ballPulseSync, color: UIColor(hexString: "#3497FD"), padding: 3)
        self.view.addSubview(activityIndicatorView!)
        activityIndicatorView?.startAnimating()
        super.viewDidLoad()
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
                let posts = postResponse["post"] as! [String:Any]
                self.post = POST(json: posts)
                DispatchQueue.main.async{
                    if(self.activityIndicatorView?.isAnimating)!{
                        self.activityIndicatorView?.stopAnimating()
                    }
                    if((self.post?.imageURLString)!).elementsEqual("nil"){
                        self.image.image = UIImage(named: "bitzfeed")
                    }else{
                        self.image.pin_setImage(from: URL(string: (self.post?.imageURLString)!), placeholderImage: UIImage(named: "bitzfeed"));
                    }
                    
                    self.self.titleTV.text = self.post?.title.htmlToString;
                    self.dateTV.text = self.convertDateFormater((self.post?.date)!);
                    print(self.post?.content)
                    self.contentTV.text = self.post?.content.htmlToString;
                    self.mainScrollView.translatesAutoresizingMaskIntoConstraints = false
                    self.mainScrollView.bottomAnchor.constraint(equalTo: self.contentTV.bottomAnchor, constant: 10).isActive = true
                    let style = NSMutableParagraphStyle()
                    style.lineSpacing = 5
                    style.paragraphSpacing = 20
                    style.lineBreakMode = .byWordWrapping
                    let attributes = [kCTParagraphStyleAttributeName : style]
                    self.contentTV.attributedText = NSAttributedString(string: (self.post?.content.htmlToString)!, attributes:attributes as [NSAttributedStringKey : Any])
                    self.contentTV.font = UIFont(name: (self.contentTV.font?.fontName)!, size: 17)
                }
            }catch let parsingError {
                
                print(parsingError);
                
            }
            
            
        }).resume()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func convertDateFormater(_ date: String) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = dateFormatter.date(from: date)
        dateFormatter.dateFormat = "dd MMM yyyy | hh:mm a"
        return  dateFormatter.string(from: date!)
        
    }
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var titleTV: UITextView!
    @IBOutlet weak var dateTV: UITextView!
    @IBOutlet weak var contentTV: UITextView!
    @IBOutlet weak var mainScrollView: UIScrollView!
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
