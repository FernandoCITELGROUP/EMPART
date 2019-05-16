//
//  Tappa.swift
//  Empart
//
//  Created by fernando rosa on 07/05/2019.
//  Copyright © 2019 fernando rosa. All rights reserved.
//

import Foundation

enum StatoTappa:Int{
    case Disponibile = 0, DaVisitare, Visitata, Successiva, Indefinito
}

enum TipoLocalizzazione:Int{
    case Beacon = 0, Posizione, Indefinito
}

class Tappa{
    var opera:Opera
    var status:StatoTappa
    var ordine:Int
    var tipoLocalizzazione:TipoLocalizzazione
    var beacon:Beacon
    var posizione:Dictionary<String,Double>
    var copertina:String
    var imageToTrack:String
    var contenutoInedito:[String]
    
    
    init() {
        self.opera = Opera()
        self.status = StatoTappa.Indefinito
        self.ordine = -1
        self.tipoLocalizzazione = TipoLocalizzazione.Indefinito
        self.beacon = Beacon()
        self.posizione = Dictionary<String,Double>()
        self.copertina = ""
        self.imageToTrack = ""
        self.contenutoInedito = [String]()
    }
    
    init(opera:Opera,status:StatoTappa,ordine:Int,tipoLocalizzazione:TipoLocalizzazione,beacon:Beacon,posizione:Dictionary<String,Double>, copertina:String, imageToTrack:String) {
        self.opera = opera
        self.status = status
        self.ordine = ordine
        self.tipoLocalizzazione = tipoLocalizzazione
        self.beacon = beacon
        self.posizione = posizione
        self.copertina = copertina
        self.imageToTrack = imageToTrack
        self.contenutoInedito = [String]()
    }
}
