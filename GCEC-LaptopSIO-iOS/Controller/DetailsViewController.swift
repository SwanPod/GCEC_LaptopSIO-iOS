//
//  DetailsViewController.swift
//  GCEC-LaptopSIO-iOS
//
//  Created by Ryan Carnovsky on 4/11/18.
//  Copyright © 2018 Ryan Carnovsky. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let cellIdentifier = "detailCell"
    let showEditSegueIdentifier = "segueShowEdit"
    var incidentDetails = [Detail]()
    var _sentIncident: Incident!
    
    var sentIncident: Incident {
        get {
            return _sentIncident
        } set {
            _sentIncident = newValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false
        
        incidentDetails.append(Detail(title: "Name", detail: _sentIncident.name))
        incidentDetails.append(Detail(title: "Location", detail: _sentIncident.location))
        incidentDetails.append(Detail(title: "Asset", detail: _sentIncident.asset))
        incidentDetails.append(Detail(title: "Type", detail: _sentIncident.deviceType))
        incidentDetails.append(Detail(title: "Model", detail: _sentIncident.deviceModel))
        incidentDetails.append(Detail(title: "School", detail: _sentIncident.deviceSchool))
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return incidentDetails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ListItemTableViewCell{
            let detail = incidentDetails[indexPath.row]
            cell.updateUI(detail: detail)
            return cell
        } else {
            return UITableViewCell()
        }
    }

    @IBAction func editButtonPressed(_ sender: Any) {
        let edit = true
        performSegue(withIdentifier: showEditSegueIdentifier, sender: edit)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? AddDeviceViewController {
            if let editBool = sender as? Bool {
                destination.screenTypeEdit = editBool
                destination.editDetails = incidentDetails
            }
        }
    }

}
