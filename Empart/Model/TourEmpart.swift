//
//  TourEmpart.swift
//  Empart
//
//  Created by fernando rosa on 07/05/2019.
//  Copyright © 2019 fernando rosa. All rights reserved.
//

import Foundation

class TourEmpart{
    var titolo:String
    var descrizione:String
    var copertina:String
    var tappe:[Tappa]
    var dataInizio:String
    var dataFine:String
    
    init() {
        self.titolo = ""
        self.descrizione = ""
        self.copertina = ""
        self.tappe = [Tappa]()
        self.dataInizio = ""
        self.dataFine = ""
    }
    
    init(titolo:String, descrizione:String, copertina:String, tappe:[Tappa], dataInizio:String, dataFine:String) {
        self.titolo = titolo
        self.descrizione = descrizione
        self.copertina = copertina
        self.tappe = tappe
        self.dataInizio = dataInizio
        self.dataFine = dataFine
    }
}
