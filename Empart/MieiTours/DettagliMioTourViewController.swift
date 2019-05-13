//
//  DettagliMioTourTableViewController.swift
//  Empart
//
//  Created by fernando rosa on 13/05/2019.
//  Copyright © 2019 fernando rosa. All rights reserved.
//

import UIKit

class DettagliMioTourViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //Attributes
    var selectedTour:MioTour!
    var selectedTappa:MiaTappa!
    
    //Outlets
    @IBOutlet weak var tappeTableVIew: UITableView!
    @IBOutlet weak var copertinaImage: UIImageView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.selectedTour.tappeVissute.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "miaTappaCell") as! MiaTappaTableViewCell
        let item = self.selectedTour.tappe[indexPath.item]
        cell.pathUpView.isHidden = indexPath.item == 0 ? true : false
        cell.pathDownView.isHidden = indexPath.item == (self.selectedTour.tappe.count - 1) ? true : false
        cell.titoloTappaLabel.text = item.opera.titolo
        cell.previewImage.image = UIImage(named: item.copertina)
        return cell
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tappeTableVIew.delegate = self
        self.tappeTableVIew.dataSource = self
        self.copertinaImage.image = UIImage(named: self.selectedTour.copertina)
        self.navigationItem.title = self.selectedTour.data
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedTappa = self.selectedTour.tappeVissute[indexPath.row]
        performSegue(withIdentifier: "goToRiviviTappa", sender: self)
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "goToRiviviTappa")
        {
            let nextViewController = segue.destination as! RiviviViewController
            nextViewController.selectedItem = self.selectedTappa
        }
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
