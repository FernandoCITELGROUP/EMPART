//
//  ViviViewController.swift
//  Empart
//
//  Created by fernando rosa on 10/05/2019.
//  Copyright © 2019 fernando rosa. All rights reserved.
//

import UIKit

class ViviViewController: UIViewController {

    //Attribute
    var selectedItem:Tappa!
    
    @IBOutlet weak var autoreLabel: UILabel!
    @IBOutlet weak var titoloOperaLabel: UILabel!
    @IBOutlet weak var annoTecnicaLabel: UILabel!
    @IBOutlet weak var copertinaImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.autoreLabel.text = self.selectedItem.opera.autore.nomeDarte
        self.titoloOperaLabel.text = self.selectedItem.opera.titolo
        self.annoTecnicaLabel.text = "\(self.selectedItem.opera.anno), \(self.selectedItem.opera.tecnica)"
        self.copertinaImage.image = UIImage(named: self.selectedItem.opera.imagine)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        self.tabBarController?.tabBar.isHidden = true
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
