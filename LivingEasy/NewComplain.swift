//
//  NewComplain.swift
//  LivingEasy
//
//  Created by PRIYESH  on 19/08/17.
//  Copyright © 2017 PRIYESH . All rights reserved.
//

import UIKit

class NewComplain: UIViewController ,UITextFieldDelegate{

    @IBOutlet weak var sidebar: UIView!
    @IBOutlet weak var complaincontent: UITextView!
    @IBOutlet weak var subject: UITextField!
    var societyname = "star shine society"
    var userid = "hgrt45g"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        subject.delegate = self
        // Do any additional setup after loading the view.
    }

    @IBAction func backpressed(_ sender: Any) {
        
            self.dismiss(animated: true, completion: nil)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        self.complaincontent.resignFirstResponder()
        self.subject.resignFirstResponder()
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
 
    
    
    
    @IBAction func postpressed(_ sender: Any) {
        if let sub = subject.text,let mess = complaincontent.text {
        let alert = UIAlertController(title: "Complain Submitted to Admin", message: "We will get back to you asap with the solution", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ok", style: .cancel, handler: { (void) -> Void in
            self.dismiss(animated: true, completion: nil)
            }))
        self.present(alert, animated: true, completion: nil)
            var new : Dictionary<String,AnyObject>  = ["sender": "Raj" as AnyObject,  "date": "\(Date())" as AnyObject, "complain": sub as AnyObject, "complainid" : 1 as AnyObject, "solved": false as AnyObject]
           print(new)
            
          DataServices.ds.societies.child(societyname).child("complains").childByAutoId().updateChildValues(new)
            
        }
        else {
            let alert = UIAlertController(title: "Incorrect Information", message: "Please Fill both subject and content", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }

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
