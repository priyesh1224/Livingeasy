//
//  Customtablecell.swift
//  LivingEasy
//
//  Created by PRIYESH  on 18/08/17.
//  Copyright © 2017 PRIYESH . All rights reserved.
//

import UIKit

class Customtablecell: UITableViewCell {

    @IBOutlet weak var sender: UILabel!
    
    @IBOutlet weak var complainid: UILabel!
    
    
    @IBOutlet weak var matter: UILabel!
    
    
    @IBOutlet weak var date: UILabel!
    
    
    func updatecell( item : complain)
    {
        self.sender.text = item.sender
        self.complainid.text = "\(item.complainid)"
        self.matter.text = item.matter
        self.date.text = item.date
    }
    
    
}
