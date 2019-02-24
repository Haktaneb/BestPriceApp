//
//  TableViewCell.swift
//  SchoolElasticApp
//
//  Created by haktan enes biçer on 6.12.2018.
//  Copyright © 2018 haktan enes biçer. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var LastUpDate_lbl: UILabel!
    @IBOutlet var ItemPrize_lbl: UILabel!
    @IBOutlet var ItemName_lbl: UILabel!
    @IBOutlet var MarketName_lbl: UILabel!
    @IBOutlet var Address_lbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
