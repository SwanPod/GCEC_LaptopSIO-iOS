//
//  Util.swift
//  GCEC-LaptopSIO-iOS
//
//  Created by Ryan Carnovsky on 4/17/18.
//  Copyright © 2018 Ryan Carnovsky. All rights reserved.
//

import Foundation

class Util {
 
    let titles: [String] = ["Name", "Location", "Asset", "Type", "Model", "School"]
    let pickerValuesLocation: [String] = ["Data Center", "Tech Office", "HP Service"]
    let pickerValuesSchool: [String] = ["GCIT", "BBE", "BBR", "BDC"]
    let pickerValuesLaptopModel: [String] = ["6465b", "6475b", "645 G1", "645 G2", "360 11 G2"]
    let pickerValuesDesktopModel: [String] = ["6005", "6305"]
    
    func saveNewIncident(dict: [String:String]) {
        if let path = Bundle.main.path(forResource: "Incidents", ofType: "plist") {
            if FileManager.default.fileExists(atPath: path) {
                let newIncident = NSMutableDictionary(contentsOfFile: path)
                for item in dict {
                    newIncident?.setValue(item.value, forKey: item.key)
                }
                newIncident?.write(toFile: path, atomically: true)
            }
        }
    }
    
    fileprivate func loadData() -> [[String: String]] {
        if let path = Bundle.main.path(forResource: "Incidents", ofType: "plist"){
            if let items = NSArray(contentsOfFile: path) {
                return items as! [[String: String]]
            }
        }
        return [[:]]
    }
    
    func loadDataIntoArray() -> [Incident] {
        var incidents: [Incident] = []
        for item in loadData() {
            incidents.append(Incident(dict: item))
        }
        
        return incidents
    }
    
    
    
}
