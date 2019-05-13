//
//  MiaTappaTableViewCell.swift
//  Empart
//
//  Created by fernando rosa on 13/05/2019.
//  Copyright © 2019 fernando rosa. All rights reserved.
//

import UIKit

class MiaTappaTableViewCell: UITableViewCell {

    //self.heartButton.layer.borderColor = UIColor.purple.cgColor
    
    @IBOutlet weak var previewImage: UIImageView!
    @IBOutlet weak var titoloTappaLabel: UILabel!
    @IBOutlet weak var pathDownView: UIView!
    @IBOutlet weak var pathUpView: UIView!
    @IBOutlet weak var tappaStatusIndicatorView: UIView!
    @IBOutlet weak var riviviTappaButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
