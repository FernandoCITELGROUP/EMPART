//
//  ViewController.swift
//  Empart
//
//  Created by fernando rosa on 06/05/2019.
//  Copyright © 2019 fernando rosa. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var museoView: UIView!
    
    //test data: Collection di musei
    var musei:[Museo]!

    //Attribute
    var selectedItem:Museo!
    
    //Outlets
    @IBOutlet weak var museiTableView: UITableView!
    
    //TableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.musei.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "museumCell") as! MuseoTableViewCell
        let item = self.musei[indexPath.item]
        cell.nomeMuseoLabel.text = item.nome
        cell.copertinaMuseoImage.image = UIImage(named: item.copertina)
        cell.cittaMuseoLabel.text = item.città
        
        cell.mainView.layer.shadowColor = UIColor.black.cgColor
        cell.mainView.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        cell.mainView.layer.shadowOpacity = 0.2
        cell.mainView.layer.shadowRadius = 4.0

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedItem = self.musei[indexPath.item]
        self.performSegue(withIdentifier: "goToDetails", sender: self)
    }
    
    //Events
    override func viewDidLoad() {
        super.viewDidLoad()
        self.musei = DataManager.shared().musei
        self.museiTableView.delegate = self
        self.museiTableView.dataSource = self
        
        self.customizeNavAndTab()
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "goToDetails")
        {
            let nextViewController = segue.destination as! DettaglioMuseoViewController
            nextViewController.selectedItem = self.selectedItem
        }
    }
    
    

}
