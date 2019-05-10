//
//  ViviViewController.swift
//  Empart
//
//  Created by fernando rosa on 09/05/2019.
//  Copyright © 2019 fernando rosa. All rights reserved.
//

import UIKit

class ViviViewController: UIViewController {

    @IBOutlet weak var viviPulseView: UIView!
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var tourMapButton: UIButton!
    
    var pulse : Pulsing!
    var pulse2 : Pulsing!
    
    var liveTour:TourEmpart!
    
    @IBAction func backButtonAction(_ sender: Any) {
        
        self.pulse.removeFromSuperlayer()
        self.pulse2.removeFromSuperlayer()
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viviPulseView.backgroundColor = UIColor.purple
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.addPulse()
    }
    
    func addPulse()
    {
        self.pulse = Pulsing(numberOfPulses: 50, radius: 300, position: self.viviPulseView.center)
        self.pulse.animationDuration = 0.8
        self.pulse.backgroundColor = UIColor.purple.cgColor
        self.pulse2 = Pulsing(numberOfPulses: 50, radius: 600, position: self.viviPulseView.center)
        self.pulse2.animationDuration = 0.8
        self.pulse2.backgroundColor = UIColor.purple.cgColor
        
        self.view.layer.insertSublayer(self.pulse, below: viviPulseView.layer)
        self.view.layer.insertSublayer(self.pulse2, below: viviPulseView.layer)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Show the navigation bar on other view controllers
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        self.tabBarController?.tabBar.isHidden = false
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
