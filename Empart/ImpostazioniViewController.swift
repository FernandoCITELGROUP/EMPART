//
//  ImpostazioniViewController.swift
//  Empart
//
//  Created by fernando rosa on 06/05/2019.
//  Copyright © 2019 fernando rosa. All rights reserved.
//

import UIKit

class ImpostazioniViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.customizeNavAndTab()
    }
    

    @IBOutlet weak var switchConserva: UISwitch!
    @IBOutlet weak var switchAudio: UISwitch!
    @IBOutlet weak var switchBattito: UISwitch!
    
    @IBAction func switchConserva(_ sender: UISwitch) {
        var switchStatus:Bool = true
        if switchConserva.isOn {
            switchStatus = true
        }else{
            switchStatus = false
        }
        print("Conserva \(switchStatus)")
    }
    
    @IBAction func switchAudio(_ sender: UISwitch) {
        var switchStatus:Bool = true
        if switchAudio.isOn {
            switchStatus = true
        }else{
            switchStatus = false
        }
        print("Audio \(switchStatus)")
    }
    
    @IBAction func switchBattito(_ sender: UISwitch) {
        var switchStatus:Bool = true
        if switchBattito.isOn {
            switchStatus = true
        }else{
            switchStatus = false
        }
        print("Conserva \(switchStatus)")
    }

}
