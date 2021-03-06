//
//  TutorialPageViewController.swift
//  Empart
//
//  Created by fernando rosa on 06/05/2019.
//  Copyright © 2019 fernando rosa. All rights reserved.
//

import UIKit

class TutorialPageViewController: UIViewController {
    
    var mainText:String = ""
    var titleOfButton:String = ""
    var imageName:String = ""
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var skipButton: UIButton!
    
    @IBAction func skipAction(_ sender: Any) {
        present( UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "firstViewController") as UIViewController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.skipButton.setTitle(self.titleOfButton, for: .normal)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //let tutorialGif = UIImage.gifImageWithName(self.imageName)
        self.backgroundImage.image = UIImage(named:self.imageName)
    }
}
