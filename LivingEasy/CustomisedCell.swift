//
//  CustomisedCell.swift
//  LivingEasy
//
//  Created by PRIYESH  on 17/08/17.
//  Copyright © 2017 PRIYESH . All rights reserved.
//

import UIKit

class CustomisedCell: UICollectionViewCell {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var occasion: UILabel!
    
    func updateui(text : String)
    {
        self.label.text = text
        self.image.image = UIImage(named: text)
        self.occasion.isHidden = true
    }
    
    func bookingsupdate(key : String , value : String)
    {
        self.label.text = key
        self.occasion.text = value
        self.image.image = UIImage(named: value)
        self.occasion.isHidden = false
    }
    
    
    
}
