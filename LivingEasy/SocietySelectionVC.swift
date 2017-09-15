//
//  SocietySelectionVC.swift
//  LivingEasy
//
//  Created by PRIYESH  on 12/09/17.
//  Copyright © 2017 PRIYESH . All rights reserved.
//

import UIKit

class SocietySelectionVC: UIViewController {
    
    
    @IBOutlet weak var societyname: CustomTextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        societyname.text = "Star Shine Society"
        societyname.isEnabled = false
        
        // Do any additional setup after loading the view.
    }

    
    @IBAction func NextPressed(_ sender: Any) {
        
        if let text = societyname.text {
            if text != "" || text != " " {
                performSegue(withIdentifier: "societytologin", sender: nil )
            }
        }
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "societytologin" {
        if let segue = segue.destination as? LoginVC {
            segue.model.append("\(societyname.text!)")
        }
    }
    }
    

}
