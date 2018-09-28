//
//  campusWatchVC.swift
//  DoJMA
//
//  Created by Vandit Jain on 26/09/18.
//  Copyright © 2018 MAC. All rights reserved.
//

import UIKit
import VerticalCardSwiper
import FirebaseDatabase
import NVActivityIndicatorView

class campusWatchVC: UIViewController, VerticalCardSwiperDatasource {
    
    struct campusWatchPost{
        var Content:String?
        var imageUrl:String?
        var timestamp: String?
        var title: String?
        
        init(dict: [String:Any]) {
            Content = dict["content"] as? String ?? ""
            imageUrl = dict["imageUrl"] as? String ?? ""
            timestamp = dict["timestamp"] as? String ?? ""
            title = dict["title"] as? String ?? ""
        }
    }
    
    var Posts = [campusWatchPost]()
    private var cardSwiper: VerticalCardSwiper!
    @IBInspectable public var topInset: CGFloat = 0
    
    func cardForItemAt(verticalCardSwiperView: VerticalCardSwiperView, cardForItemAt index: Int) -> CardCell {
        let cardCell = verticalCardSwiperView.dequeueReusableCell(withReuseIdentifier: "campusWatchCell", for: index) as! campusWatchCell
        cardCell.layer.cornerRadius = 10
        if(Posts.count == 0){
            print("Im here")
            return cardCell
            
        }
        cardCell.imageV.pin_setImage(from: URL(string: Posts[Posts.count - index - 1].imageUrl!), placeholderImage: UIImage(named: "bitzfeed"))
        cardCell.titleV.text = Posts[Posts.count - index - 1].title
        cardCell.contentV.text = Posts[Posts.count - index - 1].Content
        cardCell.dateV.text = Posts[Posts.count - index - 1].timestamp
        return cardCell
    }
    func numberOfCards(verticalCardSwiperView: VerticalCardSwiperView) -> Int {
        return Posts.count
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cardSwiper = VerticalCardSwiper(frame: CGRect(x: 0, y: UIApplication.shared.statusBarFrame.height + 50, width: self.view.frame.width, height: self.view.frame.height - 50 - UIApplication.shared.statusBarFrame.height))
        cardSwiper.topInset = 0
        view.addSubview(cardSwiper)
        let activityIndicatorView = NVActivityIndicatorView(frame: CGRect(x: self.view.frame.width/2 - 15, y: self.view.frame.height/2 - 15 , width: 30, height: 30), type: NVActivityIndicatorType.ballPulseSync, color: UIColor(hexString: "#3497FD"), padding: 3)
        self.view.addSubview(activityIndicatorView)
        activityIndicatorView.startAnimating()
        
        cardSwiper.datasource = self
        cardSwiper.isSideSwipingEnabled = false
        cardSwiper.cardSpacing = 25
        let ref = Database.database().reference().child("campusWatch")
        ref.observe(.childAdded) { (snapshot) in
            if let dict = snapshot.value as? [String: Any]{
                self.Posts.append(campusWatchPost(dict: dict))
                DispatchQueue.main.async{
                    if(activityIndicatorView.isAnimating){
                        activityIndicatorView.stopAnimating()
                    }
                    self.cardSwiper.reloadData()
                    print(self.Posts.count)
                }

            }
        }
        
        
        // register cardcell for storyboard use
        cardSwiper.register(nib: UINib(nibName: "campusWatchCell", bundle: nil), forCellWithReuseIdentifier: "campusWatchCell")

        // Do any additional setup after loading the view.
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
