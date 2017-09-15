//
//  Showdetails.swift
//  LivingEasy
//
//  Created by PRIYESH  on 27/08/17.
//  Copyright © 2017 PRIYESH . All rights reserved.
//

import UIKit
import Firebase

struct worker {
    var name : String = ""
    var contact : String = ""
    var ratings : String = ""
    var address : String = ""
    var profileimg :String = ""
}







class Showdetails: UIViewController ,UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var sidebar: UIView!
    
    @IBOutlet weak var titlelabel: UILabel!
    
    @IBOutlet weak var table: UITableView!
    var workers = [worker]()
    var currtitle : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        titlelabel.text = currtitle
        var title = currtitle.lowercased()        
        
        DataServices.ds.allcategory.child(title).observe(.value, with: { (snap) in
            if let snap = snap.value as? Dictionary<String,AnyObject> {
                self.workers.removeAll()
                for each in snap {
                    let val = each.value
                    var newworker = worker()
                    newworker.address = (val["address"] as? String)!
                    newworker.contact = (val["contact"] as? String)!
                    newworker.name = (val["name"] as? String)!
                    newworker.ratings = (val["ratings"] as? String)!
                    newworker.profileimg = (val["profileimg"] as? String)!
                    self.workers.append(newworker)
                }
                self.table.reloadData()
                
            }
            
            
        })

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.workers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ShowDetailCell {
            cell.updatecell(work: self.workers[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
   
    @IBAction func Backpressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func hidesidebar(_ sender: Any) {
        self.sidebar.isHidden = true
        let fram = CGRect(x: self.view.frame.width / 2.3 * -1, y: 0, width: self.view.frame.width / 2.3, height: self.view.bounds.height)
        UIView.animate(withDuration: 0.20) {
            self.sidebar.frame = fram
            self.sidebar.setNeedsDisplay()
        }
        self.sidebar.isHidden = false
    }
    
    

    @IBAction func sidebarpressed(_ sender: Any) {
        let fram = CGRect(x: 0, y: 0, width: self.view.frame.width / 2.3, height: self.view.bounds.height)
        UIView.animate(withDuration: 0.20) {
            self.sidebar.frame = fram
            self.sidebar.setNeedsDisplay()
    }
    }
    
        
        
}
