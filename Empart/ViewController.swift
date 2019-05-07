//
//  ViewController.swift
//  Empart
//
//  Created by fernando rosa on 06/05/2019.
//  Copyright © 2019 fernando rosa. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //test data: Collection di musei
    var musei:[Museo]!
    
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
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem:Museo = self.musei[indexPath.item]
    }
    
    //Events
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.createTestData()
        
        self.museiTableView.delegate = self
        self.museiTableView.dataSource = self
    }
    
    //Functions
    func createTestData()
    {
        // test data: Oggetti Museo da aggiungere alla collection di test
        let museo1:Museo = Museo(nome: "CAPODIMONTE", info: "", copertina: "capodimonteCopertina.jpg", toursDisponibili: [TourEmpart](), città: "Napoli", posizione: Dictionary<String,String>())
        museo1.toursDisponibili.append(TourEmpart(titolo: "CARAVAGGIO", descrizione: "", copertina: "tourCaravaggio.png", tappe: [Tappa](), dataInizio:"11/03/2019", dataFine:"20/09/2019"))
        museo1.toursDisponibili.append(TourEmpart(titolo: "ORO ROSSO", descrizione: "", copertina: "tourOroRosso.jpg", tappe: [Tappa](), dataInizio:"06/05/2019", dataFine:"20/12/2019"))
        museo1.toursDisponibili.append(TourEmpart(titolo: "STORIE ANCORA DA SCRIVERE", descrizione: "", copertina: "tourStorie.jpg", tappe: [Tappa](), dataInizio:"01/06/2019", dataFine:"30/09/2019"))
        let museo2:Museo = Museo(nome: "MUSEO ARCHEOLOGICO", info: "", copertina: "museoArcheologicoCopertina.jpg", toursDisponibili: [TourEmpart](), città: "Napoli", posizione: Dictionary<String,String>())
        let museo3:Museo = Museo(nome: "PALAZZO REALE", info: "", copertina: "palazzoRealeCopertina.jpg", toursDisponibili: [TourEmpart](), città: "Napoli", posizione: Dictionary<String,String>())
        let museo4:Museo = Museo(nome: "MUSEI CAPITOLINI", info: "", copertina: "museiCapitoliniCopertina.jpg", toursDisponibili: [TourEmpart](), città: "Roma", posizione: Dictionary<String,String>())
        self.musei = [Museo]()
        self.musei.append(museo1)
        self.musei.append(museo2)
        self.musei.append(museo3)
        self.musei.append(museo4)
    }

}
