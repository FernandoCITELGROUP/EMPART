//
//  ViviViewController.swift
//  Empart
//
//  Created by fernando rosa on 10/05/2019.
//  Copyright © 2019 fernando rosa. All rights reserved.
//

import UIKit

// Enum per la gestinde degli stati della view
enum ViewStatus:Int{
    case Start = 0, Registrazione, Pause, Stop
}

class ViviViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    // Emotional wave
    fileprivate var waterView: YXWaveView?
    @IBOutlet weak var emotionView: UIView!
  
    //Attribute
    var tappaSelezionata:Tappa!
    var immaginiScattate:[UIImage] = [UIImage]()
    var viewStatus:ViewStatus = ViewStatus.Start
    
    // Outlets
    @IBOutlet weak var autoreLabel: UILabel!
    @IBOutlet weak var titoloOperaLabel: UILabel!
    @IBOutlet weak var annoTecnicaLabel: UILabel!
    @IBOutlet weak var copertinaImage: UIImageView!
    
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    
    @IBOutlet weak var startView: UIView!
    @IBOutlet weak var heartButton: UIButton!
    @IBOutlet weak var microfonoButton: UIButton!
    @IBOutlet weak var cameraButton: UIButton!
    @IBOutlet weak var musicButton: UIButton!
    
    var imagePicker: UIImagePickerController!
    
    // Events
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupButtons()
        self.buttonStatus(status: ViewStatus.Start)
        
        self.loadData()
        //self.miaTappa = MiaTappa()
        
        let frame = CGRect(x: 0, y: 0, width: self.emotionView.bounds.size.width, height: self.emotionView.bounds.size.height)
        self.waterView = YXWaveView(frame: frame, color: UIColor.white)
        
        self.waterView!.backgroundColor = UIColor.purple
        self.waterView!.waveSpeed = 1
        self.waterView!.waveHeight = 15
        
        // Add WaveView
        self.emotionView.addSubview(waterView!)
        self.emotionView.bringSubviewToFront(self.copertinaImage)
        self.emotionView.bringSubviewToFront(self.playButton)
        self.emotionView.bringSubviewToFront(self.stopButton)
        self.emotionView.bringSubviewToFront(self.pauseButton)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imagePicker.dismiss(animated: true, completion: nil)
        let image = info[.originalImage] as? UIImage
        self.immaginiScattate.append(image!)
    }

    // Actions
    
    @IBAction func viviAction(_ sender: Any) {
        UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseOut, animations: {
            
            var startViewBottomFrame = self.startView.frame
            startViewBottomFrame.origin.y += startViewBottomFrame.size.height
            
            self.startView.frame = startViewBottomFrame
        }, completion: { finished in
            self.buttonStatus(status: ViewStatus.Registrazione)
            self.waterView!.start()
        })
    }
    
    
    @IBAction func pauseAction(_ sender: Any) {
        self.buttonStatus(status: ViewStatus.Pause)
        self.waterView!.stop()
    }
    
    @IBAction func playAction(_ sender: Any) {
        self.buttonStatus(status: ViewStatus.Registrazione)
        self.waterView!.start()
    }
    
    @IBAction func stopAction(_ sender: Any) {
        self.buttonStatus(status: ViewStatus.Stop)
        self.waterView!.stop()
    }
    
    @IBAction func buttonAction(_ sender: UIButton) {
        let pulse = Pulsing(numberOfPulses: 1, radius: 100, position: sender.center)
        pulse.animationDuration = 0.5
        pulse.backgroundColor = UIColor.purple.cgColor
        self.view.layer.insertSublayer(pulse, below: sender.layer)
    }
    
    
    @IBAction func cameraAction(_ sender: Any) {
        self.imagePicker =  UIImagePickerController()
        self.imagePicker.delegate = self
        self.imagePicker.sourceType = .camera
        
        present(self.imagePicker, animated: true, completion: nil)
    }
    
    //Functions
    func loadData(){
        self.copertinaImage.image = UIImage(named:self.tappaSelezionata.opera.imagine)
        self.titoloOperaLabel.text = self.tappaSelezionata.opera.titolo
        self.autoreLabel.text = self.tappaSelezionata.opera.autore.nomeDarte
        self.annoTecnicaLabel.text = "\(self.tappaSelezionata.opera.anno), \(self.tappaSelezionata.opera.tecnica)"
    }
    
    func setupButtons(){
        self.stopButton.alpha = 0.0
        self.playButton.alpha = 0.0
        self.pauseButton.alpha = 0.0
        
        self.heartButton.layer.borderColor = UIColor.purple.cgColor
        self.microfonoButton.layer.borderColor = UIColor.purple.cgColor
        self.cameraButton.layer.borderColor = UIColor.purple.cgColor
        self.musicButton.layer.borderColor = UIColor.purple.cgColor
    }
    
    func buttonStatus(status:ViewStatus){
        switch status {
        case ViewStatus.Start, ViewStatus.Stop:
            UIView.animate(withDuration: 0.3, animations: {
                self.stopButton.alpha = 0.0
                self.playButton.alpha = 0.0
                self.pauseButton.alpha = 0.0
            })
            break
        case ViewStatus.Registrazione:
            UIView.animate(withDuration: 0.3, animations: {
                self.stopButton.alpha = 0.0
                self.playButton.alpha = 0.0
                self.pauseButton.alpha = 1.0
            })
            break
        case ViewStatus.Pause:
            UIView.animate(withDuration: 0.3, animations: {
                self.stopButton.alpha = 1.0
                self.playButton.alpha = 1.0
                self.pauseButton.alpha = 0.0
            })
            break
        default:
            UIView.animate(withDuration: 0.5, animations: {
                self.stopButton.alpha = 0.0
                self.playButton.alpha = 0.0
                self.pauseButton.alpha = 0.0
            })
        }
    }
}
