//
//  ChatIstTableViewCell.swift
//  myWhtsapp
//
//  Created by Sierra 4 on 14/02/17.
//  Copyright © 2017 Sierra 4. All rights reserved.
//

import UIKit

class ChatIstTableViewCell: UITableViewCell {

    @IBOutlet var lblTime: UILabel!
    @IBOutlet weak var lblChatIst: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let date = Date()
        let hour = Calendar.current.component(.hour, from: date)
        let minute=Calendar.current.component(.minute, from: date)
        lblTime.text="\(hour):" + "\(minute)"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
