//
//  FilterTableViewCell.swift
//  GCEC-LaptopSIO-iOS
//
//  Created by Ryan Carnovsky on 5/7/18.
//  Copyright © 2018 Ryan Carnovsky. All rights reserved.
//

import UIKit

class FilterTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateUI(value: String) {
        lblTitle.text = value
    }
    
    func getTitle() -> String {
        return lblTitle.text!
    }

}
