//
//  RiviviViewController.swift
//  Empart
//
//  Created by fernando rosa on 13/05/2019.
//  Copyright © 2019 fernando rosa. All rights reserved.
//

import UIKit
import AVKit
import MobileCoreServices

class RiviviViewController: UIViewController, UITextViewDelegate {

    // Attributes
    var selectedItem:MiaTappa!
    
    // Outlets
    @IBOutlet weak var titoloLabel: UILabel!
    @IBOutlet weak var previewVideo: UIImageView!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.titoloLabel.text = self.selectedItem.tappa.opera.titolo
        self.previewVideo.image = self.generateThumbnail(path: self.selectedItem!.ricordo.videoGenerato)
        self.view.bringSubviewToFront(self.playButton)
        
        // setup keyboard event
        NotificationCenter.default.addObserver(self, selector: #selector(RiviviViewController.keyboardWillShow), name:UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(RiviviViewController.keyboardWillHide), name:UIResponder.keyboardWillHideNotification, object: nil)
        self.textView.delegate = self
        // add done button
        let bar = UIToolbar()
        let reset = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneText))
        bar.items = [reset]
        bar.sizeToFit()
        textView.inputAccessoryView = bar
        
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        self.textView.endEditing(true)
    }
    
    @objc func doneText(){
        self.textView.endEditing(true)
    }
    
    @objc func keyboardWillShow(notification:NSNotification) {
        guard let keyboardFrameValue = notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue else {
            return
        }
        let keyboardFrame = view.convert(keyboardFrameValue.cgRectValue, from: nil)
        scrollView.contentOffset = CGPoint(x:0, y:keyboardFrame.size.height)
    }
    
    @objc func keyboardWillHide(notification:NSNotification) {
        scrollView.contentOffset = .zero
    }
    
    @IBAction func playVideo(_ sender: Any) {
        let player = AVPlayer(url: self.selectedItem!.ricordo.videoGenerato)
        let vcPlayer = AVPlayerViewController()
        vcPlayer.player = player
        self.present(vcPlayer, animated: true, completion: {
            vcPlayer.player?.play()
        })
    }
    
    func generateThumbnail(path: URL) -> UIImage? {
        do {
            let asset = AVURLAsset(url: path, options: nil)
            let imgGenerator = AVAssetImageGenerator(asset: asset)
            imgGenerator.appliesPreferredTrackTransform = true
            let cgImage = try imgGenerator.copyCGImage(at: CMTimeMake(value: 0, timescale: 1), actualTime: nil)
            let thumbnail = UIImage(cgImage: cgImage)
            return thumbnail
        } catch let error {
            print("*** Error generating thumbnail: \(error.localizedDescription)")
            return nil
        }
    }

}
