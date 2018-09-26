//
//  UtilitiesVC.swift
//  DoJMA
//
//  Created by Vandit Jain on 25/09/18.
//  Copyright © 2018 MAC. All rights reserved.
//

import UIKit
import MediaBrowser
import FirebaseDatabase
import Firebase
import FirebaseStorage
import PINRemoteImage
import NVActivityIndicatorView

class UtilitiesVC: UIViewController, MediaBrowserDelegate {
    

    var activityIndicatorView: NVActivityIndicatorView?
    var amessLoaded: Bool = false
    var cmessloaded: Bool = false
    var gajaLoaded: Bool = false
    var fkLoaded: Bool = false
    var rcLoaded: Bool = false
    var iceSpiceLoaded: Bool = false
    var dmessLoaded: Bool = false
    var ancLoaded: Bool = false
    var cncLoaded: Bool = false
    var dncLoaded: Bool = false
    
    var amesstobeshown: Bool = false
    var cmesstobeshown: Bool = false
    var gajatobeshown: Bool = false
    var fktobeshown: Bool = false
    var rctobeshown: Bool = false
    var iceSpicetobeshown: Bool = false
    var dmesstobeshown: Bool = false
    var anctobeshown: Bool = false
    var cnctobeshown: Bool = false
    var dnctobeshown: Bool = false
    
    
    func numberOfMedia(in mediaBrowser: MediaBrowser) -> Int {
        if(selected?.elementsEqual("gaja"))!{
            return self.gaja.count
        }else if(selected?.elementsEqual("amess"))!{
            return self.amess.count
        }else if(selected?.elementsEqual("cmess"))!{
            return self.cmess.count
        }else if(selected?.elementsEqual("redc"))!{
            return self.redchillies.count
        }else if(selected?.elementsEqual("fk"))!{
            return self.foodking.count
        }else if(selected?.elementsEqual("anc"))!{
            return self.anc.count
        }else if(selected?.elementsEqual("cnc"))!{
            return self.cnc.count
        }else if(selected?.elementsEqual("icespice"))!{
            return self.icenspice.count
        }else if(selected?.elementsEqual("dmess"))!{
            return self.dmess.count
        }else if(selected?.elementsEqual("dnc"))!{
            return self.dnc.count
        }
        return 5
    }
    
    func media(for mediaBrowser: MediaBrowser, at index: Int) -> Media {
        if (selected?.elementsEqual("gaja"))!{
            return Media(image: gaja[index])
        }else if (selected?.elementsEqual("amess"))!{
            return Media(image: amess[index])
        }else if (selected?.elementsEqual("cmess"))!{
            return Media(image: cmess[index])
        }else if (selected?.elementsEqual("fk"))!{
            return Media(image: foodking[index])
        }else if (selected?.elementsEqual("redc"))!{
            return Media(image: redchillies[index])
        }else if(selected?.elementsEqual("anc"))!{
            return Media(image: anc[index])
        }else if(selected?.elementsEqual("cnc"))!{
            return Media(image: cnc[index])
        }else if(selected?.elementsEqual("icespice"))!{
            return Media(image: icenspice[index])
        }else if(selected?.elementsEqual("dmess"))!{
            return Media(image: dmess[index])
        }else if(selected?.elementsEqual("dnc"))!{
            return Media(image: dnc[index])
        }
        return Media(image: UIImage(named: "bitzfeed")!)
    }
    
    func thumbnail(for mediaBrowser: MediaBrowser, at index: Int) -> Media {
        if (selected?.elementsEqual("gaja"))!{
            return Media(image: gaja[index])
        }else if (selected?.elementsEqual("amess"))!{
            return Media(image: amess[index])
        }else if (selected?.elementsEqual("cmess"))!{
            return Media(image: cmess[index])
        }else if (selected?.elementsEqual("fk"))!{
            return Media(image: foodking[index])
        }else if (selected?.elementsEqual("redc"))!{
            return Media(image: redchillies[index])
        }else if(selected?.elementsEqual("anc"))!{
            return Media(image: anc[index])
        }else if(selected?.elementsEqual("cnc"))!{
            return Media(image: cnc[index])
        }else if(selected?.elementsEqual("icespice"))!{
            return Media(image: icenspice[index])
        }else if(selected?.elementsEqual("dmess"))!{
            return Media(image: dmess[index])
        }else if(selected?.elementsEqual("dnc"))!{
            return Media(image: dnc[index])
        }
        return Media(image: UIImage(named: "bitzfeed")!)
    }
    
    var selected:String?

    var cmess = [UIImage]()
    var amess = [UIImage]()
    var gaja = [UIImage]()
    var redchillies = [UIImage]()
    var foodking = [UIImage]()
    var icenspice = [UIImage]()
    var anc = [UIImage]()
    var cnc = [UIImage]()
    var dmess = [UIImage]()
    var dnc = [UIImage]()
    
    var screen:String?
    @IBOutlet weak var card1Vies: UIView!
    @IBOutlet weak var cardView2: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicatorView = NVActivityIndicatorView(frame: CGRect(x: self.view.frame.width/2 - 15, y: self.view.frame.height/2 - 15 - (self.navigationController?.navigationBar.frame.height)! , width: 30, height: 30), type: NVActivityIndicatorType.ballPulseSync, color: UIColor(hexString: "#3497FD"), padding: 3)
        self.view.addSubview(activityIndicatorView!)
        card1Vies.layer.masksToBounds = false
        card1Vies.layer.cornerRadius = 20
        card1Vies.layer.shadowColor = UIColor(hexString: "#455B63").cgColor
        card1Vies.layer.shadowOffset = CGSize(width: 0, height: 4)
        card1Vies.layer.shadowRadius = 8
        card1Vies.layer.shadowOpacity = 0.10
        
        cardView2.layer.masksToBounds = false
        cardView2.layer.cornerRadius = 20
        cardView2.layer.shadowColor = UIColor(hexString: "#455B63").cgColor
        cardView2.layer.shadowOffset = CGSize(width: 0, height: 4)
        cardView2.layer.shadowRadius = 8
        cardView2.layer.shadowOpacity = 0.10
        
        getMenus()
        //card1Vies.layer.rasterizationScale = UIScreen.main.scale
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var gajaBtn: UIButton!
    @IBOutlet weak var gajaBtnText: UILabel!
    @IBOutlet weak var foodKingBtn: UIButton!
    @IBOutlet weak var foodKingBtnText: UILabel!
    @IBOutlet weak var aMessBtn: UIButton!
    @IBOutlet weak var aMessBtnText: UILabel!
    @IBOutlet weak var cMessBtn: UIButton!
    @IBOutlet weak var cMessBtnText: UILabel!
    @IBOutlet weak var redChilliesBtn: UIButton!
    @IBOutlet weak var redChilliesBtnText: UILabel!
    @IBOutlet weak var iceNSpiceBtn: UIButton!
    @IBOutlet weak var iceNSpiceBtnText: UILabel!
    @IBOutlet weak var aNCBtn: UIButton!
    @IBOutlet weak var aNCBtnText: UILabel!
    @IBOutlet weak var cNCBtn: UIButton!
    @IBOutlet weak var cNCBtnText: UILabel!
    
    
    @IBAction func contactsPressed(_ sender: Any) {
        
        self.screen = "contacts"
        performSegue(withIdentifier: "showContacts", sender: self)
    }
    
    @IBAction func taxisPressed(_ sender: Any) {
        self.screen = "taxi"
        performSegue(withIdentifier: "showContacts", sender: self)
    }
    @IBAction func gajaPressed(_ sender: Any) {
        
        selected = "gaja"
        if(gajaLoaded){
            let browser = MediaBrowser(delegate: self)
            self.navigationController?.pushViewController(browser, animated: true)
        }
        else{
            gajatobeshown = true
            activityIndicatorView?.startAnimating()
        }
        
    }
    @IBAction func cMessPressed(_ sender: Any) {
        
        selected = "cmess"
        if(cmessloaded){
            let browser = MediaBrowser(delegate: self)
            self.navigationController?.pushViewController(browser, animated: true)
        }
        else{
            cmesstobeshown = true
            activityIndicatorView?.startAnimating()
        }
    }
    @IBAction func aMessPressed(_ sender: Any) {
        selected = "amess"
        if(amessLoaded){
            let browser = MediaBrowser(delegate: self)
            self.navigationController?.pushViewController(browser, animated: true)
        }
        else{
            amesstobeshown = true
            activityIndicatorView?.startAnimating()
        }
    }
    @IBAction func redCPressed(_ sender: Any) {
        selected = "redc"
        if(rcLoaded){
            let browser = MediaBrowser(delegate: self)
            self.navigationController?.pushViewController(browser, animated: true)
        }
        else{
            rctobeshown = true
            activityIndicatorView?.startAnimating()
        }
    }
    @IBAction func iceNSpicePressed(_ sender: Any) {
        selected = "icespice"
        if(iceSpiceLoaded){
            let browser = MediaBrowser(delegate: self)
            self.navigationController?.pushViewController(browser, animated: true)
        }
        else{
            iceSpicetobeshown = true
            activityIndicatorView?.startAnimating()
        }
    }
    
    @IBAction func dNCPressed(_ sender: Any) {
        selected = "dnc"
        if(dncLoaded){
            let browser = MediaBrowser(delegate: self)
            self.navigationController?.pushViewController(browser, animated: true)
        }
        else{
            dnctobeshown = true
            activityIndicatorView?.startAnimating()
        }
    }
    
    @IBAction func dMessPressed(_ sender: Any) {
        selected = "dmess"
        if(dmessLoaded){
            let browser = MediaBrowser(delegate: self)
            self.navigationController?.pushViewController(browser, animated: true)
        }
        else{
            dmesstobeshown = true
            activityIndicatorView?.startAnimating()
        }
    }
    @IBAction func aNCPressed(_ sender: Any) {
        selected = "anc"
        if(ancLoaded){
            let browser = MediaBrowser(delegate: self)
            self.navigationController?.pushViewController(browser, animated: true)
        }
        else{
            anctobeshown = true
            activityIndicatorView?.startAnimating()
        }
    }
    @IBAction func cNCPressed(_ sender: Any) {
        selected = "cnc"
        if(cncLoaded){
            let browser = MediaBrowser(delegate: self)
            self.navigationController?.pushViewController(browser, animated: true)
        }
        else{
            cnctobeshown = true
            activityIndicatorView?.startAnimating()
        }
    }
    @IBAction func scootyRentPressed(_ sender: Any) {
        showAlert()
    }
    @IBAction func campusMapPressed(_ sender: Any) {
        showAlert()
    }
    
    @IBAction func carRentalsPressed(_ sender: Any) {
        showAlert()
    }
    
    @IBAction func linksPressed(_ sender: Any) {
        self.screen = "link"
        performSegue(withIdentifier: "showContacts", sender: self)
    }
    
    
    @IBAction func foodKingPressed(_ sender: Any) {
        selected = "fk"
        if(fkLoaded){
            let browser = MediaBrowser(delegate: self)
            self.navigationController?.pushViewController(browser, animated: true)
        }
        else{
            fktobeshown = true
            activityIndicatorView?.startAnimating()
        }
    }
    
    func initialiseDatabaseToMenus() -> DatabaseReference{
        let ref = Database.database().reference().child("mess")
        return ref
    }
    func getMenus(){
        let storage = Storage.storage()
        initialiseDatabaseToMenus().observe(.childAdded) { (snapshot) in
            if let dict = snapshot.value as? [String: Any]{
                let imageURL = dict["imageUrl"] as? String ?? ""
                let title = dict["title"] as? String ?? ""
                let storageRef = storage.reference(forURL: imageURL)
                let imageView = UIImageView()
                imageView.pin_setImage(from: URL(string: imageURL) , completion: { (result) in
                    var image: UIImage?
                    image = imageView.image
                    print(storageRef)
                    if title.contains("C Mess"){
                        self.cmessloaded = true
                        self.cmess.append(image!)
                        if ((self.activityIndicatorView?.isAnimating)! && self.cmesstobeshown){
                            self.cmesstobeshown = false
                            self.activityIndicatorView?.stopAnimating()
                            let browser = MediaBrowser(delegate: self)
                            self.navigationController?.pushViewController(browser, animated: true)
                        }
                    }else if title.contains("A MESS"){
                        self.amessLoaded = true
                        self.amess.append(image!)
                        if ((self.activityIndicatorView?.isAnimating)! && self.amesstobeshown){
                            self.amesstobeshown = false
                            self.activityIndicatorView?.stopAnimating()
                            let browser = MediaBrowser(delegate: self)
                            self.navigationController?.pushViewController(browser, animated: true)
                        }
                    }else if title.contains("Gajalakshmi"){
                        self.gajaLoaded = true
                        self.gaja.append(image!)
                        if ((self.activityIndicatorView?.isAnimating)! && self.gajatobeshown){
                            self.gajatobeshown = false
                            self.activityIndicatorView?.stopAnimating()
                            let browser = MediaBrowser(delegate: self)
                            self.navigationController?.pushViewController(browser, animated: true)
                        }
                    }else if title.contains("Red Chillies"){
                        self.rcLoaded = true
                        self.redchillies.append(image!)
                        if ((self.activityIndicatorView?.isAnimating)! && self.rctobeshown){
                            self.rctobeshown = false
                            self.activityIndicatorView?.stopAnimating()
                            let browser = MediaBrowser(delegate: self)
                            self.navigationController?.pushViewController(browser, animated: true)
                        }
                    }else if title.contains("Food-King"){
                        self.fkLoaded = true
                        self.foodking.append(image!)
                        if ((self.activityIndicatorView?.isAnimating)! && self.fktobeshown){
                            self.fktobeshown = false
                            self.activityIndicatorView?.stopAnimating()
                            let browser = MediaBrowser(delegate: self)
                            self.navigationController?.pushViewController(browser, animated: true)
                        }
                    }
                    else if title.contains("Ice and Spice"){
                        self.iceSpiceLoaded = true
                        self.icenspice.append(image!)
                        if ((self.activityIndicatorView?.isAnimating)! && self.iceSpicetobeshown){
                            self.iceSpicetobeshown = false
                            self.activityIndicatorView?.stopAnimating()
                            let browser = MediaBrowser(delegate: self)
                            self.navigationController?.pushViewController(browser, animated: true)
                        }
                    }else if title.contains("D Mess"){
                        self.dmessLoaded = true
                        self.dmess.append(image!)
                        if ((self.activityIndicatorView?.isAnimating)! && self.dmesstobeshown){
                            self.dmesstobeshown = false
                            self.activityIndicatorView?.stopAnimating()
                            let browser = MediaBrowser(delegate: self)
                            self.navigationController?.pushViewController(browser, animated: true)
                        }
                    }
                    else if title.contains("C-NC"){
                        self.cncLoaded = true
                        self.cnc.append(image!)
                        if ((self.activityIndicatorView?.isAnimating)! && self.cnctobeshown){
                            self.cnctobeshown = false
                            self.activityIndicatorView?.stopAnimating()
                            let browser = MediaBrowser(delegate: self)
                            self.navigationController?.pushViewController(browser, animated: true)
                        }
                    }
                    else if title.contains("A-NC"){
                        self.ancLoaded = true
                        self.anc.append(image!)
                        if ((self.activityIndicatorView?.isAnimating)! && self.anctobeshown){
                            self.anctobeshown = false
                            self.activityIndicatorView?.stopAnimating()
                            let browser = MediaBrowser(delegate: self)
                            self.navigationController?.pushViewController(browser, animated: true)
                        }
                    }
                    else if title.contains("D-NC"){
                        self.dncLoaded = true
                        self.dnc.append(image!)
                        if ((self.activityIndicatorView?.isAnimating)! && self.dnctobeshown){
                            self.dnctobeshown = false
                            self.activityIndicatorView?.stopAnimating()
                            let browser = MediaBrowser(delegate: self)
                            self.navigationController?.pushViewController(browser, animated: true)
                        }
                    }
                })
                
            }
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showContacts") {
            // initialize new view controller and cast it as your view controller
            let viewController = segue.destination as! ContactsVC
            // your new view controller should have property that will store passed value
            viewController.screen = self.screen
        }
    }
    func showAlert(){
        let alert = UIAlertController(title: "Coming Soon", message: "Look Out For Our Next Update", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
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
