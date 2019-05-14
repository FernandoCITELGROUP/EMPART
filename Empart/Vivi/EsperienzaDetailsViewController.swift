//
//  EsperienzaDetailsViewController.swift
//  Empart
//
//  Created by fernando rosa on 11/05/2019.
//  Copyright © 2019 fernando rosa. All rights reserved.
//

import UIKit
import AVFoundation


class EsperienzaDetailsViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    var esperienza:EsperienzaEmpart!
    
    @IBOutlet weak var fotoTableView: UITableView!
    @IBOutlet weak var audioTableView: UITableView!
    
    // Actions
    @IBAction func chiudiAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(tableView.tag == 1000){
            return self.esperienza.foto.count
        }
        else{
            return self.esperienza.fileAudio.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(tableView.tag == 1000){
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "fotoCell", for: indexPath) as! FotoTableViewCell
            cell.imageView?.image = self.esperienza.foto[indexPath.row]
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "audioCell", for: indexPath) as! AudioTableViewCell
            cell.titoloAudio.text = String(describing: self.esperienza.fileAudio[indexPath.row])
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(tableView.tag == 1001)
        {
            self.playSound(url:self.esperienza.fileAudio[indexPath.row])
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.fotoTableView.delegate = self
        self.fotoTableView.dataSource = self
        self.audioTableView.dataSource = self
        self.audioTableView.delegate = self
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    // Play preview audio
    var player: AVAudioPlayer?
    func playSound(url:URL) {
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            guard let player = player else { return }
            player.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
