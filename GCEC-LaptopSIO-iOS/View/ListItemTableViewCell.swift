//
//  ListItemTableViewCell.swift
//  GCEC-LaptopSIO-iOS
//
//  Created by Ryan Carnovsky on 4/11/18.
//  Copyright © 2018 Ryan Carnovsky. All rights reserved.
//

import UIKit

class ListItemTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDetail: UILabel!
    @IBOutlet weak var txtValue: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func updateUI(detail: Detail) {
        lblTitle.text = detail.title
        lblDetail.text = detail.detail
    }
    
    func updateUIForEdit(detail: Detail) {
        lblTitle.text = detail.title
        txtValue.text = detail.detail
    }
    
    func updateUIForAdd(title: String){
        lblTitle.text = title
    }

}
