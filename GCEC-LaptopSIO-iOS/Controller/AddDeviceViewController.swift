//
//  AddDeviceViewController.swift
//  GCEC-LaptopSIO-iOS
//
//  Created by Ryan Carnovsky on 4/12/18.
//  Copyright © 2018 Ryan Carnovsky. All rights reserved.
//

import UIKit

class AddDeviceViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIPickerViewDelegate, UIPickerViewDataSource{

    @IBOutlet weak var lblScreenTitle: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var pickerView: UIPickerView!
    let titles: [String] = ["Name", "Location", "Asset", "Type", "Model", "School"]
    let pickerValuesLocation: [String] = ["Data Center", "Tech Office", "HP Service"]
    let pickerValuesSchool: [String] = ["GCIT", "BBE", "BBR", "BDC"]
    let pickerValuesLaptopModel: [String] = ["6465b", "645 G1", "645 G2", "x360"]
    let pickerValuesDesktopModel: [String] = ["6005", "6305"]
    let pickerValuesType: [String] = ["Laptop", "Desktop"]
    let cellIdentifier = "addDetailCell"
    var screenTypeEdit: Bool!
    var editDetails: [Detail]!
    var pickerType: String!
    var pickerDeviceType: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        pickerView.delegate = self
        pickerView.dataSource = self
        tableView.allowsSelection = false
        tableView.rowHeight = 45
        
        if screenTypeEdit == true {
            lblScreenTitle.text = "Edit Device"
        } else {
            lblScreenTitle.text = "Add Device"
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func checkForButton(title: String) -> Bool {
        if title == "Name" || title == "Asset"{
            return false
        } else {
            return true
        }
    }
    
    func doThing(detailType: String) -> String {
        return "String"
    }
    
    @IBAction func pickerButtonClicked(_ sender: Any) {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ListItemTableViewCell {
            if screenTypeEdit == true {
                if checkForButton(title: titles[indexPath.row]) == true {
                    cell.updateUIForEditWithButton(detail: editDetails[indexPath.row])
                } else {
                    cell.updateUIForEdit(detail: editDetails[indexPath.row])
                }
            } else {
                if checkForButton(title: titles[indexPath.row]) == true {
                    cell.updateUIForAddWithButton(title: titles[indexPath.row])
                } else {
                    cell.updateUIForAdd(title: titles[indexPath.row])
                }
            }
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerType == "Location"{
            return pickerValuesLocation.count
        } else if pickerType == "School" {
            return pickerValuesSchool.count
        } else if pickerType == "Type" {
            return pickerValuesType.count
        } else if pickerType == "Model"{
            if pickerDeviceType == "Laptop"{
                return pickerValuesLaptopModel.count
            } else {
                return pickerValuesDesktopModel.count
            }
        } else {
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return doThing(detailType: "String")
    }

}
