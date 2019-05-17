//
//  DettaglioMuseoViewController.swift
//  Empart
//
//  Created by fernando rosa on 07/05/2019.
//  Copyright © 2019 fernando rosa. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

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
        
        cell.mainView.layer.shadowColor = UIColor.black.cgColor
        cell.mainView.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        cell.mainView.layer.shadowOpacity = 0.2
        cell.mainView.layer.shadowRadius = 4.0
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedTour = self.selectedItem.toursDisponibili[indexPath.item]
        self.performSegue(withIdentifier: "goToTourDetails", sender: self)
    }
    
    // MARK: - Navigation
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
        self.descrizioneTextView.text = self.selectedItem.info
        self.navigationItem.title = self.selectedItem.nome
    }
    
    //Functions
    @IBAction func openMaps(_ sender: Any) {
       
        let latDouble = self.selectedItem.posizione["latitudine"]
        let lat:CLLocationDegrees =  CLLocationDegrees(latDouble!)
        let lngDouble = self.selectedItem.posizione["longitudine"]
        let lng:CLLocationDegrees =  CLLocationDegrees(lngDouble!)
        let source = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: lat, longitude: lng)))
        source.name = self.selectedItem.nome.uppercased()
        MKMapItem.openMaps(with: [source], launchOptions: [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving])
    }
    
}
