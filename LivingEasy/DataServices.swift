//
//  DataServices.swift
//  LivingEasy
//
//  Created by PRIYESH  on 29/08/17.
//  Copyright © 2017 PRIYESH . All rights reserved.
//

import UIKit
import Firebase

var str = FIRStorage.storage().reference()
var db = FIRDatabase.database().reference()

class DataServices {
    
    
    static var ds = DataServices()
    private var _model = db.child("model")
    private var _electricians =   db.child("model").child("electricians")
    private var _maids = db.child("model").child("maids")
    private var _plumbers = db.child("model").child("plumbers")
    private var _allcategory = db
    private var _societies = db.child("societies")
    
    
    
    var electricians : FIRDatabaseReference {
        return _electricians
    }
    var maids : FIRDatabaseReference {
        return _maids
    }
    var plumbers : FIRDatabaseReference {
        return _plumbers
    }
    var model : FIRDatabaseReference {
        return _model
    }
    var allcategory : FIRDatabaseReference {
        return _allcategory
    }
    var societies : FIRDatabaseReference {
        return _societies
    }
    
}
