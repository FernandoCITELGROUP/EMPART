//
//  MappaTappaTableViewCell.swift
//  Empart
//
//  Created by fernando rosa on 24/05/2019.
//  Copyright © 2019 fernando rosa. All rights reserved.
//

import UIKit

class MappaTappaTableViewCell: UITableViewCell {

    @IBOutlet weak var indicatorView: UIView!
    @IBOutlet weak var titoloOperaLabel: UILabel!
    @IBOutlet weak var previewImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
