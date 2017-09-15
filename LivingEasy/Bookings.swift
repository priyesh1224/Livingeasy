//
//  Bookings.swift
//  LivingEasy
//
//  Created by PRIYESH  on 14/08/17.
//  Copyright © 2017 PRIYESH . All rights reserved.
//

import UIKit


class Bookings: UIViewController {
    

    var choosenbar = 0 {
        didSet {
            changebar()
        }
    }
    var bar = CustomView()
    
    @IBOutlet weak var upperview: UIView! {
        didSet {
            print("view chnaged")
            makeview()
        }
    }
      

    override func viewDidLoad() {
        super.viewDidLoad()
        makeview()
        
        // Do any additional setup after loading the view.
    }

    func makeview()
    {
        var toprect = CGRect(x: 0, y: 0, width: upperview.bounds.width + 40, height: self.upperview.bounds.height/4)
        //        let path = UIBezierPath(rect: toprect)
        //        UIColor.cyan.setFill()
        //        path.fill()
        //        self.view.addSubview(path)
        
        var topview = UIView(frame: toprect)
        topview.backgroundColor = UIColor.cyan
        self.upperview.addSubview(topview)
        var imrect = CGRect(x: 10, y: 15, width: self.upperview.bounds.width/10, height: topview.bounds.height/3)
        var imview = UIImageView(frame: imrect)
        imview.image = UIImage(named: "bar")
        topview.addSubview(imview)
        var profimrect = CGRect(x: topview.bounds.width * 2.3/3 , y: 15, width: self.upperview.bounds.width/7.5, height: topview.bounds.height/2.9)
        let profileimg = CustomImageView(frame: profimrect)
        profileimg.cornerradius = profimrect.height/2
        profileimg.image = UIImage(named: "pic")
        topview.addSubview(profileimg)
        var servicesrect = CGRect(x: topview.bounds.width/13, y: topview.bounds.height * 0.7, width: topview.bounds.width/4, height: topview.bounds.height/4)
        let servview = UIView(frame: servicesrect)
        topview.addSubview(servview)
        
        
        let services = UILabel(frame: servicesrect)
        var str = "Services"

        var attrstr = NSMutableAttributedString(string: str)
        let textRange = NSMakeRange(0, (attrstr.length))

        attrstr.addAttribute(NSUnderlineStyleAttributeName , value: NSNumber(value : 2) , range: textRange)
        services.text = "Services"
        let tap = UITapGestureRecognizer(target: self, action: #selector(servicesselected))
        tap.numberOfTapsRequired = 1
        tap.isEnabled = true
        servview.addGestureRecognizer(tap)
        topview.addSubview(services)
        
        
        
        
        var bookingsrect = CGRect(x: topview.bounds.width * (2 / 13 + 1 / 4), y: topview.bounds.height * 0.7, width: topview.bounds.width/4, height: topview.bounds.height/4)
        let bookview = UIView(frame: bookingsrect)
        topview.addSubview(bookview)
        let booki = UILabel(frame: bookingsrect)
        booki.text = "Bookings"
        topview.addSubview(booki)
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(bookingsselected))
        tap2.numberOfTapsRequired = 1
        tap2.isEnabled = true
        bookview.addGestureRecognizer(tap2)
        
        
        
        var complainrect = CGRect(x: topview.bounds.width * (2 / 13 + 1 / 4 + 1 / 13 + 1 / 4), y: topview.bounds.height * 0.7, width: topview.bounds.width/4, height: topview.bounds.height/4)
        let compview = UIView(frame: complainrect)
        topview.addSubview(compview)
        let comp = UILabel(frame: complainrect)
        comp.text = "Complains"
        topview.addSubview(comp)
        let tap3 = UITapGestureRecognizer(target: self, action: #selector(complainselected))
        tap3.numberOfTapsRequired = 1
        tap3.isEnabled = true
        compview.addGestureRecognizer(tap3)

        
        
        
    }
    func servicesselected()
    {
            choosenbar = 0
    }
    func bookingsselected() {
        choosenbar = 1
    }
    func complainselected() {
        choosenbar = 2
    }
    
    func updateui()
    {
        
        
        
        
        
        
        
    }
    
    
    
    func changebar() {
        print(":called")
        var toprect = CGRect(x: 0, y: 0, width: upperview.bounds.width , height: self.upperview.bounds.height/4)
        var topview = UIView(frame: toprect)

        var servicesrect = CGRect(x: topview.bounds.width/13.2, y: topview.bounds.height * ( 1.4 / 15 + 0.7 ), width: topview.bounds.width/5.1, height: topview.bounds.height/15.5)
        var bookingsrect = CGRect(x: topview.bounds.width * (2 / 13.2 + 1 / 4) , y: topview.bounds.height * ( 1.4 / 15 + 0.7 ), width: topview.bounds.width/5.1, height: topview.bounds.height/15.5)
        var complainrect = CGRect(x: topview.bounds.width * (2 / 13.2 + 1 / 4 + 1 / 13 + 1 / 4), y: topview.bounds.height * ( 1.4 / 15 + 0.7) , width: topview.bounds.width/5, height: topview.bounds.height/15.5)
        var barrect = CGRect()


                switch choosenbar {
        case 0:
            barrect = servicesrect
                    break
        case 1:
            barrect = bookingsrect
                    break
        case 2 :
            barrect = complainrect
            
            break
            default :
            break
        
        }
        bar.removeFromSuperview()
        bar.frame = barrect
        bar.backgroundColor = UIColor.red
        bar.cornerradius = 5
        self.view.addSubview(bar)
        
        
        
        
    }
    
    
    
}
