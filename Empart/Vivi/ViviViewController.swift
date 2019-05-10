//
//  ViviViewController.swift
//  Empart
//
//  Created by fernando rosa on 09/05/2019.
//  Copyright © 2019 fernando rosa. All rights reserved.
//

import UIKit

class ViviViewController: UIViewController {

    // Outlets
    @IBOutlet weak var viviPulseView: UIView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var tourMapButton: UIButton!
    
    
    // Attributes for animation
    var pulse : Pulsing!
    var pulse2 : Pulsing!
    var timer = Timer()
   
    // Attribute
    var liveTour:TourEmpart!
  
    // Events
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viviPulseView.backgroundColor = UIColor.purple
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.addPulse()
        self.scheduledTimerWithTimeInterval()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.timer.invalidate()
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        self.tabBarController?.tabBar.isHidden = false
    }

    // Functions
    
    func scheduledTimerWithTimeInterval(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.pulseFunction), userInfo: nil, repeats: true)
    }
    
    @objc func pulseFunction(){
        self.addPulse()
    }

    func addPulse()
    {
        if(self.pulse != nil && self.pulse2 != nil){
            self.pulse.removeFromSuperlayer()
            self.pulse2.removeFromSuperlayer()
        }
        
        self.pulse = Pulsing(numberOfPulses: 1, radius: 300, position: self.viviPulseView.center)
        self.pulse.animationDuration = 0.8
        self.pulse.backgroundColor = UIColor.purple.cgColor
        self.pulse2 = Pulsing(numberOfPulses: 1, radius: 600, position: self.viviPulseView.center)
        self.pulse2.animationDuration = 0.8
        self.pulse2.backgroundColor = UIColor.purple.cgColor
        
        self.view.layer.insertSublayer(self.pulse, below: viviPulseView.layer)
        self.view.layer.insertSublayer(self.pulse2, below: viviPulseView.layer)
        
    }
    
    // Actions
    @IBAction func backButtonAction(_ sender: Any) {
        
        self.pulse.removeFromSuperlayer()
        self.pulse2.removeFromSuperlayer()
        self.navigationController?.popViewController(animated: true)
    }
}
