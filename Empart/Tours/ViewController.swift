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
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedItem = self.musei[indexPath.item]
        self.performSegue(withIdentifier: "goToDetails", sender: self)
    }
    
    //Events
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.createTestData()
        
        self.museiTableView.delegate = self
        self.museiTableView.dataSource = self
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "goToDetails")
        {
            let nextViewController = segue.destination as! DettaglioMuseoViewController
            nextViewController.selectedItem = self.selectedItem
        }
    }
    
    //Functions
    func createTestData()
    {
        // test data: Oggetti Museo da aggiungere alla collection di test
        let museo1:Museo = Museo(nome: "CAPODIMONTE", info: "", copertina: "capodimonteCopertina.jpg", toursDisponibili: [TourEmpart](), città: "Napoli", indirizzo: "Via Miano, 2", posizione: Dictionary<String,String>())
        
        // test data: aggiungo tour caravaggio
        museo1.toursDisponibili.append(TourEmpart(titolo: "CARAVAGGIO", descrizione: "", copertina: "tourCaravaggio.png", tappe: [Tappa](), dataInizio:"11/03/2019", dataFine:"20/09/2019"))
        // test data: aggiungo tappe del tour caravaggio
        museo1.toursDisponibili[0].tappe.append(Tappa(opera: Opera(titolo: "Flagellazione", descrizione: "", imagine: "flag1.png", autore: Autore(), anno: 1607, tecnica: "Olio su tela"), status: StatoTappa.Disponibile, ordine: 1, tipoLocalizzazione: TipoLocalizzazione.Beacon, beacon: Beacon(), posizione: Dictionary<String,String>(), copertina: "flag1th.png"))
        museo1.toursDisponibili[0].tappe.append(Tappa(opera: Opera(titolo: "Flagellazione", descrizione: "", imagine: "flag2.png", autore: Autore(), anno: 1607, tecnica: "Olio su tela"), status: StatoTappa.Disponibile, ordine: 1, tipoLocalizzazione: TipoLocalizzazione.Beacon, beacon: Beacon(), posizione: Dictionary<String,String>(), copertina: "flag2th.png"))
        museo1.toursDisponibili[0].tappe.append(Tappa(opera: Opera(titolo: "Salomè con la testa del Battista", descrizione: "", imagine: "sal1.png", autore: Autore(), anno: 1609, tecnica: "Olio su tela"), status: StatoTappa.Disponibile, ordine: 1, tipoLocalizzazione: TipoLocalizzazione.Beacon, beacon: Beacon(), posizione: Dictionary<String,String>(), copertina: "sal1th.png"))
        museo1.toursDisponibili[0].tappe.append(Tappa(opera: Opera(titolo: "Salomè con la testa del Battista", descrizione: "", imagine: "sal2.png", autore: Autore(), anno: 1609, tecnica: "Olio su tela"), status: StatoTappa.Disponibile, ordine: 1, tipoLocalizzazione: TipoLocalizzazione.Beacon, beacon: Beacon(), posizione: Dictionary<String,String>(), copertina: "sal2th.png"))
        museo1.toursDisponibili[0].tappe.append(Tappa(opera: Opera(titolo: "Martirio di sant’Orsola", descrizione: "", imagine: "mart1.png", autore: Autore(), anno: 1610, tecnica: "Olio su tela"), status: StatoTappa.Disponibile, ordine: 1, tipoLocalizzazione: TipoLocalizzazione.Beacon, beacon: Beacon(), posizione: Dictionary<String,String>(), copertina: "mart1th.png"))
        museo1.toursDisponibili[0].tappe.append(Tappa(opera: Opera(titolo: "San Giovanni Battista", descrizione: "", imagine: "gio1.png", autore: Autore(), anno: 1610, tecnica: "Olio su tela"), status: StatoTappa.Disponibile, ordine: 1, tipoLocalizzazione: TipoLocalizzazione.Beacon, beacon: Beacon(), posizione: Dictionary<String,String>(), copertina: "gio1th.png"))
        
        
        // test data: aggiungo tour oro rosso
        museo1.toursDisponibili.append(TourEmpart(titolo: "ORO ROSSO", descrizione: "", copertina: "tourOroRosso.jpg", tappe: [Tappa](), dataInizio:"06/05/2019", dataFine:"20/12/2019"))
        // test data: aggiungo tour storie ancora da scrivere
        museo1.toursDisponibili.append(TourEmpart(titolo: "STORIE ANCORA DA SCRIVERE", descrizione: "", copertina: "tourStorie.jpg", tappe: [Tappa](), dataInizio:"01/06/2019", dataFine:"30/09/2019"))
        
        let museo2:Museo = Museo(nome: "MUSEO ARCHEOLOGICO", info: "", copertina: "museoArcheologicoCopertina.jpg", toursDisponibili: [TourEmpart](), città: "Napoli", indirizzo: "Piazza Museo, 19", posizione: Dictionary<String,String>())
        let museo3:Museo = Museo(nome: "PALAZZO REALE", info: "", copertina: "palazzoRealeCopertina.jpg", toursDisponibili: [TourEmpart](), città: "Napoli", indirizzo: "Piazza del Plebiscito, 1", posizione: Dictionary<String,String>())
        let museo4:Museo = Museo(nome: "MUSEI CAPITOLINI", info: "", copertina: "museiCapitoliniCopertina.jpg", toursDisponibili: [TourEmpart](), città: "Roma", indirizzo: "Piazza del Campidoglio, 1", posizione: Dictionary<String,String>())
        
        self.musei = [Museo]()
        self.musei.append(museo1)
        self.musei.append(museo2)
        self.musei.append(museo3)
        self.musei.append(museo4)
    }

}
