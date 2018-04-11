//
//  Detail.swift
//  GCEC-LaptopSIO-iOS
//
//  Created by Ryan Carnovsky on 4/11/18.
//  Copyright © 2018 Ryan Carnovsky. All rights reserved.
//

import Foundation

class Detail{
    
    private var _title: String!
    private var _detail: String!
    
    var title: String {
        get {
            return _title
        } set {
            _title = newValue
        }
    }
    var detail: String {
        get {
            return _detail
        } set {
            _detail = newValue
        }
    }
    
    init(title: String, detail: String) {
        _title = title
        _detail = detail
    }
    
}
