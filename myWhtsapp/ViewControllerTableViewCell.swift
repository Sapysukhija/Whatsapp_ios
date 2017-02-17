//
//  ViewControllerTableViewCell.swift
//  myWhtsapp
//
//  Created by Sierra 4 on 13/02/17.
//  Copyright © 2017 Sierra 4. All rights reserved.
//

import UIKit
import ContactsUI


class ViewControllerTableViewCell: UITableViewCell  {
    @IBOutlet weak var lblTwo: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var myImg: UIImageView!
    var input : MyModel? {
        didSet{
            updateUI()
        }
    }
    fileprivate func updateUI(){
        lblName.text=input?.lblName
        lblTwo.text=input?.lblMsg
        myImg.kf.setImage(with: input?.url)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
   
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
