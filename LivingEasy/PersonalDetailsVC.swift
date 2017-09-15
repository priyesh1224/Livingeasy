//
//  PersonalDetailsVC.swift
//  LivingEasy
//
//  Created by PRIYESH  on 12/09/17.
//  Copyright © 2017 PRIYESH . All rights reserved.
//

import UIKit

class PersonalDetailsVC: UIViewController {
    
    
    @IBOutlet weak var name: CustomTextField!
    
    @IBOutlet weak var contact: CustomTextField!
    
    @IBOutlet weak var email: CustomTextField!
    
    
    @IBOutlet weak var flatbtntext: Custombutton!
    
    var model = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func flatselectionpressed(_ sender: Any) {
    }
    
    
    @IBAction func backtologin(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func nextpressed(_ sender: Any) {
        if let nam = name.text , let cont = contact.text ,let emailid = email.text {
            if nam != "" && cont != "" && emailid != "" {
                model.append(nam)
                model.append(cont)
                model.append(emailid)
                performSegue(withIdentifier: "personaltoverification", sender: nil)
            
            if flatbtntext.titleLabel?.text != "..." {
                model.append((flatbtntext.titleLabel?.text)!)
            }else {
                print("Select flat")
            }
            
        }else {
            print("wrong format")
        }
        }
        
        
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let seg = segue.destination as? AccountVerificationVC {
            if segue.identifier == "personaltoverification" {
                seg.model = self.model
            }
        }
        
        
    }
    

}
