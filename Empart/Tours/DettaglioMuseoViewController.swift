//
//  DettaglioMuseoViewController.swift
//  Empart
//
//  Created by fernando rosa on 07/05/2019.
//  Copyright © 2019 fernando rosa. All rights reserved.
//

import UIKit

class DettaglioMuseoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var toursTableView: UITableView!
    @IBOutlet weak var museoImageView: UIImageView!
    @IBOutlet weak var nomeMuseoLabel: UILabel!
    @IBOutlet weak var cittàMuseoLabel: UILabel!
    @IBOutlet weak var descrizioneTextView: UITextView!
    
    //Attributes
    var selectedItem:Museo!
    
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
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.toursTableView.delegate = self
        self.toursTableView.dataSource = self
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
