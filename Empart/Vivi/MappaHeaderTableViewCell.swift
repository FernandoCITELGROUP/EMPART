//
//  MappaHeaderTableViewCell.swift
//  Empart
//
//  Created by fernando rosa on 24/05/2019.
//  Copyright © 2019 fernando rosa. All rights reserved.
//

import UIKit

class MappaHeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var counterView: CounterView!
    @IBOutlet weak var percentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
