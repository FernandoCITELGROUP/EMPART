//
//  CercaViewController.swift
//  Empart
//
//  Created by fernando rosa on 06/05/2019.
//  Copyright © 2019 fernando rosa. All rights reserved.
//

import UIKit


class SearchResult {
    
    var museoTrovato:Museo
    var visualizzaTour:Bool
    var visualizzaAutore:Bool
    var listaTours:String
    var listaAutori:String
    
    
    init() {
        self.museoTrovato = Museo()
        self.visualizzaAutore = false
        self.visualizzaTour = false
        self.listaTours = ""
        self.listaAutori = ""
    }
    
    init(museo:Museo, visualizzaAutore:Bool, visualizzaTour:Bool) {
        self.museoTrovato = museo
        self.visualizzaAutore = visualizzaAutore
        self.visualizzaTour = visualizzaTour
        self.listaAutori = ""
        self.listaTours = ""
    }
    
}

class CercaViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, UITextFieldDelegate {
    
    
    var museoDaVisualizzare:Museo!
    var searching = false
    var searchInfo = [SearchResult]()
    
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
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "resultCell", for: indexPath)
        
        if searching {
            cell.textLabel?.text = searchInfo[indexPath.row].museoTrovato.nome
            var details:String = ""
            details = searchInfo[indexPath.row].listaTours
            details += searchInfo[indexPath.row].listaAutori
            cell.detailTextLabel?.text = details
        }else{
            cell.textLabel?.text = ""
        }
        return cell
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableViewOne.delegate = self
        self.tableViewOne.dataSource = self
        self.searchBarOne.delegate = self
        self.searchBarOne.placeholder = "Città, Museo, Tour, Autore"
        
        self.customizeNavAndTab()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        searchInfo.removeAll()
        
        var museiTrovati = DataManager.shared().musei.filter{$0.nome.lowercased().contains(searchText.lowercased())}
        if(museiTrovati.count > 0)
        {
            for museo in museiTrovati {
                self.searchInfo.append(SearchResult(museo: museo, visualizzaAutore: false, visualizzaTour: false))
            }
            
        }
        
        museiTrovati = DataManager.shared().musei.filter{$0.città.lowercased().contains(searchText.lowercased())}
        if(museiTrovati.count > 0)
        {
            for museo in museiTrovati {
                self.searchInfo.append(SearchResult(museo: museo, visualizzaAutore: false, visualizzaTour: false))
            }
            
        }
        
        for museo in DataManager.shared().musei{
            
            let tours = museo.toursDisponibili.filter{$0.titolo.lowercased().contains(searchText.lowercased())}
            if tours.count > 0
            {
                let result = SearchResult(museo: museo, visualizzaAutore: false, visualizzaTour: true)
                for tour in tours{
                    result.listaTours += " \(tour.titolo.capitalized),"
                }
                result.listaTours.removeLast()
                self.searchInfo.append(result)
            }
        }
        
        searching = true
        tableViewOne.reloadData()
    }
    
    //    cosa succede quando premo il bottone "cancel"
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.view.endEditing(true)
        searchBarOne.text = nil
        tableViewOne.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.museoDaVisualizzare = self.searchInfo[indexPath.row].museoTrovato
        performSegue(withIdentifier: "goToDettagliMuseo", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "goToDettagliMuseo")
        {
            let nextViewController = segue.destination as! DettaglioMuseoViewController
            nextViewController.selectedItem = self.museoDaVisualizzare
        }
    }
}
