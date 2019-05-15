//
//  TappaTableViewCell.swift
//  Empart
//
//  Created by fernando rosa on 08/05/2019.
//  Copyright © 2019 fernando rosa. All rights reserved.
//

import UIKit

class TappaTableViewCell: UITableViewCell {

    @IBOutlet weak var previewImage: UIImageView!
    @IBOutlet weak var titoloTappaLabel: UILabel!
    @IBOutlet weak var pathDownView: UIView!
    @IBOutlet weak var pathUpView: UIView!
    @IBOutlet weak var tappaStatusIndicatorView: UIView!
    
    @IBOutlet weak var imageTrack: UIImageView!
    @IBOutlet weak var geolocal: UIImageView!
    @IBOutlet weak var ibeacon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
