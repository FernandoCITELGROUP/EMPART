//
//  MioTour.swift
//  Empart
//
//  Created by fernando rosa on 07/05/2019.
//  Copyright © 2019 fernando rosa. All rights reserved.
//

import Foundation

class MioTour: TourEmpart{
    var data:String
    var tappeVissute:[MiaTappa]
    var nomeMuseo: String
    var citta:String
    
    override init() {
        self.data = ""
        self.tappeVissute = [MiaTappa]()
        self.nomeMuseo = ""
        self.citta = ""
        super.init()
    }
}
