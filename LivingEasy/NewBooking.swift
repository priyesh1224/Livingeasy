//
//  NewBooking.swift
//  LivingEasy
//
//  Created by PRIYESH  on 19/08/17.
//  Copyright © 2017 PRIYESH . All rights reserved.
//

import UIKit

class NewBooking: UIViewController ,UITextFieldDelegate {
    
    
    @IBOutlet weak var subject: UITextField!
    
    @IBOutlet weak var datepicker: UIDatePicker!
    
    @IBOutlet weak var duration: UITextField!
    
    @IBOutlet weak var sidebar: UIView!
    var societyname = "star shine society"
    var userid = "hgrt45g"
    override func viewDidLoad() {
        super.viewDidLoad()
        subject.delegate = self
        duration.delegate = self
        // Do any additional setup after loading the view.
    }

    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    view.endEditing(true)
    self.subject.resignFirstResponder()
    self.duration.resignFirstResponder()
    return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    
    @IBAction func postbtnpressed(_ sender: Any) {
        print(subject.text)
        print(datepicker.date)
        print(duration.text)
        if let sub = subject.text,let date = datepicker.date as? NSDate ,let dur = duration.text {
            let alert = UIAlertController(title: "Booking Submitted to Admin", message: "We will get back to you asap with the confirmation of your booking", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ok", style: .cancel, handler: { (void) -> Void in
                self.dismiss(animated: true, completion: nil)
            }))
            self.present(alert, animated: true, completion: nil)
            
            ViewController.bookingsdone["new"] = sub
            let dict = ["occasion" : subject.text as? String , "date" : "\(datepicker.date)" , "duration" : duration.text as? String , "time" : "3"]
            DataServices.ds.societies.child(societyname).child("bookings").child(userid).child("partyhall").updateChildValues(dict)
            
            
            
        }else {
            let alert = UIAlertController(title: "Incorrect Information", message: "Please Fill all the details", preferredStyle: .alert)
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
