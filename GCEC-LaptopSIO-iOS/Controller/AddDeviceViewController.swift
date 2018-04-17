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
    let cellIdentifier = "addDetailCell"
    var screenTypeEdit: Bool!
    var editDetails: [Detail]!
    
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
        if title == "Name"{
            return false
        } else {
            return true
        }
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
                    cell.updateUIForEditWithDetails(detail: editDetails[indexPath.row])
                } else {
                    cell.updateUIForEdit(detail: editDetails[indexPath.row])
                }
            } else {
                if checkForButton(title: titles[indexPath.row]) == true {
                    cell.updateUIForEditWithDetails(detail: editDetails[indexPath.row])
                } else {
                     cell.updateUIForEdit(detail: editDetails[indexPath.row])
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
        return 1
    }

}
