//
//  Museo.swift
//  Empart
//
//  Created by fernando rosa on 07/05/2019.
//  Copyright © 2019 fernando rosa. All rights reserved.
//


// La classe museo rappresenta una struttura che pubblica su Empart dei tour.
import Foundation

class Museo{
    var nome:String
    var info:String
    var copertina:String
    var toursDisponibili:[TourEmpart]
    var città:String
    var indirizzo:String
    var posizione:Dictionary<String,String>
    
    init() {
        self.nome = ""
        self.info = ""
        self.copertina = ""
        self.toursDisponibili = [TourEmpart]()
        self.città = ""
        self.posizione = Dictionary<String,String>()
        self.indirizzo = ""
    }
    
    init(nome:String, info:String, copertina:String, toursDisponibili:[TourEmpart], città:String, indirizzo:String, posizione:Dictionary<String,String>) {
        self.nome = nome
        self.info = info
        self.copertina = copertina
        self.toursDisponibili = toursDisponibili
        self.città = città
        self.indirizzo = indirizzo
        self.posizione = posizione
    }
}
