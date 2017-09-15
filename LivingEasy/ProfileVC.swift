//
//  ProfileVC.swift
//  LivingEasy
//
//  Created by PRIYESH  on 23/08/17.
//  Copyright © 2017 PRIYESH . All rights reserved.
//

import UIKit

class ProfileVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var societyname: CustomTextField!
    @IBOutlet weak var username: CustomTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        societyname.delegate = self
        username.delegate = self
        // Do any additional setup after loading the view.
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.societyname.resignFirstResponder()
        self.username.resignFirstResponder()
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    
    
    @IBAction func donepressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func cancelpressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)

    }
    
    
    
    }
