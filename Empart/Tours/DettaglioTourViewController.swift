//
//  DettaglioTourViewController.swift
//  Empart
//
//  Created by fernando rosa on 08/05/2019.
//  Copyright © 2019 fernando rosa. All rights reserved.
//

import UIKit

class DettaglioTourViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //Attribute
    var selectedItem:TourEmpart!
    var selectedTappa:Tappa!
    
    //Outlets
    @IBOutlet weak var tappeTableView: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.selectedItem.tappe.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tappaCell") as! TappaTableViewCell
        let item = self.selectedItem.tappe[indexPath.item]
        cell.pathUpView.isHidden = indexPath.item == 0 ? true : false
        cell.pathDownView.isHidden = indexPath.item == (self.selectedItem.tappe.count - 1) ? true : false
        cell.titoloTappaLabel.text = item.opera.titolo
        cell.previewImage.image = UIImage(named: item.copertina)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedTappa = self.selectedItem.tappe[indexPath.item]
        self.performSegue(withIdentifier: "goToTappaDetails", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tappeTableView.delegate = self
        self.tappeTableView.dataSource = self
        self.navigationItem.title = self.selectedItem.titolo
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "goToTappaDetails")
        {
            let nextViewController = segue.destination as! DettaglioTappaViewController
            nextViewController.selectedItem = self.selectedTappa
        }
    }
    

}
