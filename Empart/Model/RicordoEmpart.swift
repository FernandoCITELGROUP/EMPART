//
//  RicordoEmpart.swift
//  Empart
//
//  Created by fernando rosa on 07/05/2019.
//  Copyright © 2019 fernando rosa. All rights reserved.
//

import Foundation

class RicordoEmpart{
    var tappa:Tappa
    var ricordo:String
    var esperienza:EsperienzaEmpart
    
    init() {
        self.tappa = Tappa()
        self.ricordo = ""
        self.esperienza = EsperienzaEmpart()
    }
}
