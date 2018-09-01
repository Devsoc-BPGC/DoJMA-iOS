//
//  AboutAppView.swift
//  DoJMA
//
//  Created by Raghav Prasad on 30/08/18.
//  Copyright © 2018 MAC. All rights reserved.
//

import UIKit

class AboutAppView: UIView {
    @IBOutlet weak var creatorName: UILabel!
    @IBOutlet weak var creatorNumber: UILabel!
    @IBOutlet weak var creatorEmail: UILabel!
    
//    lazy var tableView: UITableView = {
//        let tableView = UITableView()
//        tableView.delegate = self as? UITableViewDelegate
//        tableView.dataSource = self as? UITableViewDataSource
//        tableView.separatorStyle = .none
//        tableView.frame = CGRect(x: 20, y: 760, width: self.frame.size.width, height: 120 * 6)
//        tableView.autoresizingMask = [.flexibleTopMargin, .flexibleBottomMargin, .flexibleWidth]
////        tableView.register(CustomCell.self, forCellReuseIdentifier: "cell")
//        tableView.isOpaque = false
//        tableView.backgroundColor = UIColor.clear
//        tableView.backgroundView = nil
//        tableView.bounces = false
//        return tableView
//    }()
//
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 1
//    }
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 120
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        self.tableView.register(CustomCell.self, forCellReuseIdentifier: "cell")
//
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
//
//        cell.translatesAutoresizingMaskIntoConstraints = false
//
////        cell.personName.font = UIFont(name: "Cochin", size: 17)
//        cell.personName.textColor = UIColor.black
//        cell.personName.text = "Raghav Prasad"
//
//        cell.personNumber.font = UIFont(name: "HelveticaNeue", size: 13)
//        cell.personNumber.textColor = UIColor(red: 0.17, green: 0.6, blue: 0.1, alpha: 1.0)
//        cell.personNumber.attributedText = NSMutableAttributedString(string: "9004667739", attributes: [kCTUnderlineStyleAttributeName as NSAttributedStringKey: NSUnderlineStyle.styleSingle.rawValue])
//
//        cell.personEmail.font = UIFont(name: "HelveticaNeue", size: 12)
//        cell.personEmail.textColor = UIColor(red: 0.17, green: 0.6, blue: 0.1, alpha: 1.0)
//        cell.personEmail.attributedText = NSMutableAttributedString(string: "raghavprasad13@gmail.com", attributes: [kCTUnderlineStyleAttributeName as NSAttributedStringKey: NSUnderlineStyle.styleSingle.rawValue])
//
//        return cell
//    }
    
    
    var shouldSetupConstraints = true

    override init(frame: CGRect) {
        super.init(frame: frame)
//        self.backgroundColor = UIColor.magenta
    }
    
    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)
//        self.addSubview(tableView)
//        setupViews()
    }
    
    override func updateConstraints() {
        if(shouldSetupConstraints) {
            shouldSetupConstraints = false
        }
        super.updateConstraints()
    }
    
//    func setupViews() {
//        creatorName.translatesAutoresizingMaskIntoConstraints = false
//        creatorNumber.translatesAutoresizingMaskIntoConstraints = false
//        creatorEmail?.translatesAutoresizingMaskIntoConstraints = false
////
//        creatorName?.font = UIFont(name: "Cochin", size: 17)
//        creatorName?.textColor = UIColor.black
//        creatorName?.text = "Raghav Prasad"
//
//        creatorNumber?.font = UIFont(name: "HelveticaNeue", size: 13)
//        creatorNumber?.textColor = UIColor(red: 0.17, green: 0.6, blue: 0.1, alpha: 1.0)
//        creatorNumber?.attributedText = NSMutableAttributedString(string: "9004667739", attributes: [kCTUnderlineStyleAttributeName as NSAttributedStringKey: NSUnderlineStyle.styleSingle.rawValue])
//
//        creatorEmail?.font = UIFont(name: "HelveticaNeue", size: 12)
//        creatorEmail?.textColor = UIColor(red: 0.17, green: 0.6, blue: 0.1, alpha: 1.0)
//        creatorEmail?.attributedText = NSMutableAttributedString(string: "raghavprasad13@gmail.com", attributes: [kCTUnderlineStyleAttributeName as NSAttributedStringKey: NSUnderlineStyle.styleSingle.rawValue])
////
//        self.addSubview(creatorName)
//        self.addSubview(creatorNumber)
//        self.addSubview(creatorEmail)
//    }
    
}
