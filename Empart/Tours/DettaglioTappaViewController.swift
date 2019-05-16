//
//  DettaglioTappaViewController.swift
//  Empart
//
//  Created by fernando rosa on 08/05/2019.
//  Copyright © 2019 fernando rosa. All rights reserved.
//

import UIKit

class DettaglioTappaViewController: UIViewController {
    
    // Attributes
    var selectedItem:Tappa!
    
    // Outlets
    @IBOutlet weak var previewImage: UIImageView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var titoloLabel: UILabel!
    
    // Actions
    @IBAction func chiudiButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // Events
    override func viewDidLoad() {
        super.viewDidLoad()

        self.previewImage.image = UIImage(named:self.selectedItem.opera.imagine)
        self.titoloLabel.text = self.selectedItem.opera.titolo
        self.textView.text = self.selectedItem.opera.descrizione
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
