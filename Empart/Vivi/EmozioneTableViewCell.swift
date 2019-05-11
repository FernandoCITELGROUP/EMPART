//
//  EmozioneTableViewCTableViewCell.swift
//  Empart
//
//  Created by fernando rosa on 11/05/2019.
//  Copyright © 2019 fernando rosa. All rights reserved.
//

import UIKit

class EmozioneTableViewCell: UITableViewCell {

    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var emozioneLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
