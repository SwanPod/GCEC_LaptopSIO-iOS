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
    @IBOutlet weak var btnPicker: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        btnPicker.isHidden = true
        btnPicker.contentHorizontalAlignment = .right
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
    
    func updateUIForEditWithButon(detail: Detail) {
        btnPicker.isHidden = false
        txtValue.isHidden = true
        lblTitle.text = detail.title
    }
    
    func updateUIForEditWithButton(detail: Detail) {
        btnPicker.isHidden = false
        txtValue.isHidden = true
        lblTitle.text = detail.title
        btnPicker.setTitle(detail.detail, for: .normal)
    }
    
    func updateFromPickerView(text: String) {
        btnPicker.setTitle(text, for: .normal)
    }
    
    func updateUIForAdd(title: String) {
        lblTitle.text = title
    }
    
    func updateUIForAddWithButton(title: String) {
        txtValue.isHidden = true
        btnPicker.isHidden = false
        lblTitle.text = title
    }
    
    func getTitle() -> String {
        return lblTitle.text!
    }

}
