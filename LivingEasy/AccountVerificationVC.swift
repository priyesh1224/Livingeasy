//
//  AccountVerificationVC.swift
//  LivingEasy
//
//  Created by PRIYESH  on 12/09/17.
//  Copyright © 2017 PRIYESH . All rights reserved.
//

import UIKit
import Firebase

class AccountVerificationVC: UIViewController {

    
    @IBOutlet weak var proofbutton: Custombutton!
    
    @IBOutlet weak var password: CustomTextField!
    
    @IBOutlet weak var confirmpassword: CustomTextField!
    
    
    var model = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        print(model)

        // Do any additional setup after loading the view.
    }

    
    @IBAction func proofverificationpressed(_ sender: Any) {
    }
    
    
    @IBAction func nextpressed(_ sender: Any) {
        
        allowsignup()
    }
    
    
    @IBAction func backpressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func allowsignup()
    {
        
        
    
        var email = model[3]
        var pass = password.text
        var confirm = confirmpassword.text
        print(email)
        print(pass)
        print(confirm)
        if pass == confirm {
            print("1")
            FIRAuth.auth()?.createUser(withEmail: email, password: pass!, completion: { (user, err) in
                if err == nil {
                    print("2")
                    let alert = UIAlertController(title: "Sent your details to admin", message: "Once your admin confirms you as genuine resident,you will get confirmation and your account will get activated ", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "ok", style: .cancel, handler:{ (void) -> Void in
                        self.performSegue(withIdentifier: "signuptologin", sender: nil)  }))
                    self.present(alert, animated: true, completion: nil)
                    let dic = ["society" : self.model[0] , "name" : self.model[1] , "contact" : self.model[2] , "email" : self.model[3] , "password" : pass!]
                    DataServices.ds.allcategory.child("users").childByAutoId().updateChildValues(dic)
                    user?.sendEmailVerification(completion: nil)

                }else {
                    print(err?.localizedDescription)
                }
            })
            
        }
    }
    
        
    func handleerror(error : NSError)
    {
        var header = ""
        var message = ""
        
        if let errcode = FIRAuthErrorCode(rawValue: error.code) {
            switch (errcode) {
                
                
            case .errorCodeInvalidEmail:
                header = "Invalid Email"
                message = "Make sure you type the correct Email"
                break
                
                
            case .errorCodeEmailAlreadyInUse :
                header = "Account already exists"
                message = "The email you trying to signup is already exist"
                break
                
            case .errorCodeNetworkError :
                header = "network error"
                message = "check your internet connection and try again"
                break
                
            case .errorCodeWeakPassword :
                header = "Weak Password"
                message = "Your password should be more than 5 characters long"
                break
            case .errorCodeWrongPassword :
                header = "Wrong Email/Password combination"
                message = "check your emailid or password"
                break
            default:
                header = "Internal Error"
                message = "Try again in sometime"
            }
        }
        let alert = UIAlertController(title: header, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    
    
       override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
