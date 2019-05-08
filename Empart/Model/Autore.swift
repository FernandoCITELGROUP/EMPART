//
//  Autore.swift
//  Empart
//
//  Created by fernando rosa on 07/05/2019.
//  Copyright © 2019 fernando rosa. All rights reserved.
//

import Foundation

class Autore{
    var nome:String
    var cognome:String
    var nomeDarte:String
    var imagine:String
    
    init() {
        self.nome = ""
        self.cognome = ""
        self.nomeDarte = ""
        self.imagine = ""
    }
    
    init(nome:String, cognome:String, nomeDarte:String, immagine:String) {
        self.nome = nome
        self.cognome = cognome
        self.nomeDarte = nomeDarte
        self.imagine = immagine
    }
}
