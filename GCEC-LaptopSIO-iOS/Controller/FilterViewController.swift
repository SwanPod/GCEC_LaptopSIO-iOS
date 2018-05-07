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
            return cell
        } else{
            return UITableViewCell()
        }
    }
}
