//
//  ShowDetailCell.swift
//  LivingEasy
//
//  Created by PRIYESH  on 27/08/17.
//  Copyright © 2017 PRIYESH . All rights reserved.
//

import UIKit
import Firebase

class ShowDetailCell: UITableViewCell {

    
    @IBOutlet weak var imagedisp: CustomImageView!
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var rev1: CustomView!

    @IBOutlet weak var rev2: CustomView!

    @IBOutlet weak var rev3: CustomView!

    @IBOutlet weak var rev4: CustomView!

    @IBOutlet weak var rev5: CustomView!

    @IBAction func bookpressed(_ sender: Any) {
        print("pressed")
    }
    
    
    func updatecell(work : worker)
    {
        name.text = work.name.capitalized
        let ref = FIRStorage.storage().reference(forURL: work.profileimg)
        ref.data(withMaxSize: 1*1024*1024) { (data , err) in
            if err == nil {
                let img = UIImage(data: data!)
                self.imagedisp.image = img
            }else {
                print("error")
            }
        }
        
        switch work.ratings {
        case "1":
            rev1.backgroundColor = UIColor.init(red: 0, green: 184, blue: 212, alpha: 0.85)
        case "2":
            rev1.backgroundColor = UIColor.init(red: 0, green: 184, blue: 212, alpha: 0.85)
            rev2.backgroundColor = UIColor.init(red: 0, green: 184, blue: 212, alpha: 0.85)
        case "3":
            rev1.backgroundColor = UIColor.init(red: 0, green: 184, blue: 212, alpha: 0.85)
            rev2.backgroundColor = UIColor.init(red: 0, green: 184, blue: 212, alpha: 0.85)
            rev3.backgroundColor = UIColor.init(red: 0, green: 184, blue: 212, alpha: 0.85)
        case "4":
            rev1.backgroundColor = UIColor.init(red: 0, green: 184, blue: 212, alpha: 0.85)
            rev2.backgroundColor = UIColor.init(red: 0, green: 184, blue: 212, alpha: 0.85)
            rev3.backgroundColor = UIColor.init(red: 0, green: 184, blue: 212, alpha: 0.85)
            rev4.backgroundColor = UIColor.init(red: 0, green: 184, blue: 212, alpha: 0.85)
        case "5":
            rev1.backgroundColor = UIColor.init(red: 0, green: 184, blue: 212, alpha: 0.85)
            rev2.backgroundColor = UIColor.init(red: 0, green: 184, blue: 212, alpha: 0.85)
            rev3.backgroundColor = UIColor.init(red: 0, green: 184, blue: 212, alpha: 0.85)
            rev4.backgroundColor = UIColor.init(red: 0, green: 184, blue: 212, alpha: 0.85)
            rev5.backgroundColor = UIColor.init(red: 0, green: 184, blue: 212, alpha: 0.85)
        default:
            break
        }
        
        
        
        
        
    }
    
    
    
    
    

}
