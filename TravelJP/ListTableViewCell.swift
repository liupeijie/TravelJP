//
//  ListTableViewCell.swift
//  TravelJP
//
//  Created by kojpkn on 2015/10/21.
//  Copyright © 2015年 向日葵会下雨. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    @IBOutlet var spotimage: UIImageView!
    @IBOutlet var label2: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
