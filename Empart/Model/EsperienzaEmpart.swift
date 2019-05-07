//
//  EsperienzaEMpart.swift
//  Empart
//
//  Created by fernando rosa on 07/05/2019.
//  Copyright © 2019 fernando rosa. All rights reserved.
//

import Foundation
import UIKit

class EsperienzaEmpart {
    var data:Date
    var emozione:Emozione
    var foto:[UIImage]
    var frequenzaBattito:Int
    var audioAttivo:Bool
    var rilevazioneBattitoAttiva:Bool
    var musicaAttiva:Bool
    
    init() {
        self.data = Date()
        self.emozione = Emozione()
        self.foto = [UIImage]()
        self.frequenzaBattito = 0
        self.audioAttivo = false
        self.rilevazioneBattitoAttiva = false
        self.musicaAttiva = false
    }
}
