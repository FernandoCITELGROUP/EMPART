//
//  MusicaTableViewController.swift
//  Empart
//
//  Created by fernando rosa on 15/05/2019.
//  Copyright © 2019 fernando rosa. All rights reserved.
//

import UIKit

class MusicaTableViewController: UITableViewController {

    var opzioniMusica:[String] = ["Il brano scelto dal museo", "Un breno scelto da me", "Nulla per il momento"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.tabBarController?.tabBar.isHidden = true
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.opzioniMusica.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "musicaCell", for: indexPath) as! MusicaTableViewCell

        if(DataManager.shared().opzioneMusicaScelta == indexPath.row)
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
        
        cell.musicaLabel.text = self.opzioniMusica[indexPath.row]
        return cell
    }
 
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        DataManager.shared().opzioneMusicaScelta = indexPath.row
        self.navigationController?.popViewController(animated: true)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
