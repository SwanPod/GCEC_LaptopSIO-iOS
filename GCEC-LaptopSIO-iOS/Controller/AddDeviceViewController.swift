//
//  AddDeviceViewController.swift
//  GCEC-LaptopSIO-iOS
//
//  Created by Ryan Carnovsky on 4/12/18.
//  Copyright © 2018 Ryan Carnovsky. All rights reserved.
//

import UIKit

class AddDeviceViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIPickerViewDelegate, UIPickerViewDataSource{

    //MARK: - Outlets
    
    @IBOutlet weak var lblScreenTitle: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var pickerView: UIPickerView!
    
    //MARK: - Variables
    
    let titles: [String] = ["Name", "Location", "Asset", "Type", "Model", "School"]
    let pickerValuesLocation: [String] = ["", "Data Center", "Tech Office", "HP Service"]
    let pickerValuesSchool: [String] = ["", "GCIT", "BBE", "BBR", "BDC", "Shady Lane", "Hubert Building"]
    let pickerValuesLaptopModel: [String] = ["" ,"6475b", "645 G1", "645 G2", "360 11 G2"]
    let pickerValuesDesktopModel: [String] = ["" ,"6005", "6305"]
    let pickerValuesMonitorModel: [String] = ["" ,"VH236", "VH238"]
    let pickerValuesType: [String] = ["", "Laptop", "Desktop", "Monitor"]
    let cellIdentifier = "addDetailCell"
    let util = Util()
    var screenTypeEdit: Bool!
    var editDetails: [Detail]!
    var pickerType: String!
    var pickerDeviceType: String!
    var btnToUpdate: UIButton!
    
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
        
        pickerView.isHidden = true
        pickerView.selectedRow(inComponent: 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - Actions
    
    @IBAction func pickerButtonClicked(_ sender: UIButton) {
        btnToUpdate = sender
        pickerType = titles[sender.tag]
        pickerView.reloadAllComponents()
        pickerView.isHidden = false
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        if screenTypeEdit != true {
            print(getDictionaryForSave())
        } else {
            
        }
    }
    
    //MARK: - Custom Functions
    
    func checkForButton(title: String) -> Bool {
        if title == "Name" || title == "Asset" {
            return false
        } else {
            return true
        }
    }
    
    func getDictionaryForSave() -> [String: String] {
        var newIncident = [String: String]()
        for item in editDetails {
            newIncident[item.title] = item.detail
        }
        return newIncident
    }
    
    //MARK: - Table View Functions
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ListItemTableViewCell {
            cell.btnPicker.tag = indexPath.row
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
    
    //MARK: - Picker View Functions
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerType == "Location" {
            return pickerValuesLocation.count
        } else if pickerType == "School" {
            return pickerValuesSchool.count
        } else if pickerType == "Type" {
            return pickerValuesType.count
        } else if pickerType == "Model"{
            if pickerDeviceType == "Laptop"{
                return pickerValuesLaptopModel.count
            } else if pickerDeviceType == "Dekstop" {
                return pickerValuesDesktopModel.count
            } else {
                return pickerValuesMonitorModel.count
            }
        } else {
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerType == "Location" {
            btnToUpdate.setTitle(pickerValuesLocation[row], for: .normal)
        } else if pickerType == "School" {
            btnToUpdate.setTitle(pickerValuesSchool[row], for: .normal)
        } else if pickerType == "Type" {
            btnToUpdate.setTitle(pickerValuesType[row], for: .normal)
            pickerDeviceType = pickerValuesType[row]
        } else if pickerType == "Model"{
            if pickerDeviceType == "Laptop"{
                btnToUpdate.setTitle(pickerValuesLaptopModel[row], for: .normal)
            } else if pickerDeviceType == "Desktop" {
                btnToUpdate.setTitle(pickerValuesDesktopModel[row], for: .normal)
            } else {
                btnToUpdate.setTitle(pickerValuesMonitorModel[row], for: .normal)
            }
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerType == "Location" {
            return pickerValuesLocation[row]
        } else if pickerType == "School" {
            return pickerValuesSchool[row]
        } else if pickerType == "Type" {
            return pickerValuesType[row]
        } else if pickerType == "Model" {
            if pickerDeviceType == "Laptop" {
                return pickerValuesLaptopModel[row]
            } else if pickerDeviceType == "Desktop" {
                return pickerValuesDesktopModel[row]
            } else {
                return pickerValuesMonitorModel[row]
            }
        } else {
            return "String"
        }
    }

}
