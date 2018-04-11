//
//  Incident.swift
//  GCEC-LaptopSIO-iOS
//
//  Created by Ryan Carnovsky on 4/11/18.
//  Copyright © 2018 Ryan Carnovsky. All rights reserved.
//

import Foundation

class Incident {
    
    private var _name: String!
    private var _location: String!
    private var _asset: String!
    
    var name: String{
        get{
            return _name
        } set {
            _name = newValue
        }
    }
    var location: String{
        get{
            return _location
        } set {
            _location = newValue
        }
    }
    var asset: String{
        get{
            return _asset
        } set {
            _asset = newValue
        }
    }
    
    init(name: String, location: String, asset: String){
        _name = name
        _location = location
        _asset = asset
    }
    
}
