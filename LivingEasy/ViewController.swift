//
//  ViewController.swift
//  LivingEasy
//
//  Created by PRIYESH  on 11/08/17.
//  Copyright © 2017 PRIYESH . All rights reserved.
//

import UIKit

struct complain {
    var sender : String = ""
    var date : String = ""
    var matter : String = ""
    var complainid : Int = 0
    var solved : Bool = false
}

class ViewController: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource ,UITableViewDelegate,UITableViewDataSource{

    @IBOutlet weak var signoutbtn: Custombutton!
    @IBOutlet weak var sidebarusername: UILabel!
    @IBOutlet weak var sidebarpicture: CustomImageView!
    @IBOutlet weak var sidebar: UIView!
    @IBOutlet weak var bar: CustomView!
    
    @IBOutlet  weak var tableview: UITableView!
    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var services: UIButton!
    
    @IBOutlet weak var addbtn: Custombutton!
    @IBOutlet weak var complains: UIButton!
    @IBOutlet weak var bookings: UIButton!
    var selected = 0
    var servicesoffered = ["Electricians" , "Maids","Plumbers","Cooks","Milk"]
   static var bookingsdone : Dictionary<String ,String> = ["29-05-2017" : "Birthday-Party"  , "31-05-2017" : "Anniversary" ]
      var complainsmade = [complain]()
    
    var societyname = "star shine society"
    var userid = "hgrt45g"
    
    
    @IBOutlet weak var collectionview: UICollectionView!
    
    @IBOutlet weak var topview: CustomView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("didload")
        self.collectionview.delegate = self
        self.collectionview.dataSource =  self
        self.tableview.delegate = self
        self.tableview.dataSource = self
        segment.isHidden = true
        addbtn.isHidden = true
        collectionview.isHidden = false
        tableview.isHidden = true
        addtestdata()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("appeared")
        tableview.reloadData()
        collectionview.reloadData()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        let fram = CGRect(x: self.view.frame.width / 2.3 * -1, y: 0, width: self.view.frame.width / 2.3, height: self.view.bounds.height)
        UIView.animate(withDuration: 0.20) {
            self.sidebar.frame = fram
            self.sidebar.setNeedsDisplay()
        }

    }

    @IBAction func bookings(_ sender: Any) {
            gotobookings()
            }
    
    func gotobookings()
    {
        self.selected = 1
        collectionview.reloadData()
        self.collectionview.isHidden = false
        self.tableview.isHidden = true
        segment.setTitle("All", forSegmentAt: 0)
        segment.setTitle("My Bookings", forSegmentAt: 1)
        
        segment.isHidden = false
        addbtn.isHidden = false
        UIView.animate(withDuration: 0.10) {
            
            self.bar.frame = CGRect(x: self.bookings.frame.origin.x + 18, y: self.bar.frame.origin.y, width: self.bookings.frame.width, height: self.bar.frame.height)
            self.bar.setNeedsDisplay()
            self.bookings.setTitleColor(UIColor.black, for: .normal)
            self.services.setTitleColor(UIColor.darkGray, for: .normal)
            self.complains.setTitleColor(UIColor.darkGray, for: .normal)
            
        }

    }
    
    @IBAction func complainspressed(_ sender: Any) {
        
        gotocomplain()
    }
    func gotocomplain()
    {
        self.selected = 2
        segment.isHidden = false
        addbtn.isHidden = false
        self.collectionview.isHidden = true
        self.tableview.isHidden = false
        
        segment.setTitle("Pending", forSegmentAt: 0)
        segment.setTitle("Solved", forSegmentAt: 1)
        tableview.reloadData()
        
        UIView.animate(withDuration: 0.10) {
            self.bar.frame = CGRect(x: self.complains.frame.origin.x + 18  , y: self.bar.frame.origin.y, width: self.complains.frame.width, height: self.bar.frame.height)
            
            self.bar.setNeedsDisplay()
            self.bookings.setTitleColor(UIColor.darkGray, for: .normal)
            self.services.setTitleColor(UIColor.darkGray, for: .normal)
            self.complains.setTitleColor(UIColor.black, for: .normal)
            
        }

    }
    
    
    @IBAction func servicestapped(_ sender: Any) {
        
    gotoservice()
   }
    
    func gotoservice()
    {
        selected = 0
        segment.isHidden = true
        addbtn.isHidden = true
        self.collectionview.isHidden = false
        self.tableview.isHidden = true
        collectionview.reloadData()
        UIView.animate(withDuration: 0.10) {
            
            self.bar.frame = CGRect(x: self.services.frame.origin.x + 18  , y: self.bar.frame.origin.y, width: self.services.frame.width, height: self.bar.frame.height)
            
            self.bar.setNeedsDisplay()
            self.bookings.setTitleColor(UIColor.darkGray, for: .normal)
            self.services.setTitleColor(UIColor.black, for: .normal)
            self.complains.setTitleColor(UIColor.darkGray, for: .normal)
            
        }
  
    }
    
    @IBAction func addbtnpressed(_ sender: Any) {
        if selected == 2 {
            performSegue(withIdentifier: "complain", sender: nil)
        }
        else if selected == 1 {
            performSegue(withIdentifier: "booking", sender: nil)
        }
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let title = collectionView.cellForItem(at: indexPath) as? CustomisedCell
        performSegue(withIdentifier: "showdetail", sender: title?.label.text)
        print("clicked")

    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if selected == 0 {
            return servicesoffered.count }
        else {
            return ViewController.bookingsdone.count
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionview.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CustomisedCell
        {
            if selected == 0 {
            cell.updateui(text: servicesoffered[indexPath.row])
            return cell
            }
            else {
                var c = 0
                for ob in ViewController.bookingsdone {
                    if c == indexPath.row {
                        cell.bookingsupdate(key: ob.key, value: ob.value)
                        return cell
                    }
                    c = c+1
                    
                }
            }
        }
        
        return UICollectionViewCell()
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
       // performSegue(withIdentifier: "showdetail", sender: nil )
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return complainsmade.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let tablecell = tableview.dequeueReusableCell(withIdentifier: "complaincell", for: indexPath) as? Customtablecell {
            tablecell.updatecell(item: complainsmade[indexPath.row])
            return tablecell
        }
        return UITableViewCell()
    }
    
    
    @IBAction func sidebarspressed(_ sender: Any) {
        print("sidebar")
        let fram = CGRect(x: 0, y: 0, width: self.view.frame.width / 2.3, height: self.view.bounds.height)
        UIView.animate(withDuration: 0.20) {
            self.sidebar.frame = fram
            self.sidebar.setNeedsDisplay()
        }
    }
    
    
    @IBAction func hidesidebarpressed(_ sender: Any) {
        self.sidebar.isHidden = true
        let fram = CGRect(x: self.view.frame.width / 2.3 * -1, y: 0, width: self.view.frame.width / 2.3, height: self.view.bounds.height)
        UIView.animate(withDuration: 0.20) {
            self.sidebar.frame = fram
            self.sidebar.setNeedsDisplay()
        }
        self.sidebar.isHidden = false

    }
    
    
    
    @IBAction func signoutbtnpressed(_ sender: Any) {
        performSegue(withIdentifier: "hometostart", sender: nil)
    }
    
    
    
    @IBAction func swiperight(_ sender: Any) {
        if selected == 0 {
            gotobookings()
        }else if selected == 1 {
            gotocomplain()
        }
        
    }
    
    
    
    @IBAction func swipeleft(_ sender: Any) {
        if selected == 1 {
            gotoservice()
        }else if selected == 2 {
            gotobookings()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showdetail" {
            if let dest = segue.destination as? Showdetails {
                dest.currtitle = (sender as? String)!
            }
        }

    }
    
    
    
    
    func addtestdata()
    {
        DataServices.ds.societies.child(societyname).child("complains").observe(.value, with: { (snapshot) in
            let snaps = snapshot.value as? Dictionary<String,AnyObject>
            self.complainsmade.removeAll()
            for snap in snaps!  {
                var ssnap = snap.value
                
                let newcomplain = complain(sender: "xyz", date: (ssnap["date"] as? String)!, matter: (ssnap["complain"] as? String)!, complainid: 8, solved: ssnap["solved"] as! Bool)
                    self.complainsmade.append(newcomplain)
            }
            self.tableview.reloadData()
        })
        
        
        
       
    }
    
    
    
}

