//
//  AddDeviceViewController.swift
//  GCEC-LaptopSIO-iOS
//
//  Created by Ryan Carnovsky on 4/12/18.
//  Copyright © 2018 Ryan Carnovsky. All rights reserved.
//

import UIKit

class AddDeviceViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var lblScreenTitle: UILabel!
    @IBOutlet weak var tableView: UITableView!
    let cellIdentifier = "addDetailCell"
    let titles: [String] = ["Name", "Location", "Asset", "Type", "Model", "School"]
    var screenTypeEdit: Bool!
    var editDetails: [Detail]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false
        
        if screenTypeEdit == true {
            lblScreenTitle.text = "Edit Device"
        } else {
            lblScreenTitle.text = "Add Device"
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ListItemTableViewCell {
            if screenTypeEdit == true {
                cell.updateUIForEdit(detail: editDetails[indexPath.row])
            } else {
                cell.updateUIForAdd(title: titles[indexPath.row])
            }
            return cell
        } else {
            return UITableViewCell()
        }
    }

}
