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
        
        let inc1 = Incident(name: "TI-1104-04", location: "Data Center", asset: "08317")
        let inc2 = Incident(name: "RI-S103-24", location: "Tech Office", asset: "03415")
        let inc3 = Incident(name: "EI-W124-06", location: "Tech Office", asset: "02745")
        let inc4 = Incident(name: "CI-300-S03", location: "HP Service", asset: "09376")
        let inc5 = Incident(name: "TI-1206-05", location: "Data Center", asset: "06284")
        
        incidents.append(inc1)
        incidents.append(inc2)
        incidents.append(inc3)
        incidents.append(inc4)
        incidents.append(inc5)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
