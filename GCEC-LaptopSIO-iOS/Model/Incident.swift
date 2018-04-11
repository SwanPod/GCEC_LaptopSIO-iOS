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
    private var _deviceType: String!
    private var _deviceModel: String!
    private var _deviceSchool: String!
    
    var name: String {
        get {
            return _name
        } set {
            _name = newValue
        }
    }
    var location: String {
        get {
            return _location
        } set {
            _location = newValue
        }
    }
    var asset: String {
        get {
            return _asset
        } set {
            _asset = newValue
        }
    }
    var deviceType: String {
        get {
            return _deviceType
        } set {
            _deviceType = newValue
        }
    }
    var deviceModel: String {
        get {
            return _deviceModel
        } set {
            _deviceModel = newValue
        }
    }
    var deviceSchool: String{
        get {
            return _deviceSchool
        } set {
            _deviceSchool = newValue
        }
    }
    
    init(name: String, location: String, asset: String, deviceType: String, deviceModel: String, deviceSchool: String){
        _name = name
        _location = location
        _asset = asset
        _deviceType = deviceType
        _deviceModel = deviceModel
        _deviceSchool = deviceSchool
    }
    
}
