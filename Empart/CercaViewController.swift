//
//  CercaViewController.swift
//  Empart
//
//  Created by fernando rosa on 06/05/2019.
//  Copyright © 2019 fernando rosa. All rights reserved.
//

import UIKit

class CercaViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    var searching = false
    var searchInfo = [String]()
    
    let tableViewData = ["Roma","Napoli","Milano","Torino","Palermo","Città del Vaticano","Musei Capitolini","Museo di Capodimonte", "Real Bosco di Capodimonte", "Musei Vaticani", "Museo Egizio", "Museo dell'Automobile", "Mole Antonelliana", "Colosseo", "Colle Palatino", "Napoli Sotterranea", "Duomo di Milano", "Scuderie del Quirinale", "Museo della Scienza", "Museo del Cinema", "Mostra Pixar"]
    
    //    Outlets
    @IBOutlet weak var tableViewOne: UITableView!
    @IBOutlet weak var searchBarOne: UISearchBar!
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if searching{
            return searchInfo.count
        }else {
            return tableViewData.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "resultCell", for: indexPath)
        
        if searching {
            cell.textLabel?.text = searchInfo[indexPath.row]
        }else{
            cell.textLabel?.text = tableViewData[indexPath.row]
        }
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableViewOne.delegate = self
        self.tableViewOne.dataSource = self
        self.searchBarOne.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        let musei:[Museo] = DataManager.shared().musei
        
        
        searchInfo = tableViewData.filter({$0.prefix(searchText.count) == searchText})
        searching = true
        tableViewOne.reloadData()
    }
}
