//
//  RiviviViewController.swift
//  Empart
//
//  Created by fernando rosa on 13/05/2019.
//  Copyright © 2019 fernando rosa. All rights reserved.
//

import UIKit

class RiviviViewController: UIViewController {

    var selectedItem:MiaTappa!
    @IBOutlet weak var titoloLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.titoloLabel.text = self.selectedItem.tappa.opera.titolo
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
