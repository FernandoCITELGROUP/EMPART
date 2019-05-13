//
//  MiaTappa.swift
//  Empart
//
//  Created by fernando rosa on 07/05/2019.
//  Copyright © 2019 fernando rosa. All rights reserved.
//

import Foundation

class MiaTappa{
    var tappa:Tappa
    var ricordo:RicordoEmpart
    
    init() {
        self.tappa = Tappa()
        self.ricordo = RicordoEmpart()
    }
    
    init(tappa:Tappa, ricordo:RicordoEmpart) {
        self.tappa = tappa
        self.ricordo = ricordo
    }
}
