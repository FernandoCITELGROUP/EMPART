//
//  ViviViewController.swift
//  Empart
//
//  Created by fernando rosa on 10/05/2019.
//  Copyright © 2019 fernando rosa. All rights reserved.
//

import UIKit
import AVFoundation

// Enum per la gestinde degli stati della view
enum ViewStatus:Int{
    case Start = 0, Registrazione, Pause, Stop
}

class ViviViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, AVAudioRecorderDelegate{

    // Emotional wave
    fileprivate var waterView: YXWaveView?
    @IBOutlet weak var emotionView: UIView!
  
    // Audio
    var recordingSession: AVAudioSession!
    var whistleRecorder: AVAudioRecorder!
    var registrazioneAudioInCorso:Bool = false
    var counterFile:Int = 0
    
    //Attribute
    var tappaSelezionata:Tappa!
    var esperienza:EsperienzaEmpart = EsperienzaEmpart()
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
    
    
    @IBOutlet weak var scartaButton: UIButton!
    @IBOutlet weak var salvaButton: UIButton!
    @IBOutlet weak var viviButton: UIButton!
    @IBOutlet weak var saltaButton: UIButton!
    
    // Events
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupButtons()
        self.buttonStatus(status: ViewStatus.Start)
        self.loadData()
        self.setupWaveAndEmotion()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        self.tabBarController?.tabBar.isHidden = true
        self.waterView!.backgroundColor = UIColor(red: CGFloat(DataManager.shared().esperienza.emozione.colore["R"]!/255), green: CGFloat(DataManager.shared().esperienza.emozione.colore["G"]!/255), blue: CGFloat(DataManager.shared().esperienza.emozione.colore["B"]!/255), alpha: 1.0)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imagePicker.dismiss(animated: true, completion: nil)
        let image = info[.originalImage] as? UIImage
        DataManager.shared().esperienza.foto.append(image!)
    }

    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if !flag {
            finishRecording(success: false)
        }
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
        
        self.viviButton.isHidden = true
        self.saltaButton.isHidden = true
        self.scartaButton.isHidden = false
        self.salvaButton.isHidden = false
        
        UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseOut, animations: {
            
            var startViewBottomFrame = self.startView.frame
            startViewBottomFrame.origin.y -= startViewBottomFrame.size.height
            
            self.startView.frame = startViewBottomFrame
        }, completion: { finished in
            self.emotionView.isUserInteractionEnabled = false
            self.performSegue(withIdentifier: "goToEsperienzaDetails", sender: self)
        })
       
    }
    
    @IBAction func buttonAction(_ sender: UIButton) {
        let pulse = Pulsing(numberOfPulses: 1, radius: 100, position: sender.center)
        pulse.animationDuration = 0.5
        pulse.backgroundColor = UIColor.purple.cgColor
        self.view.layer.insertSublayer(pulse, below: sender.layer)
        
        switch sender.tag {
        case 1001:
            self.imagePicker =  UIImagePickerController()
            self.imagePicker.delegate = self
            self.imagePicker.sourceType = .camera
            present(self.imagePicker, animated: true, completion: nil)
            break
        case 1002:
            if(self.registrazioneAudioInCorso){
                self.finishRecording(success: true)
            }else{
                self.startRecording()
            }
            break
        default:
            print("")
        }
    }
    
    //Functions
    func setupWaveAndEmotion(){
        let frame = CGRect(x: 0, y: 0, width: self.emotionView.bounds.size.width, height: self.emotionView.bounds.size.height)
        self.waterView = YXWaveView(frame: frame, color: UIColor(red: CGFloat(243.0/255), green: CGFloat(241.0/255), blue: CGFloat(226.0/255), alpha: 1.0))
        self.waterView!.backgroundColor = UIColor(red: CGFloat(244.0/255), green: CGFloat(188.0/255), blue: CGFloat(71.0/255), alpha: 1.0)
        self.waterView!.waveSpeed = 1
        self.waterView!.waveHeight = 15
        
        // Add WaveView
        self.emotionView.addSubview(waterView!)
        self.emotionView.bringSubviewToFront(self.copertinaImage)
        self.emotionView.bringSubviewToFront(self.playButton)
        self.emotionView.bringSubviewToFront(self.stopButton)
        self.emotionView.bringSubviewToFront(self.pauseButton)
    }
    
    func loadData(){
        self.copertinaImage.image = UIImage(named:self.tappaSelezionata.opera.imagine)
        self.copertinaImage.layer.borderColor = UIColor(red: 105.0/255, green: 61.0/255, blue: 208.0/255, alpha: 1.0).cgColor
        self.copertinaImage.layer.borderWidth = 3.0
        self.titoloOperaLabel.text = self.tappaSelezionata.opera.titolo
        self.autoreLabel.text = self.tappaSelezionata.opera.autore.nomeDarte
        self.annoTecnicaLabel.text = "\(self.tappaSelezionata.opera.anno), \(self.tappaSelezionata.opera.tecnica)"
        
        DataManager.shared().esperienza.emozione = DataManager.shared().emozioni[0]
    }
    
    func setupButtons(){
        self.stopButton.alpha = 0.0
        self.playButton.alpha = 0.0
        self.pauseButton.alpha = 0.0
        
        self.heartButton.layer.borderColor =  UIColor(red: CGFloat(70.0/255), green: CGFloat(71.0/255), blue: CGFloat(149.0/255), alpha: 1.0).cgColor
        self.microfonoButton.layer.borderColor = UIColor(red: CGFloat(70.0/255), green: CGFloat(71.0/255), blue: CGFloat(149.0/255), alpha: 1.0).cgColor
        self.cameraButton.layer.borderColor = UIColor(red: CGFloat(70.0/255), green: CGFloat(71.0/255), blue: CGFloat(149.0/255), alpha: 1.0).cgColor
        self.musicButton.layer.borderColor = UIColor(red: CGFloat(70.0/255), green: CGFloat(71.0/255), blue: CGFloat(149.0/255), alpha: 1.0).cgColor
        
        let tapEmotion:UITapGestureRecognizer  = UITapGestureRecognizer(target: self, action: #selector(self.changeEmotionManually(_:)))
        self.emotionView.addGestureRecognizer(tapEmotion)
        self.emotionView.isUserInteractionEnabled = true
    }
    
    @objc func changeEmotionManually( _ sender: UITapGestureRecognizer){
        performSegue(withIdentifier: "goToEmotion", sender: self)
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
    
    //Audio recording
    class func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    
    class func getWhistleURL(counter:Int) -> URL {
        return getDocumentsDirectory().appendingPathComponent("file\(counter).m4a")
    }
    
    func startRecording() {
        let audioURL = ViviViewController.getWhistleURL(counter: self.counterFile)
        print(audioURL.absoluteString)
        DataManager.shared().esperienza.fileAudio.append(audioURL)
        let settings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 12000,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]
        
        do {
            whistleRecorder = try AVAudioRecorder(url: audioURL, settings: settings)
            whistleRecorder.delegate = self
            whistleRecorder.record()
            self.registrazioneAudioInCorso = true
        } catch {
            finishRecording(success: false)
        }
    }
    
    func finishRecording(success: Bool) {
        whistleRecorder.stop()
        whistleRecorder = nil
        self.registrazioneAudioInCorso = false
        self.counterFile += 1
        if success {
            print("Record ok")
            //navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(nextTapped))
        } else {
            print("Record failed")
           // let ac = UIAlertController(title: "Record failed", message: "There was a problem recording your whistle; please try again.", preferredStyle: .alert)
            //ac.addAction(UIAlertAction(title: "OK", style: .default))
            //present(ac, animated: true)
        }
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "goToEmotion")
        {
           //let nextViewController = segue.destination as! EmozioniTableViewController
        }
        if(segue.identifier == "goToEsperienzaDetails")
        {
            let nextViewController = segue.destination as! EsperienzaDetailsViewController
            nextViewController.esperienza = DataManager.shared().esperienza
        }
    }
}
