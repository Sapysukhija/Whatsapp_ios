//
//  Chat2ndTableViewCell.swift
//  myWhtsapp
//
//  Created by Sierra 4 on 14/02/17.
//  Copyright © 2017 Sierra 4. All rights reserved.
//

import UIKit

class Chat2ndTableViewCell: UITableViewCell {

    @IBOutlet weak var lblChat2nd: UILabel!
    @IBOutlet var lblTime: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        let date = Date()
        let hour = Calendar.current.component(.hour, from: date)
        let minute=Calendar.current.component(.minute, from: date)
        lblTime.text="\(hour):" + "\(minute)"        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
