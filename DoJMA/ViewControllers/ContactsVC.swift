//
//  ContactsVC.swift
//  DoJMA
//
//  Created by Vandit Jain on 25/09/18.
//  Copyright © 2018 MAC. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ContactsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    struct link{
        var name: String?
        var link: String?
        init(dict: [String:Any]) {
            name = dict["title"] as? String ?? ""
            link = dict["url"] as? String ?? ""
        }
    }
    var sectionHeaders = [String]()
    var screen: String?
    var Contacts = [String: [contact]]()
    var links = [link]()
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if screen?.elementsEqual("contacts") ?? "".elementsEqual("contacts"){
            return sectionHeaders.count
        }else if screen?.elementsEqual("taxi") ?? "".elementsEqual("taxi"){
            return 1
        }else if screen?.elementsEqual("link") ?? "".elementsEqual("link"){
            return 1
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if screen?.elementsEqual("contacts") ?? "".elementsEqual("contacts"){
            return Contacts[sectionHeaders[section]]?.count ?? 0
        }else if screen?.elementsEqual("taxi") ?? "".elementsEqual("taxi"){
            return Contacts["Taxi"]?.count ?? 0
        }else if screen?.elementsEqual("link") ?? "".elementsEqual("link"){
            return links.count
        }
        return 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell") as! ContactCell
        if screen?.elementsEqual("contacts") ?? "".elementsEqual("contacts"){
            cell.titleLabel.text = Contacts[sectionHeaders[indexPath.section]]?[indexPath.row].Name ?? ""
            cell.subTitleLabel.text = Contacts[sectionHeaders[indexPath.section]]?[indexPath.row].sub1 ?? ""
            cell.number = Contacts[sectionHeaders[indexPath.section]]?[indexPath.row].number
            cell.contact = Contacts[sectionHeaders[indexPath.section]]?[indexPath.row]
        }else if screen?.elementsEqual("taxi") ?? "".elementsEqual("taxi"){
            cell.titleLabel.text = Contacts["Taxi"]?[indexPath.row].Name ?? ""
            cell.subTitleLabel.text = Contacts["Taxi"]?[indexPath.row].sub1 ?? ""
            cell.number = Contacts["Taxi"]?[indexPath.row].number
            cell.contact = Contacts["Taxi"]?[indexPath.row]
        }else if screen?.elementsEqual("link") ?? "".elementsEqual("link"){
            cell.callBtn.isHidden = true
            cell.titleLabel.text = links[indexPath.row].name ?? ""
            cell.subTitleLabel.text = links[indexPath.row].link ?? ""
        }
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if screen?.elementsEqual("contacts") ?? "".elementsEqual("contacts"){
            guard let number = URL(string: "tel://" + (Contacts[sectionHeaders[indexPath.section]]?[indexPath.row].number)!) else { return }
            if #available(iOS 10, *) {
                UIApplication.shared.open(number)
            } else {
                UIApplication.shared.openURL(number)
            }
        }else if screen?.elementsEqual("taxi") ?? "".elementsEqual("taxi"){
            guard let number = URL(string: "tel://" + (Contacts["Taxi"]?[indexPath.row].number)!) else { return }
            if #available(iOS 10, *) {
                UIApplication.shared.open(number)
            } else {
                UIApplication.shared.openURL(number)
            }
        }else if screen?.elementsEqual("link") ?? "".elementsEqual("link"){
            guard let url = URL(string: links[indexPath.row].link!) else {
                return //be safe
            }
            
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
        
        
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if screen?.elementsEqual("contacts") ?? "".elementsEqual("contacts"){
            return sectionHeaders[section]
        }else if screen?.elementsEqual("taxi") ?? "".elementsEqual("taxi"){
            return "taxi"
        }
        return ""
    }
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.rowHeight = 60
        if(screen?.elementsEqual("link"))!{
            self.title = "Links"
            let ref = Database.database().reference().child("links")
            self.sectionHeaders.append("Links")
            ref.observe(.childAdded, with: { (snapshot) in
                if let dictionary = snapshot.value as? [String : Any]{
                    
                    self.links.append(link(dict: dictionary))
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            })
            return
        }
        let ref = Database.database().reference().child("contacts")
        
        ref.observe(.childAdded, with: { (snapshot) in
            if let dictionary = snapshot.value as? [String : Any]{
                let category = dictionary["type"] as? String ?? ""
                self.sectionHeaders.append(category)
                print(snapshot.ref)
                snapshot.ref.child("contacts").observe(.value, with: { (snap) in
                    
                    for dict in snap.children.allObjects as! [DataSnapshot]{
                        let val = dict as! DataSnapshot
                        let value = val.value as! [String:Any]
                        print(value)
                        self.Contacts.append(contact(dictionary: value), key: category)
                        self.tableView.reloadData()
                    }
                    
                    
                })
            }
        })
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



extension Dictionary where Key == String, Value == Array<contact> {
    
    mutating func append(_ contact:contact, key:String) {
        
        if var value = self[key] {
            
            // if an array exist, append to it
            
            value.append(contact)
            
            self[key] = value
            
        } else {
            
            // create a new array since there is nothing here
            
            self[key] = [contact]
        }
    }
}
