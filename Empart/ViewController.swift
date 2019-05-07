//
//  ViewController.swift
//  Empart
//
//  Created by fernando rosa on 06/05/2019.
//  Copyright © 2019 fernando rosa. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //test data
    let musei:[String] = ["CAPODIMONTE","MUSEI CAPITOLINI"]
    let copertineMusei:[String] = ["capodimonteCopertina.jpg","museiCapitoliniCopertina.jpg"]
    
    //Outlets
    @IBOutlet weak var museiTableView: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.musei.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "museumCell") as! MuseoTableViewCell
        let item = self.musei[indexPath.item]
        cell.nomeMuseoLabel.text = item
        cell.copertinaMuseoImage.image = UIImage(named: self.copertineMusei[indexPath.item])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem = self.musei[indexPath.item]
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.museiTableView.delegate = self
        self.museiTableView.dataSource = self
    }


}

