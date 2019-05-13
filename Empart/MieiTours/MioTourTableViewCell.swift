//
//  MioTourTableViewCell.swift
//  Empart
//
//  Created by fernando rosa on 13/05/2019.
//  Copyright © 2019 fernando rosa. All rights reserved.
//

import UIKit

class MioTourTableViewCell: UITableViewCell {

    @IBOutlet weak var nomeMuseoLabel: UILabel!
    @IBOutlet weak var dataTourLabel: UILabel!
    @IBOutlet weak var nomeTourLabel: UILabel!
    @IBOutlet weak var copertinaImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
