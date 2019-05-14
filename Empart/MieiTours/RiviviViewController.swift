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

class RiviviViewController: UIViewController {

    var selectedItem:MiaTappa!
    @IBOutlet weak var titoloLabel: UILabel!
    @IBOutlet weak var previewVideo: UIImageView!
    @IBOutlet weak var playButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.titoloLabel.text = self.selectedItem.tappa.opera.titolo
        self.previewVideo.image = self.generateThumbnail(path: self.selectedItem!.ricordo.videoGenerato)
        self.view.bringSubviewToFront(self.playButton)
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
