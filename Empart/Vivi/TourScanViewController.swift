//
//  ViviViewController.swift
//  Empart
//
//  Created by fernando rosa on 09/05/2019.
//  Copyright © 2019 fernando rosa. All rights reserved.
//

import UIKit
import CoreLocation

class TourScanViewController: UIViewController, CLLocationManagerDelegate {

    // Outlets
    @IBOutlet weak var viviPulseView: UIView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var tourMapButton: UIButton!
    
    
    // Attributes for animation
    var pulse : Pulsing!
    var pulse2 : Pulsing!
    var pulseColor: UIColor!
    var timer = Timer()
    
    // Attributes for location
    var beaconRegion:CLBeaconRegion!
    var myLocationManager: CLLocationManager!
   
    // Attribute
    var liveTour:TourEmpart!
  
    // Events
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pulseColor = UIColor.purple
        self.viviPulseView.backgroundColor = self.pulseColor
        self.setupLocationManager()
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
        self.pulse.backgroundColor = self.pulseColor.cgColor
        self.pulse2 = Pulsing(numberOfPulses: 1, radius: 600, position: self.viviPulseView.center)
        self.pulse2.animationDuration = 0.8
        self.pulse2.backgroundColor = self.pulseColor.cgColor
        
        self.view.layer.insertSublayer(self.pulse, below: viviPulseView.layer)
        self.view.layer.insertSublayer(self.pulse2, below: viviPulseView.layer)
        
    }
    
    func setupLocationManager(){
        self.myLocationManager = CLLocationManager()
        self.myLocationManager.delegate = self
        self.myLocationManager.requestAlwaysAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways {
            if CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self) {
                if CLLocationManager.isRangingAvailable() {
                    startScanning()
                }
            }
        }
    }
    
    func startScanning() {
        
        // test data
        let tappa = self.liveTour.tappe[0]
        let beaconToFind = tappa.beacon
        
        let uuid = UUID(uuidString: beaconToFind.id)!
        self.beaconRegion = CLBeaconRegion(proximityUUID: uuid, major: CLBeaconMajorValue(beaconToFind.major), minor: CLBeaconMinorValue(beaconToFind.minor), identifier: "MyBeacon")
        
        myLocationManager.startMonitoring(for: self.beaconRegion)
        myLocationManager.startRangingBeacons(in: self.beaconRegion)
    }
    
    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
        if beacons.count > 0 {
            updateDistance(beacons[0].proximity)
        } else {
            updateDistance(.unknown)
        }
    }
    
    func updateDistance(_ distance: CLProximity) {
        print(distance.hashValue)
        switch distance {
            case .immediate:
                self.pulseColor = UIColor.green
                self.goToViviViewController()
            case .unknown:
                self.pulseColor = UIColor.purple
            
            case .far:
                self.pulseColor = UIColor.blue
            
            case .near:
                self.pulseColor = UIColor.green
            
            default:
                self.pulseColor = UIColor.purple
        }
        self.viviPulseView.backgroundColor = self.pulseColor
    }
    
    func goToViviViewController()
    {
        self.myLocationManager.stopMonitoring(for: self.beaconRegion)
        self.myLocationManager.stopRangingBeacons(in: self.beaconRegion)
       
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ViviViewController")
        (nextViewController as! ViviViewController).selectedItem = self.liveTour.tappe[0]
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    // Actions
    @IBAction func backButtonAction(_ sender: Any) {
        
        self.pulse.removeFromSuperlayer()
        self.pulse2.removeFromSuperlayer()
        self.navigationController?.popViewController(animated: true)
    }
}
