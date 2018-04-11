//
//  IncidentTableViewCell.swift
//  GCEC-LaptopSIO-iOS
//
//  Created by Ryan Carnovsky on 4/11/18.
//  Copyright © 2018 Ryan Carnovsky. All rights reserved.
//

import UIKit

class IncidentTableViewCell: UITableViewCell {

    @IBOutlet weak var lblIncidentName: UILabel!
    @IBOutlet weak var lblIncidentLocation: UILabel!
    @IBOutlet weak var lblIncidentAsset: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func updateUI(incident: Incident) {
        lblIncidentName.text = incident.name
        lblIncidentLocation.text = incident.location
        lblIncidentAsset.text = incident.asset
    }

}
