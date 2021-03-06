//
//  Emozione.swift
//  Empart
//
//  Created by fernando rosa on 07/05/2019.
//  Copyright © 2019 fernando rosa. All rights reserved.
//

import Foundation

class Emozione{
    var nome:String
    var descrizione:String
    var colore:Dictionary<String,Float>
    var imagineIcona:String
    
    init() {
        self.nome = ""
        self.descrizione = ""
        self.colore = Dictionary<String,Float>()
        self.colore["R"] = 0
        self.colore["G"] = 0
        self.colore["B"] = 0
        self.imagineIcona = ""
    }
    
    init(nome:String, descrizione:String, coloreR: Float, coloreG: Float, coloreB: Float, immagineIcona:String) {
        self.nome = nome
        self.descrizione = descrizione
        self.colore = Dictionary<String,Float>()
        self.colore["R"] = coloreR
        self.colore["G"] = coloreG
        self.colore["B"] = coloreB
        self.imagineIcona = immagineIcona
    }
}
