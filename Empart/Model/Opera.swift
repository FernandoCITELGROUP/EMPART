//
//  Opera.swift
//  Empart
//
//  Created by fernando rosa on 07/05/2019.
//  Copyright © 2019 fernando rosa. All rights reserved.
//

import Foundation

class Opera {
    var titolo:String
    var descrizione:String
    var imagine:String
    var autore:Autore
    var anno:Int
    var tecnica:String
    
    init() {
        self.titolo = ""
        self.descrizione = ""
        self.imagine = ""
        self.autore = Autore()
        self.anno = 0
        self.tecnica = ""
    }
    
    init(titolo:String, descrizione:String, imagine:String, autore:Autore, anno:Int, tecnica:String) {
        self.titolo = titolo
        self.descrizione = descrizione
        self.imagine = imagine
        self.autore = autore
        self.anno = anno
        self.tecnica = tecnica
    }
}
