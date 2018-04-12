//
//  AddDetailTableViewCell.swift
//  GCEC-LaptopSIO-iOS
//
//  Created by Ryan Carnovsky on 4/12/18.
//  Copyright © 2018 Ryan Carnovsky. All rights reserved.
//

import UIKit

class AddDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var txtDetailInput: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func updateTitle(title: String) {
        lblTitle.text = title
    }

}
