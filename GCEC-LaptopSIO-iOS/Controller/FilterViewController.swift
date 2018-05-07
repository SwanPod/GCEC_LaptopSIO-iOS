//
//  FilterViewController.swift
//  GCEC-LaptopSIO-iOS
//
//  Created by Ryan Carnovsky on 5/7/18.
//  Copyright © 2018 Ryan Carnovsky. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let filterCellIdentifier: String = "filterCell"
    var util: Util = Util()
    var selectedFilters: [String]!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return util.pickerValuesSchool.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: filterCellIdentifier, for: indexPath) as? FilterTableViewCell {
            cell.updateUI(value: util.pickerValuesSchool[indexPath.row])
            cell.accessoryType = .none
            return cell
        } else{
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let cell = tableView.cellForRow(at: indexPath) as? FilterTableViewCell
        
        if cell?.accessoryType == UITableViewCellAccessoryType.none {
            cell?.accessoryType = .checkmark
//            selectedFilters.append((cell?.getTitle())!)
        } else {
            cell?.accessoryType = .none
        }
    }
}
