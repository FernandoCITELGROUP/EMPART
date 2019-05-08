//
//  DettaglioMuseoViewController.swift
//  Empart
//
//  Created by fernando rosa on 07/05/2019.
//  Copyright © 2019 fernando rosa. All rights reserved.
//

import UIKit

class DettaglioMuseoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // Outlets
    @IBOutlet weak var toursTableView: UITableView!
    @IBOutlet weak var museoImageView: UIImageView!
    @IBOutlet weak var cittàMuseoLabel: UILabel!
    @IBOutlet weak var btnMaps: UIButton!
    @IBOutlet weak var descrizioneTextView: UITextView!
    
    //Attributes
    var selectedItem:Museo!
    var selectedTour:TourEmpart!
    
    //TableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.selectedItem.toursDisponibili.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tourCell") as! TourTableViewCell
        let item = self.selectedItem.toursDisponibili[indexPath.item]
        cell.nomeTourLabel.text = item.titolo
        cell.copertinaTourImageView.image = UIImage(named: item.copertina)
        cell.dateLabel.text = "Dal \(item.dataInizio) al \(item.dataFine)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedTour = self.selectedItem.toursDisponibili[indexPath.item]
        self.performSegue(withIdentifier: "goToTourDetails", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "goToTourDetails")
        {
            let nextViewController = segue.destination as! DettaglioTourViewController
            nextViewController.selectedItem = self.selectedTour
        }
    }
    
    // Events
    override func viewDidLoad() {
        super.viewDidLoad()

        self.toursTableView.delegate = self
        self.toursTableView.dataSource = self
        self.cittàMuseoLabel.text = "\(self.selectedItem.città) - \(self.selectedItem.indirizzo)"
        self.museoImageView.image = UIImage(named: self.selectedItem.copertina)
        self.navigationItem.title = self.selectedItem.nome
    }
}
