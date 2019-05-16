//
//  RilevaBattitoViewController.swift
//  Empart
//
//  Created by fernando rosa on 16/05/2019.
//  Copyright © 2019 fernando rosa. All rights reserved.
//

import UIKit

class RilevaBattitoTableViewController: UITableViewController {
    
    var opzioni:[String] = ["Si","No","Non posso, Watch non rilevato"]

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.opzioni.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "heartCell", for: indexPath) as! MusicaTableViewCell
        
        if(DataManager.shared().opzioneHeartScelta == indexPath.row)
        {
            cell.colorView.backgroundColor =  UIColor.init(red: 70.0/255, green: 71.0/255, blue: 149.0/255, alpha: 1.0)
            cell.containerView.layer.borderColor = UIColor.init(red: 70.0/255, green: 71.0/255, blue: 149.0/255, alpha: 1.0).cgColor
            cell.containerView.layer.borderWidth = 2.0
        }
        else
        {
            cell.colorView.backgroundColor =  UIColor.init(red: 157.0/255, green: 157.0/255, blue: 201.0/255, alpha: 1.0)
            cell.containerView.layer.borderWidth = 0.0
        }
        
        cell.musicaLabel.text = self.opzioni[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        DataManager.shared().opzioneHeartScelta = indexPath.row
        self.navigationController?.popViewController(animated: true)
    }

}
