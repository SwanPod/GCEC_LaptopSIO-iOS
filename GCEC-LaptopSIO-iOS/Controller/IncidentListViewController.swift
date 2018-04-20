//
//  IncidentListViewController.swift
//  GCEC-LaptopSIO-iOS
//
//  Created by Ryan Carnovsky on 4/11/18.
//  Copyright © 2018 Ryan Carnovsky. All rights reserved.
//

import UIKit

class IncidentListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let cellIdentifier = "incidentCell"
    let detailsSegueIdentifier = "segueShowDetails"
    var incidents = [Incident]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return incidents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? IncidentTableViewCell {
            let incident = incidents[indexPath.row]
            cell.updateUI(incident: incident)
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        self.tableView.rowHeight = 74
        
        loadDataIntoArray()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    fileprivate func loadData() -> [[String: String]] {
        guard let path = Bundle.main.path(forResource: "Incidents", ofType: "plist"),
            let items = NSArray(contentsOfFile: path) else {
                return[[:]]
        }
        
        return items as! [[String: String]]
    }
    
    func loadDataIntoArray() {
        for item in loadData() {
            incidents.append(Incident(dict: item))
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedIncident = incidents[indexPath.row]
        performSegue(withIdentifier: detailsSegueIdentifier, sender: selectedIncident)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailsViewController {
            if let sendingIncident = sender as? Incident {
                destination.sentIncident = sendingIncident
            }
        }
    }

}
