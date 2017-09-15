//
//  CustomView.swift
//  LivingEasy
//
//  Created by PRIYESH  on 11/08/17.
//  Copyright © 2017 PRIYESH . All rights reserved.
//

import UIKit

@IBDesignable
class CustomView : UIView {
    
    @IBInspectable var cornerradius : CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = cornerradius
        }
    }
    @IBInspectable var bordwidth : CGFloat = 0.0 {
        didSet {
            self.layer.borderWidth = bordwidth
        }
    }
    @IBInspectable var bordcolor : UIColor = UIColor.clear{
        didSet {
            self.layer.borderColor = bordcolor.cgColor
        }
    }
    @IBInspectable var shadow : CGFloat = 0.0 {
        didSet {
            self.layer.shadowOpacity = Float(shadow)
            let size = CGSize(width: 0, height: 5)
            self.layer.shadowOffset = size
        }
    }
    
    
    
    
    @IBInspectable var shadowcolr : UIColor = UIColor.clear {
        didSet {
            self.layer.shadowColor = shadowcolr.cgColor
        
            
            
        }
    }
    
}
@IBDesignable
class CustomImageView : UIImageView {
    
    @IBInspectable var cornerradius : CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = cornerradius
            self.layer.masksToBounds = true
        }
    }
    @IBInspectable var bordwidth : CGFloat = 0.0 {
        didSet {
            self.layer.borderWidth = bordwidth
        }
    }
    @IBInspectable var bordcolor : UIColor = UIColor.clear{
        didSet {
            self.layer.borderColor = bordcolor.cgColor
        }
    }
    @IBInspectable var shadow : CGFloat = 0.0 {
        didSet {
            self.layer.shadowOpacity = Float(shadow)
            let size = CGSize(width: 0, height: 5)
            self.layer.shadowOffset = size
        }
    }
    @IBInspectable var shadowcolr : UIColor = UIColor.clear {
        didSet {
            self.layer.shadowColor = shadowcolr.cgColor
            
            
            
        }
    }
    
}

@IBDesignable
class Custombutton : UIButton {
    
    @IBInspectable var cornerradius : CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = cornerradius
            self.layer.masksToBounds = true
        }
    }
    @IBInspectable var bordwidth : CGFloat = 0.0 {
        didSet {
            self.layer.borderWidth = bordwidth
        }
    }
    @IBInspectable var bordcolor : UIColor = UIColor.clear{
        didSet {
            self.layer.borderColor = bordcolor.cgColor
        }
    }
    @IBInspectable var shadow : CGFloat = 0.0 {
        didSet {
            self.layer.shadowOpacity = Float(shadow)
            let size = CGSize(width: 0, height: 5)
            self.layer.shadowOffset = size
        }
    }
    @IBInspectable var shadowcolr : UIColor = UIColor.clear {
        didSet {
            self.layer.shadowColor = shadowcolr.cgColor
            
            
            
        }
    }
    
}

@IBDesignable
class CustomTextField : UITextField {
    
    @IBInspectable var cornerradius : CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = cornerradius
            self.layer.masksToBounds = true
        }
    }
    @IBInspectable var bordwidth : CGFloat = 0.0 {
        didSet {
            self.layer.borderWidth = bordwidth
        }
    }
    @IBInspectable var bordcolor : UIColor = UIColor.clear{
        didSet {
            self.layer.borderColor = bordcolor.cgColor
        }
    }
    @IBInspectable var shadow : CGFloat = 0.0 {
        didSet {
            self.layer.shadowOpacity = Float(shadow)
            let size = CGSize(width: 0, height: 5)
            self.layer.shadowOffset = size
        }
    }
    @IBInspectable var shadowcolr : UIColor = UIColor.clear {
        didSet {
            self.layer.shadowColor = shadowcolr.cgColor
            
            
            
        }
    }
    
}



