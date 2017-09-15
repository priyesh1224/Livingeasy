//
//  LoginVC.swift
//  LivingEasy
//
//  Created by PRIYESH  on 13/09/17.
//  Copyright © 2017 PRIYESH . All rights reserved.
//

import UIKit
import Firebase

class LoginVC: UIViewController {
    
    @IBOutlet weak var email: CustomTextField!
    
    @IBOutlet weak var pass: CustomTextField!
    
    var model = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func loginpressed(_ sender: Any) {
        allowlogin()
    }

    
    
    @IBAction func signup(_ sender: Any) {
        performSegue(withIdentifier: "logintopersonal", sender: nil )
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "logintopersonal" {
            if let segue = segue.destination as? PersonalDetailsVC {
                
                segue.model.append(self.model[0])
            }
        }

       
    }
    
    func allowlogin()
    {
        var email = self.email.text!
        
        var pass = self.pass.text!
        FIRAuth.auth()?.signIn(withEmail: email, password: pass, completion: { (user, err) in
            
            
            if err == nil
            {
                if (user?.isEmailVerified)!
                {
                    self.performSegue(withIdentifier: "logintohome", sender: nil)
                }else  if(user?.isEmailVerified == false)
                {
                    
                    let alert = UIAlertController(title: "Account not verified", message: "we have sent verification link,follow it to verify your account", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
                    alert.addAction(UIAlertAction(title: "Resend Email", style: .default , handler: { (void) -> Void in
                        user?.sendEmailVerification(completion: { (err) in
                            if err != nil {
                                
                            }
                        })
                    }))
                    
                    self.present(alert, animated: true, completion: nil)
                }
                
                
                
            }else
            {
                
                let error = err as? NSError
                self.handleerror(error: error!)
                
                
                
                
                print("not created")
            }
            
            
        })
        
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


    
    

}
