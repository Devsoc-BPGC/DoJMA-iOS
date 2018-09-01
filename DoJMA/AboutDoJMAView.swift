//
//  AboutDoJMAView.swift
//  DoJMA
//
//  Created by Raghav Prasad on 25/08/18.
//  Copyright © 2018 MAC. All rights reserved.
//

import UIKit

class AboutDoJMAView: UIView, UITableViewDelegate, UITableViewDataSource {
    
    var shouldSetupConstraints = true
    
//    lazy var tableView: UITableView = {
//        let tableView = UITableView()
//        tableView.delegate = self as? UITableViewDelegate
//        tableView.dataSource = self as? UITableViewDataSource
//        tableView.separatorStyle = .none
//        tableView.frame = CGRect(x: 20, y: 760, width: self.frame.size.width, height: 120 * 6)
//        tableView.autoresizingMask = [.flexibleTopMargin, .flexibleBottomMargin, .flexibleWidth]
//        tableView.register(CustomCell.self, forCellReuseIdentifier: "cell")
//        tableView.isOpaque = false
//        tableView.backgroundColor = UIColor.clear
//        tableView.backgroundView = nil
//        tableView.bounces = false
//        return tableView
//    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        self.addSubview(tableView)
        self.backgroundColor = UIColor.green
    }
    
    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)
//        self.addSubview(tableView)
    }
    
    override func updateConstraints() {
        if(shouldSetupConstraints) {
            shouldSetupConstraints = false
        }
        super.updateConstraints()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 120
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        self.tableView.register(CustomCell.self, forCellReuseIdentifier: "cell")
//        tableview.regis
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
        
        cell.translatesAutoresizingMaskIntoConstraints = false
        
        let names: [String] = ["Parul Verma", "Apoorva Dhamne", "Aryan Agarwal", "Saumya Maheshwari", "Parth Ganatra", "Poojan Thaker"]
        
        let numbers: [String] = ["9472594080", "9833729641", "9521382950", "7030220960", "9426650998", "9881325255"]
        
        let emails: [String] = ["parulverma0997@gmail.com", "apoorvadhamne@gmail.com", "aryanagarwal15@gmail.com", "saumya1198@gmail.com", "parthganatra28@gmail.com", "poojanthaker@gmail.com"]
        
        let positions: [String] = ["Chief Coordinator", "Chief Editor", "Cultural Editor", "Tech Editor", "Sports Editor", "Design Head"]
        
        let images: [String] = ["heart", "utilities icon-29", "event_black_192x192-29", "dojma logo-1024", "chrome_reader_mode_black_192x192-29", "collections_bookmark_black_192x192-29"]
        
        cell.backgroundColor = UIColor.clear
        //        cell.layer.cornerRadius = cell.frame.size.height/4
        
        cell.personName.font = UIFont(name: "Cochin", size: 17)
        cell.personName.textColor = UIColor.black
        cell.personName.text = names[indexPath.row]
        
        cell.personNumber.font = UIFont(name: "HelveticaNeue", size: 13)
        cell.personNumber.textColor = UIColor(red: 0.17, green: 0.6, blue: 0.1, alpha: 1.0)
        cell.personNumber.attributedText = NSMutableAttributedString(string: numbers[indexPath.row], attributes: [kCTUnderlineStyleAttributeName as NSAttributedStringKey: NSUnderlineStyle.styleSingle.rawValue])
//            numbers[indexPath.row]
        
        cell.personEmail.font = UIFont(name: "HelveticaNeue", size: 12)
        cell.personEmail.textColor = UIColor(red: 0.17, green: 0.6, blue: 0.1, alpha: 1.0)
        cell.personEmail.attributedText = NSMutableAttributedString(string: emails[indexPath.row], attributes: [kCTUnderlineStyleAttributeName as NSAttributedStringKey: NSUnderlineStyle.styleSingle.rawValue])
        
        cell.personPosition.font = UIFont(name: "Cochin", size: 17)
        cell.personPosition.textColor = UIColor.black
        cell.personPosition.text = positions[indexPath.row]
        //
        cell.personImage.layer.cornerRadius = cell.personImage.frame.size.height/2
        ////        cell.textLabel?.font = UIFont(name: "HelveticaNeue", size: 16)
        ////        cell.textLabel?.textColor = UIColor.black
        ////        cell.detailTextLabel?.textColor = UIColor.black
        ////        cell.textLabel?.numberOfLines = 4
        ////        cell.textLabel?.text  = names[indexPath.row]
        //////        cell.detailTextLabel?.text = details[indexPath.row]
        ////        cell.selectionStyle = .default
        ////        //        cell.setHighlighted(true, animated: true)
        ////        //        cell.setSelected(false, animated: true)
        ////        cell.imageView?.image = UIImage(named: images[indexPath.row])
        //////        cell.imageView?.backgroundColor = UIColor.magenta
        
        
        return cell
    }

}

//extension AboutDoJMAView: UITableViewDelegate, UITableViewDataSource {
//
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//        tableView.deselectRow(at: indexPath, animated: true)
//        //        tableView.didSele
//
////        switch indexPath.row {
////        case 0:
////            //            IssuesViewController.viewDidLoad(IssuesViewController())
////            leftViewNumber = 0
////            break
////        case 1:
////            leftViewNumber = 1
////            break
////
////        case 2:
////            leftViewNumber = 2
////            break
////
////        case 3:
////            leftViewNumber = 3
////            break
////
////        case 4:
////            leftViewNumber = 4
////            break
////
////        default:
////            break
////        }
//
////        leftActive = true
////        sideMenuViewController?.contentViewController = UINavigationController(rootViewController: IssuesViewController())
////        sideMenuViewController?.hideMenuViewController()
//
//
//    }
//
//}
