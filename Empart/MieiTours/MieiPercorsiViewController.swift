//
//  MieiPercorsiViewController.swift
//  Empart
//
//  Created by fernando rosa on 06/05/2019.
//  Copyright © 2019 fernando rosa. All rights reserved.
//

import UIKit

class MieiPercorsiViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var mieiTourTableView: UITableView!
    var selectedMyTour:MioTour!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataManager.shared().mieiTour.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mieiTourTableView.dequeueReusableCell(withIdentifier: "mioTourCell") as! MioTourTableViewCell
        cell.nomeTourLabel.text = DataManager.shared().mieiTour[indexPath.row].titolo
        cell.nomeMuseoLabel.text = DataManager.shared().mieiTour[indexPath.row].nomeMuseo
        cell.dataTourLabel.text = DataManager.shared().mieiTour[indexPath.row].data
        cell.copertinaImageView.image = UIImage(named: DataManager.shared().mieiTour[indexPath.row].copertina)
        cell.mainView.layer.shadowColor = UIColor.black.cgColor
        cell.mainView.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        cell.mainView.layer.shadowOpacity = 0.2
        cell.mainView.layer.shadowRadius = 4.0
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.customizeNavAndTab()
        self.mieiTourTableView.delegate = self
        self.mieiTourTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedMyTour = DataManager.shared().mieiTour[indexPath.row]
        performSegue(withIdentifier: "goToMyTourDetails", sender: self)
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "goToMyTourDetails")
        {
            let nextViewController = segue.destination as! DettagliMioTourViewController
            nextViewController.selectedTour = self.selectedMyTour
        }
    }

}
